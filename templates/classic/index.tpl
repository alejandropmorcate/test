{include file="header.tpl" jsload2="calendar" jsload = "ajax" jsload3 = "lightbox" stage = "index"}


<div id = "fadeover" style = "position:absolute:top:0;left:0;width:100%;height:100%;z-index:9999;"></div>

<h1>{#desktop#}</h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}
	{*Projects*}
		{if $projectnum > 0}
		<div class="block_a">
			<div class="in">
				<div class="headline">
				<a href="javascript:void(0);" id="projecthead_toggle" class="{$projectbar}" onclick = "toggleBlock('projecthead');"></a>

					<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="myprojects.php" title="{#myprojects#}">
					<img src="./templates/standard/img/symbols/projects.png" alt="" />
					<span>{#myprojects#}</span>
					</a>
					</h2>
					</div>
					</div>
				</div>

				<div id = "projecthead" style = "{$projectstyle}">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#project#}</td>
				<td class="c"></td>
				<td class="d">{#daysleft#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
<div id = "accordeon_project">
				<ul>
					{section name=project loop=$myprojects}

					{*Color-Mix*}
					{if $smarty.section.project.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
						<div id = "proj_{$myprojects[project].ID}" class="focus_off">

						<table id = "projs{$myprojects[project].ID}" class="line" cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 4}
                        <a class="butn_check" href="javascript:closeElement('proj_{$myprojects[project].ID}','manageproject.php?action=close&amp;id={$myprojects[project].ID}');" title="{#close#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d">{$myprojects[project].daysleft}</td>
                        <td class="tools"><a class="tool_edit" href="manageproject.php?action=editform&amp;id={$myprojects[project].ID}" title="{#edit#}" {if $adminstate < 5}style="visibility:hidden;" {/if}></a>
					<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'proj_{$myprojects[project].ID}\',\'manageproject.php?action=del&amp;id={$myprojects[project].ID}\')');"  {if $adminstate < 5}style="visibility:hidden;" {/if}></a></td>
					
						</tr></table>

				<div class="link_in_toggle"><a href="managetask.php?action=showtask&amp;id={$tasks[task].project}&amp;tid={$tasks[task].ID}">
						<a href="manageproject.php?action=showproject&amp;id={$myprojects[project].ID}">{$myprojects[project].name|truncate:30:"...":true}</a>
						</a></div>

						<div class="accordion_toggle" >
						<a class="open" href="#" onclick = "switchClass('proj_{$myprojects[project].ID}','focus_on','focus_off');">
							{if $myprojects[project].name != ""}
							{$myprojects[project].name|truncate:30:"...":true}
							{else}
							{$myprojects[project].desc|truncate:30:"...":true}
							{/if}
						</a>
						</div> {*Accordeon_Toggle End*}
						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript"><div style="width:588px;overflow:auto;">{$myprojects[project].desc}</div></td>
						</tr>
						</table>
						</div>

						</div> {*Focus End*}
						</div> {*Marker End*}

					</li>
					{/section}
				</ul>
				</div>
				</div> {*Table_Body End*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*projecthead end*}
			</div> {*IN end*}
		</div>{*Block A end*}
		{/if}
	{*Projects End*}

			{literal}
			<script type = "text/javascript">
			var accord_status = new accordion('accordeon_project');
			</script>
			{/literal}

	{*Tasks*}
		{if $tasknum > 0}
		<div class="block_a">
			<div class="in">
				<div class="headline">
					<a href="javascript:void(0);" id="taskhead_toggle" class="{$taskbar}" onclick = "toggleBlock('taskhead');"></a>

					<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="mytasks.php" title="{#mytasks#}">
					<img src="./templates/standard/img/symbols/task.png" alt="" />
					<span>{#mytasks#}</span>
					</a>
					</h2>
					</div>
					</div>
				</div>



				<div id = "taskhead" style = "{$taskstyle}">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#task#}</td>
				<td class="c">{#project#}</td>
				<td class="d">{#daysleft#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_tasks">
				<ul>
					{section name = task loop=$tasks}

					{*Color-Mix*}
					{if $smarty.section.task.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					{if $tasks[task].daysleft < 0}
					<div class ="marker_late">
					{elseif $tasks[task].daysleft == 0}
					<div class ="marker_today">
					{else}
					<div class ="marker_all">
					{/if}
						<div id = "task_{$tasks[task].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}
                        <a class="butn_check" href="javascript:closeElement('task_{$tasks[task].ID}','managetask.php?action=close&amp;tid={$tasks[task].ID}&amp;id={$tasks[task].project}');" title="{#close#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"><a href = "managetask.php?action=showproject&amp;id={$tasks[task].project}" >{$tasks[task].pname}</a></td>
						<td class="d"><span>{$tasks[task].daysleft}</span></td>
                        <td class="tools">
                        {if $adminstate > 0}<a class="tool_edit" href="managetask.php?action=editform&amp;tid={$tasks[task].ID}&amp;id={$tasks[task].project}" title="{#edit#}"></a>
                        <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'task_{$tasks[task].ID}\',\'managetask.php?action=del&amp;tid={$tasks[task].ID}&amp;id={$tasks[task].project}\')');" title="{#delete#}"></a>{/if}</td>
						</tr></table>

						<div class="link_in_toggle"><a href="managetask.php?action=showtask&amp;id={$tasks[task].project}&amp;tid={$tasks[task].ID}">
							{if $tasks[task].title != ""}
							{$tasks[task].title|truncate:30:"...":true}
							{else}
							{$tasks[task].text|truncate:30:"...":true}
							{/if}
						</a></div>

						<div class="accordion_toggle" id = "tasktoggle{$tasks[task].ID}">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('task_{$tasks[task].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}
						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$tasks[task].text|nl2br}<br />
						
						</tr>
						</table>
						</div> {*Accordion_Content End*}
						</div> {*Focus End*}
						</div> {*Marker End*}

					</li>
					{/section}
				</ul>
				</div> {*Accordion End*}
				</div> {*Table_Body End*}


				<div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a href = "managetask.php?action=ical" title = "{#icalexport#}"><img src = "templates/standard/img/symbols/files/text-calendar.png" alt="" /></a>
						<a href = "managerss.php?action=rss-tasks&amp;user={$userid}" title = "{#rssfeed#}"><img src = "templates/standard/img/symbols/files/application-rss+xml.png" alt="" /></a>
					</div>
				</div>



				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*taskhead end*}
			</div> {*IN end*}
		</div> {*Block A end*}

		{literal}
		<script type = "text/javascript">
		var accord_tasks = new accordion('accordion_tasks');
	</script>
		{/literal}

		{/if}
	{*Tasks End*}



	{*Milestones*}
		{if $milenum > 0}
		<div class="block_c" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="milehead_toggle" class="{$milebar}" onclick = "toggleBlock('milehead');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{#milestones#}</span></a></h2>
				</div>

				<div id = "milehead" style = "{$milestyle}">
				<div id="timeline">
				<table id="timeline1" class="timeline" cellpadding="0" cellspacing="1">

				<tr class="head">
				<td></td>
				{section name = day loop=$timestr}
				<td>{$timestr[day]}</td>
				{/section}


				</tr>

			<tr class="content" valign="top">
					<td valign="middle" rowspan="1" style="width:12px;"><a class="scroll_left" href = "{literal}javascript:change('manageajax.php?action=timeline1prev&amp;start=0&amp;end=7','timeline');{/literal}"></a></td>

					{section name=tag loop=$timeline}
					{if $smarty.section.tag.index % 2 == 0}
						{if $timeline[tag].tagstr == $today}
						<td class="today">
						{else}
						<td class="second">
						{/if}

					{else}
					<td>
					{/if}
					<span style="white-space:nowrap;">{$timeline[tag].tagstr}</span>
					{if $timeline[tag].milestone.ID > 0}
					<p><a id = "link{$timeline[tag].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline[tag].milestone.ID}&amp;id={$timeline[tag].milestone[1]}" >{$timeline[tag].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline[tag].milestone.ID}">{$timeline[tag].milestone.desc|nl2br}</span></p>
				{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline[tag].milestone.ID}{literal}','tip{/literal}{$timeline[tag].milestone.ID}{literal}');
				</script>
				{/literal}
				{/if}</td>
					{/section}

					<td valign="middle" rowspan="1" style="width:12px;"><a class="scroll_right" href = "{literal}javascript:change('manageajax.php?action=timeline1next&amp;start=0&amp;end=7','timeline');{/literal}"></a></td>

					</tr>

				</table>

				<div class="clear_both_b"></div>

				</div>
			</div>{*milehead end*}
			</div> {*IN end*}
		</div> {*Block A end*}

		{/if}
	{*Milestones End*}

{*Messages*}
{if $msgnum > 0}{if $adminstate > 0}
	<div class="block_b">
		<div class="in">
		   <div class="headline">
			  	<a href="#" id="activityhead_toggle" class="{$actbar}" onclick = "toggleBlock('activityhead');"></a>
						<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="managemessage.php?action=mymsgs" title="{#myprojects#}">
					<img src="./templates/standard/img/symbols/msgs.png" alt="" />
					<span>{#mymessages#}</span>
					</a>
					</h2>
					</div>
					</div>
			</div>

		<div id = "activityhead" style = "{$actstyle}">
				<div class="table_head">
			<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b" style="width:180px;">{#message#}</td>
					<td class="c" style="width:120px;">{#project#}</td>
					<td class="d" style="width:110px">{#by#}</td>
					<td style="width:127px;">{#on#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>

				<div class="table_body">
				  <div id = "accordion_messages" >
					<ul>
					{section name=message loop=$messages}

					{*Color-Mix*}
					{if $smarty.section.message.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}


					<div class ="marker_all">
					<div id="messages_focus{$messages[message].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td class="a"><a class="butn_reply" href="managemessage.php?action=replyform&amp;mid={$messages[message].ID}&amp;id={$messages[message].project}" title="{#answer#}"></a></td>
								<td class="b" style="width:180px;"></td>
								<td class="c" style="width:120px;"><a href = "managemessage.php?action=showproject&amp;id={$messages[message].project}">{$messages[message].pname|truncate:20:"...":true}</a></td>
								<td class="d" style="width:110px;"><a href="manageuser.php?action=profile&amp;id={$messages[message].user}">{$messages[message].username|truncate:20:"...":true}</a></td>

								<td style="width:127px;">
								  	{$messages[message].postdate}
								</td>

								<td class="tools">{if $adminstate > 4}
								<a class="tool_edit" href="managemessage.php?action=editform&amp;mid={$messages[message].ID}&amp;id={$messages[message].project}&amp;redir=index.php" title="{#edit#}"></a>
								<a class="tool_del"  href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'messages_focus{$messages[message].ID}\',\'managemessage.php?action=del&amp;mid={$messages[message].ID}&amp;id={$messages[message].project}\')');"  title="{#delete#}"></a>{/if}</td>
								
					
							</tr></table>

							<div class="link_in_toggle"><a href="managemessage.php?action=showmessage&amp;mid={$messages[message].ID}&amp;id={$messages[message].project}">{$messages[message].title|truncate:25:"...":true}</a></div>

							<div class="accordion_toggle">
							<a class="open" style="width:170px;" href="javascript:void(0);" onclick = "switchClass('messages_focus{$messages[message].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="b" style="width:180px;">

								{if $messages[message].avatar != ""}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=files/{$cl_config}/avatar/{$messages[message].avatar}" alt="" /></div>
								{else}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
								{/if}

							</td>
							<td class="message">
								<div class="msgin">{$messages[message].text|nl2br}</div>
								{if $messages[message].tagnum > 1}<br /><strong>{#tags#}:</strong>
							{section name = tag loop=$messages[message].tagsarr}
							<a href = "managetags.php?action=gettag&tag={$messages[message].tagsarr[tag]}&amp;id={$messages[message].project}">{$messages[message].tagsarr[tag]}</a>
							{/section}
							{/if}
								{if $messages[message].files[0][0] > 0}
								<table cellpadding="0" cellspacing="0" style="border-top:1px dashed;margin:15px 0">
								<tr><td colspan="3" class="thead" style="padding:9px 0 3px 0;">{#files#}</td></tr>
								{section name = file loop=$messages[message].files}
								<tr class="{cycle values="bg_one,bg_two"}">
								<td style="width:26px;padding:2px 0;">
								<a href = "{$messages[message].files[file].datei}" {if $messages[message].files[file].imgfile == 1} rel="lytebox[]" {elseif $messages[message].files[file].imgfile == 2} rel = "lyteframe[text]" {/if}><img src = "templates/standard/img/symbols/files/{$messages[message].files[file].type}.png" alt="{$messages[message].files[file].name}" /></a>
								</td><td style="width:347px;padding:0 0 0 5px;">
								<a href = "{$messages[message].files[file].datei}" {if $messages[message].files[file].imgfile == 1} rel="lytebox[img{$messages[message].ID}]" {elseif $messages[message].files[file].imgfile == 2} rel = "lyteframe[text{$messages[message].ID}]"{/if}>{$messages[message].files[file].name}</a>
								</td>
								<td class="tools" style="width:26px;padding:0;">
	                            <a class="tool_del" href = "javascript:confirmit('{#confirmdel#}','managefile.php?action=delete&id={$messages[message].project}&file={$messages[message].files[file].ID}');"  title="{#delete#}"></a>
								</td>
								</tr>
								{/section}
								</table>
								{/if}
							</td>
							</tr>
							</table>
							</div> {*Accordion_Content End*}

					</div> {*Focus End*}
					</div> {*Marker End*}

					</li>
					{/section}
					</ul>
					</div> {*Accordion End*}
					{literal}
					<script type = "text/javascript">
					var accord_messages = new accordion('accordion_messages');
					</script>
					{/literal}

				</div> {*Table_Body End*}


				<div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a title = "{#rssfeed#}" href = "managerss.php?action=mymsgs-rss&amp;user={$userid}"><img src = "templates/standard/img/symbols/files/application-rss+xml.png" alt="" /></a>
					</div>
				</div>



				<div class="clear_both"></div> {*required ... do not delete this row*}
				</div>
		</div> {*IN end*}
	</div> {*Block A end*}
{/if}{/if}


</div> {*Content_left end*}



<div class ="content_right">

<div class="calender_wrapper">
	<div id = "calendar"></div>
	<div class="clock">
		<span id = "digitalclock"></span>
	</div>
</div>
<br /><br/>
<div class="clear_both_b"></div>

<div class="right_in">
<h2>{#usersonline#}</h2>
<div id = "onlinelist"></div>
</div>

<div class="clear_both_b"></div>

<div class="right_in">
<h2 onclick="$('query').focus();">{#search#}<span id="indicator1" style="display:none;"><img src="templates/standard/img/symbols/indicator_arrows.gif" alt="{#searching#}" /></span></h2>
</div>
<form id = "search" class = "main" style="clear:both;" method = "get" action = "managesearch.php" {literal} onsubmit="return validateStandard(this,'input_error');"{/literal}>
<fieldset>
<div class = "row">
<input type="text" class = "text" id="query" name="query" /></div>

<div id="choices"></div>
<input type = "hidden" name = "action" value = "search" />
</fieldset>
<div class="butn"><button type="submit">{#gosearch#}</button></div>
</form>


{literal}
  <script type = "text/javascript">
  new Ajax.Autocompleter('query', 'choices', 'managesearch.php?action=ajaxsearch', {paramName:'query',minChars: 2,indicator: 'indicator1'});
  calctime();
   		addContentLoadListener( function() {
		var cal = 	new CalendarJS();
			cal.dayname = {/literal}["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			cal.monthname = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			cal.tooltip = ["{#prevmonth#}","{#nextmonth#}"{literal}];
			cal.init("calendar");
	} );

	 var on = new Ajax.PeriodicalUpdater("onlinelist","manageuser.php?action=onlinelist",{method:'get',evalScripts:true,frequency:35});
	</script>
{/literal}


</div> {*Content_right end*}


{include file="footer.tpl"}