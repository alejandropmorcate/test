<div class="clear_both_b"></div>

<div class = "block_in_wrapper">
	<h2>{#addtasklist#}</h2>
	<form class="main" method="post" action="managetasklist.php?action=add&amp;id={$project.ID}" {literal} onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
			<div class="row"><label for="name">{#name#}: </label><input type="text" style="width:155px" name="name" id="name" required="1" realname="{#name#}" /></div>
			<div class="row"><label for="desc">{#description#}: </label><textarea style="width:155px" name="desc" id="desc" required="0" rows="3" cols="1" ></textarea></div>
	
	
			<div class="row"><label for="milestone">{#milestone#}: </label>
			<select style="width:163px" name="milestone" id="milestone" required="0">
			<option value="0" selected="selected">{#chooseone#}</option>
			{section name=stone loop=$milestones}
			<option value="{$milestones[stone].ID}">{$milestones[stone].name}</option>
			{/section}
			</select>
			</div>
	
			<div class="row">
			<label>&nbsp;</label>
			<div class="butn"><button type="submit">{#addbutton#}</button></div>
			<a href = "javascript:blindtoggle('addlist');" class="butn_link"><span>{#cancel#}</span></a>
			</div>
	
	</fieldset>
</div>
</form>