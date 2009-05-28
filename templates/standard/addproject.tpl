<div class="block_in_wrapper">
<h2>{#addproject#}</h2>

	<form class="main" method="post" action="admin.php?action=addpro" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="name">{#name#}:</label><input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="desc">{#description#}:</label><div class="editor"><textarea name="desc" id="desc" required="0" rows="3" cols="1" ></textarea></div></div>

	    <div class="clear_both_b"></div>

		<div class="row">
		<label for="end">{#due#}:</label>
		<input type="text" class="text" name="end"  id="end" required="0" realname="{#due#}" regexp="{literal}\d{2}.\d{2}.\d{4}{/literal}" />
		</div>

		<div class="datepick">
			<div id = "add_project" class="picker" style = "display:none;"></div>
		</div>

		<script type="text/javascript">
		  	theCal = new calendar({$theM},{$theY});
			theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			theCal.relateTo = "end";
			theCal.dateFormat = "{$settings.dateformat}";
			theCal.getDatepicker("add_project");
		</script>

		<div class = "row">
		<label for = "budget">Budget</label>
		<input type = "text" class="text" name = "budget" id = "budget" />
		</div>

        <div class = "row">
		<label for = "task1">Automatic tasks</label>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Task1" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "11.05.2009" /></div>
		<div class="row" style = "margin-left:140px;">
            <label style = "width:60px;">Assign to:</label>
            <select name = "bla">
	        <option value = "please choose">Please choose</option>
            </select>
	      	</div>
	      	<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Task2" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "11.07.2009" /></div>
		<div class="row" style = "margin-left:140px;">
            <label style = "width:60px;">Assign to:</label>
            <select name = "bla">
	        <option value = "please choose">Please choose</option>
            </select>
	      	</div>

<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Task3" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "16.05.2009" /></div>
		<div class="row" style = "margin-left:140px;">
            <label style = "width:60px;">Assign to:</label>
            <select name = "bla">
	        <option value = "please choose">Please choose</option>
            </select>
	      	</div>




		</div>

        <div class = "row">
		<label for = "task1">Automatic milestones</label>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Milestone1" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "11.05.2009" /></div>

	      	<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Milestone2" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "12.06.2009" /></div>

<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Name:</label> <input type = "text" class="text" name = "task1" id = "task1" value = "CustomerCompany - Milestone3" disabled/></div>
		<div class = "row" style = "margin-left:140px;"><label style = "width:60px;">Due:</label> <input type = "text" class="text" name = "wann" id = "task1" value = "19.05.2009" /></div>

		</div>
		<div class = "row"><label></label></div>
		<div class = "row"><label></label></div>


		<div class="row"><label>{#members#}:</label>
		<div style="float:left;">
        {section name=user loop=$users}
	        <div class="row">
	        <input type="checkbox" class="checkbox" value="{$users[user].ID}" name="assignto[]" id="{$users[user].ID}" required="0" {if $users[user].ID == $userid} checked="checked"{/if} /><label for="{$users[user].ID}">{$users[user].name}</label><br />
	      	</div>
	    {/section}
	    </div>
		</div>

		<input type="hidden" name="assignme" value="1" />

	    <div class="clear_both_b"></div>

		<div class="row-butn-bottom">
		<label>&nbsp;</label>
		<button type="submit" onfocus="this.blur();">{#addbutton#}</button>
		{if $myprojects == "1"}
		<button onclick="blindtoggle('form_addmyproject');toggleClass('add_myprojects','add-active','add');toggleClass('add_butn_myprojects','butn_link_active','butn_link');toggleClass('sm_myprojects','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
		{else}
		<button onclick="blindtoggle('form_{$myprojects[project].ID}');return false;">{#cancel#}</button>
		{/if}
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}