function change(script,element) {
   var ajax = new Ajax.Updater({success: element},script,{method: 'get',evalScripts:true});
}
function changePost(script,element,pbody) {
   var ajax = new Ajax.Updater({success: element},script,{method:'post', postBody:pbody,evalScripts:true});
}

function make_inputs(num){
	url = 'manageajax.php?action=makeinputs&num='+num;
	change(url,'inputs');
}

function show_addtask(id){
	Effect.BlindDown(id);
}
function blindtoggle(id){
	new Effect.toggle(id,'blind');
}

function toggleBlock(id){
	var state = $(id).style.display;
	if(state == "none")
	{
	setCookie(id,'block','30','/','','');
	$(id).style.display = "block";
	$(id + '_toggle').className = 'win_block';
	}
	else if(state == "block" || state == "")
	{
	setCookie(id,'none','30','/','','');
	$(id).style.display = "none";
	$(id + '_toggle').className = 'win_none';
	}
}
function switchClass(id,class1,class2)
{
	try{$($('selectedid').value).className = class2;} catch(e){}
	try{$('selectedid').value = id;
	$($('selectedid').value).className = class1;}
	catch (e){}

}


function changeElements(element,classname){
	var loop = $$(element);

	for(var i=0; i<loop.length; i++){
	  loop[i].className = classname;
	}
}

function makeTimer(funct,duration)
{
	window.setTimeout(funct,duration);
}

function confirmit(text,url)
{
	check = confirm(text);
	url = decodeURI(url);
	if(check == true)
	{
	window.location = url;
}

}
function setCookie( name, value, expires, path, domain, secure )
{
	var today = new Date();
	today.setTime( today.getTime() );
	if ( expires )
	{
	expires = expires * 1000 * 60 * 60 * 24;
	}
	var expires_date = new Date( today.getTime() + (expires) );

	document.cookie = name + "=" +escape( value ) +
	( ( expires ) ? ";expires=" + expires_date.toGMTString() : "" ) +
	( ( path ) ? ";path=" + path : "" ) +
	( ( domain ) ? ";domain=" + domain : "" ) +
	( ( secure ) ? ";secure" : "" );
}

function getnow(field)
{
var currenttime = new Date();
var hours = currenttime.getHours();
var minutes = currenttime.getMinutes();
	if (hours < 10)
	{
		hours = "0" + hours;
	}
	if (minutes < 10)
	{
		minutes = "0" + minutes;
	}
var clocklocation = $(field);
clocklocation.value = hours + ":" + minutes;
}

/* Clock */
function calctime()
{
var currenttime = new Date();
var hours = currenttime.getHours();
var minutes = currenttime.getMinutes();
var seconds = currenttime.getSeconds();
	if (hours < 10)
	{
		hours = "0" + hours;
	}
	if (minutes < 10)
	{
		minutes = "0" + minutes;
	}
	if (seconds < 10)
	{
		seconds = "0" + seconds;
	}
var clocklocation = $("digitalclock");
clocklocation.innerHTML = hours + ":" + minutes + ":" + seconds;
setTimeout("calctime()", 1000);
}

function delRow(table,row)
{
var i = row.parentNode.parentNode.rowIndex;
alert(i);
$(table).deleteRow(i);
}

function delEle(ele)
{
   var ele = $(ele);
    ele.parentNode.removeChild(ele);
 }
function systemMsg(ele)
{
new Effect.Appear(ele, { duration: 2.0 })
makeTimer("new Effect.Fade('"+ele+"', { duration: 2.0 })",6500);
}





function addEngine(url)
{
window.external.AddSearchProvider(url);
}

// accordion.js v2.0
//
// Copyright (c) 2007 stickmanlabs
//
// Accordion is freely distributable under the terms of an MIT-style license.
//

/*-----------------------------------------------------------------------------------------------*/

if (typeof Effect == 'undefined')
	throw("accordion.js requires including script.aculo.us' effects.js library!");

