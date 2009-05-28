<div class="block_in_wrapper">

	<form class="main" method="post" action="manageproject.php?action=assign&amp;id={$project.ID}" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
	<fieldset>

		<div class="row">
		<label for="addtheuser">{#user#}</label>
		<select name = "user" id="addtheuser">
		<option value = "">{#chooseone#}</option>
		{section name = usr loop=$users}
		<option value = "{$users[usr].ID}">{$users[usr].name}</option>
		{/section}
		</select>
		</div>

		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('adduser');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}