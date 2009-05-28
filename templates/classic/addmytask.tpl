<div class="block_in_wrapper">

	<h2>{#addtask#}</h2>
	<form class="main" method="post" action="managetask.php?action=add&amp;id={$myprojects[project].ID}"  {literal}onsubmit="return validateCompleteForm(this,'input_error');{/literal}">
	<fieldset>

	<div class="row"><label for="title">{#title#}:</label><input type="text" name="title" id="title" realname = "{#title#}" required = "1"  /></div>
	<div class="row"><label for="text">{#text#}:</label><textarea name="text" id="text" required = "0"  rows="3" cols="1" ></textarea></div>
	<div class="row"><label for="end{$myprojects[project].ID}">{#end#}:</label><input type="text" name="end" realname="{#due#}"  id="end{$myprojects[project].ID}" required = "1" /></div>


		{literal}
		<script type="text/javascript">
		    /*<[CDATA[*/
		     var dpck	= new DatePicker({
		      relative	: {/literal}'end{$myprojects[project].ID}'{literal},
		      language	: {/literal}'{$locale}'{literal},
		      topOffset: -129,
		      leftOffset: 235
		      });
		    /*]]>*/
		    </script>
		{/literal}

    <div class="row"><label for="tasklist">{#tasklist#}:</label>
    <select name="tasklist" id="tasklist" required = "1" exclude = "-1" realname = "{#tasklist#}">
    <option value="-1" selected="selected">{#chooseone#}</option>
    {section name=tasklist loop=$myprojects[project].lists}
    <option value="{$myprojects[project].lists[tasklist].ID}">{$myprojects[project].lists[tasklist].name}</option>
    {/section}</select></div>

    <input type="hidden" value="{$userid}" name="assigned" />

	<div class="row">
	<label>&nbsp;</label>
	<div class="butn"><button type="submit">{#addbutton#}</button></div>
	<a href = "javascript:blindtoggle('form_{$myprojects[project].ID}');" class="butn_link"><span>{#cancel#}</span></a>
	</div>

	</fieldset>
	</form>

</div> {*block_in_wrapper end*}