var accordion = Class.create();
accordion.prototype = {

	//
	//  Setup the Variables
	//
	showAccordion : null,
	currentAccordion : null,
	duration : null,
	effects : [],
	animating : false,

	//
	//  Initialize the accordions
	//
	initialize: function(container, options) {
	  if (!$(container)) {
	    throw(container+" doesn't exist!");
	    return false;
	  }

		this.options = Object.extend({
			resizeSpeed : 8,
			classNames : {
				toggle : 'accordion_toggle',
				toggleActive : 'accordion_toggle_active',
				content : 'accordion_content'
			},
			defaultSize : {
				height : null,
				width : null
			},
			direction : 'vertical',
			onEvent : 'click'
		}, options || {});

		this.duration = ((11-this.options.resizeSpeed)*0.15);

		var accordions = $$('#'+container+' .'+this.options.classNames.toggle);
		accordions.each(function(accordion) {
			Event.observe(accordion, this.options.onEvent, this.activate.bind(this, accordion), false);
			if (this.options.onEvent == 'click') {
			  accordion.onclick = function() {return false;};
			}

			if (this.options.direction == 'horizontal') {
				var options = $H({width: '0px'});
			} else {
				var options = $H({height: '0px'});
			}
			options.merge({display: 'none'});

			this.currentAccordion = $(accordion.next(0)).setStyle(options);
		}.bind(this));
	},

	//
	//  Activate an accordion
	//
	activate : function(accordion) {
		if (this.animating) {
			return false;
		}

		this.effects = [];

		this.currentAccordion = $(accordion.next(0));
		this.currentAccordion.setStyle({
			display: 'block'
		});

		this.currentAccordion.previous(0).addClassName(this.options.classNames.toggleActive);

		if (this.options.direction == 'horizontal') {
			this.scaling = $H({
				scaleX: true,
				scaleY: false
			});
		} else {
			this.scaling = $H({
				scaleX: false,
				scaleY: true
			});
		}

		if (this.currentAccordion == this.showAccordion) {
		  this.deactivate();
		} else {
		  this._handleAccordion();
		}
	},
	//
	// Deactivate an active accordion
	//
	deactivate : function() {
		var options = $H({
		  duration: this.duration,
			scaleContent: false,
			transition: Effect.Transitions.sinoidal,
			queue: {
				position: 'end',
				scope: 'accordionAnimation'
			},
			scaleMode: {
				originalHeight: this.options.defaultSize.height ? this.options.defaultSize.height : this.currentAccordion.scrollHeight,
				originalWidth: this.options.defaultSize.width ? this.options.defaultSize.width : this.currentAccordion.scrollWidth
			},
			afterFinish: function() {
				this.showAccordion.setStyle({
          height: 'auto',
					display: 'none'
				});
				this.showAccordion = null;
				this.animating = false;
			}.bind(this)
		});
    options.merge(this.scaling);

    this.showAccordion.previous(0).removeClassName(this.options.classNames.toggleActive);

		new Effect.Scale(this.showAccordion, 0, options);
	},

  //
  // Handle the open/close actions of the accordion
  //
	_handleAccordion : function() {
		var options = $H({
			sync: true,
			scaleFrom: 0,
			scaleContent: false,
			transition: Effect.Transitions.sinoidal,
			scaleMode: {
				originalHeight: this.options.defaultSize.height ? this.options.defaultSize.height : this.currentAccordion.scrollHeight,
				originalWidth: this.options.defaultSize.width ? this.options.defaultSize.width : this.currentAccordion.scrollWidth
			}
		});
		options.merge(this.scaling);

		this.effects.push(
			new Effect.Scale(this.currentAccordion, 100, options)
		);

		if (this.showAccordion) {
			this.showAccordion.previous(0).removeClassName(this.options.classNames.toggleActive);

			options = $H({
				sync: true,
				scaleContent: false,
				transition: Effect.Transitions.sinoidal
			});
			options.merge(this.scaling);

			this.effects.push(
				new Effect.Scale(this.showAccordion, 0, options)
			);
		}

    new Effect.Parallel(this.effects, {
			duration: this.duration,
			queue: {
				position: 'end',
				scope: 'accordionAnimation'
			},
			beforeStart: function() {
				this.animating = true;
			}.bind(this),
			afterFinish: function() {
				if (this.showAccordion) {
					this.showAccordion.setStyle({
						display: 'none'
					});
				}
				$(this.currentAccordion).setStyle({
				  height: 'auto'
				});
				this.showAccordion = this.currentAccordion;
				this.animating = false;
			}.bind(this)
		});
	}
}



/*
 * Copyright (c) 2006 Jonathan Weiss
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 */

