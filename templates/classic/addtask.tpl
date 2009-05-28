<div class="block_in_wrapper">

	<h2>{#addtask#}</h2>
	<form class="main" method="post" action="managetask.php?action=add&amp;id={$project.ID}"  {literal}onsubmit="return validateCompleteForm(this,'input_error');{/literal}">
	<fieldset>

	<div class="row"><label for="title">{#title#}:</label><input type="text" name="title" id="title"  realname = "{#title#}" required = "1"  /></div>
	<div class="row"><label for="text">{#text#}:</label><textarea name="text" id="text" required = "0"  rows="3" cols="1" ></textarea></div>
	<div class="row"><label for="end{$lists[list].ID}">{#due#}:</label><input type="text" name="end" realname="{#due#}"  id="end{$lists[list].ID}" required = "1" /></div>


		{literal}
		<script type="text/javascript">
		    /*<[CDATA[*/
		     var dpck	= new DatePicker({
		      relative	: {/literal}'end{$lists[list].ID}'{literal},
		      language	: {/literal}'{$locale}'{literal},
		      topOffset: -129,
		      leftOffset: 235
		      });
		    /*]]>*/
		    </script>
		{/literal}

	<div class="row">
	<label for="assigned" >{#assignto#}:</label>
	<select name="assigned" id="assigned" required = "1" exclude = "-1" realname = "{#assignto#}">
	<option value="-1" selected="selected">{#chooseone#}</option>
    <option value="0">{#all#}</option>
	{section name=user loop=$assignable_users}
	<option value="{$assignable_users[user].ID}">{$assignable_users[user].name}</option>
	{/section}
	</select>
	</div>

	{if $lists[list].ID != ""}
	<input type="hidden" value="{$lists[list].ID }" name="tasklist" />
	{else}
	<input type="hidden" value="{$tasklist.ID }" name="tasklist" />
	{/if}

	<div class="row">
	<label>&nbsp;</label>
	<div class="butn"><button type="submit">{#addbutton#}</button></div>
	<a href = "javascript:blindtoggle('form_{$lists[list].ID}');" class="butn_link"><span>{#cancel#}</span></a>
	</div>

	</fieldset>
	</form>

</div> {*block_in_wrapper end*}