var Tooltip = Class.create();
Tooltip.prototype = {
  initialize: function(element, tool_tip) {
    var options = Object.extend({
      default_css: false,
      margin: "0px",
	    padding: "5px",
	    backgroundColor: "#d6d6fc",
	    min_distance_x: 5,
      min_distance_y: 5,
      delta_x: 0,
      delta_y: 0,
      zindex: 1000
    }, arguments[2] || {});

    this.element      = $(element);

    this.options      = options;

    // use the supplied tooltip element or create our own div
    if($(tool_tip)) {
      this.tool_tip = $(tool_tip);
    } else {
      this.tool_tip = $(document.createElement("div"));
      document.body.appendChild(this.tool_tip);
      this.tool_tip.addClassName("tooltip");
      this.tool_tip.appendChild(document.createTextNode(tool_tip));
    }

    // hide the tool-tip by default
    this.tool_tip.hide();

    this.eventMouseOver = this.showTooltip.bindAsEventListener(this);
    this.eventMouseOut   = this.hideTooltip.bindAsEventListener(this);
    this.eventMouseMove  = this.moveTooltip.bindAsEventListener(this);

    this.registerEvents();
  },

  destroy: function() {
    Event.stopObserving(this.element, "mouseover", this.eventMouseOver);
    Event.stopObserving(this.element, "mouseout", this.eventMouseOut);
    Event.stopObserving(this.element, "mousemove", this.eventMouseMove);
  },

  registerEvents: function() {
    Event.observe(this.element, "mouseover", this.eventMouseOver);
    Event.observe(this.element, "mouseout", this.eventMouseOut);
    Event.observe(this.element, "mousemove", this.eventMouseMove);
  },

  moveTooltip: function(event){
	  Event.stop(event);
	  // get Mouse position
    var mouse_x = Event.pointerX(event);
	  var mouse_y = Event.pointerY(event);

	  // decide if wee need to switch sides for the tooltip
	  var dimensions = Element.getDimensions( this.tool_tip );
	  var element_width = dimensions.width;
	  var element_height = dimensions.height;

	  if ( (element_width + mouse_x) >= ( this.getWindowWidth() - this.options.min_distance_x) ){ // too big for X
		  mouse_x = mouse_x - element_width;
		  // apply min_distance to make sure that the mouse is not on the tool-tip
		  mouse_x = mouse_x - this.options.min_distance_x;
	  } else {
		  mouse_x = mouse_x + this.options.min_distance_x;
	  }

	  if ( (element_height + mouse_y) >= ( this.getWindowHeight() - this.options.min_distance_y) ){ // too big for Y
		  mouse_y = mouse_y - element_height;
	    // apply min_distance to make sure that the mouse is not on the tool-tip
		  mouse_y = mouse_y - this.options.min_distance_y;
	  } else {
		  mouse_y = mouse_y + this.options.min_distance_y;
	  }

	  // now set the right styles
	  this.setStyles(mouse_x, mouse_y);
  },


  showTooltip: function(event) {
    Event.stop(event);
    this.moveTooltip(event);
	  new Element.show(this.tool_tip);
	 // new Effect.Appear(this.tool_tip,{duration:1.0});
	  //new Effect.BlindDown(this.tool_tip);
  },

  setStyles: function(x, y){
    // set the right styles to position the tool tip
	  Element.setStyle(this.tool_tip, { position:'absolute',
	 								    top:y + this.options.delta_y + "px",
	 								    left:x + this.options.delta_x + "px",
									    zindex:this.options.zindex
	 								  });

	  // apply default theme if wanted
	  if (this.options.default_css){
	  	  Element.setStyle(this.tool_tip, { margin:this.options.margin,
		 		  						                    padding:this.options.padding,
		                                      backgroundColor:this.options.backgroundColor,
										                      zindex:this.options.zindex
		 								    });
	  }
  },

  hideTooltip: function(event){
	  new Element.hide(this.tool_tip);
	 // new Effect.Fade(this.tool_tip);
  },

  getWindowHeight: function(){
    var innerHeight;
	  if (navigator.appVersion.indexOf('MSIE')>0) {
		  innerHeight = document.body.clientHeight;
    } else {
		  innerHeight = window.innerHeight;
    }
    return innerHeight;
  },

  getWindowWidth: function(){
    var innerWidth;
	  if (navigator.appVersion.indexOf('MSIE')>0) {
		  innerWidth = document.body.clientWidth;
    } else {
		  innerWidth = window.innerWidth;
    }
    return innerWidth;
  }

}