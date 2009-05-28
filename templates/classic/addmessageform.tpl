<div class="block_in_wrapper">

	<h2>{#addmessage#}</h2>

	<form class="main" method="post" enctype="multipart/form-data" action="managemessage.php?action=add&amp;id={$project.ID}" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal} >
	<fieldset>

	<div class="row"><label for="title">{#title#}:</label><input type="text" name="title" id="title" required="1" realname="{#title#}" /></div>
	<div class="row_editor"><textarea name="text" id="text" required="0" realname="{#text#}" rows="3" cols="1" ></textarea></div>
		<div class="row"><label for="tags">{#milestone#}:</label><select name="milestone" id="milestone" required="0" realname="{#milestone#}">
		<option value="0" selected="selected">{#chooseone#}</option>
		{section name=stone loop=$milestones}
		<option value="{$milestones[stone].ID}">{$milestones[stone].name}</option>
		{/section}
		</select>
	</div>
	<div class="row"><label for="tags">{#tags#}:</label><input type="text" name="tags" id="tags" required="0" realname="{#tags#}" /></div>
	

	<div class="clear_both_b"></div>

	<div class="row">
	<a href = "javascript:blindtoggle('files');" class="butn_link"><span>
	<img src="templates/standard/img/symbols/files.png" alt=""/>{#attachfiles#}
	</span></a>



	<div id = "files" style = "display:none;clear:both;">
	   	<div class="clear_both_b"></div>

	   	<div class="row">
		<label for = "thefiles">{#attachfile#}</label>
		<select name = "thefiles" id = "thefiles">
		<option value = "0">{#chooseone#}</option>
		{section name = file loop=$files}
		<option value = "{$files[file].ID}">{$files[file].name}</option>
		{/section}
		</select>
		</div>

		<div class="clear_both_b"></div>

		<strong>{#or#} {#addfiles#}</strong>

		<div class="clear_both_b"></div>

		<div class="row"><label for = "numfiles">{#count#}:</label>
		<select name = "numfiles" id = "numfiles" onchange = "make_inputs(this.value);">
		<option value = "1" selected="selected">1</option>
		<option value = "2">2</option>
		<option value = "3">3</option>
		<option value = "4">4</option>
		<option value = "5">5</option>
		<option value = "6">6</option>
		<option value = "7">7</option>
		<option value = "8">8</option>
		<option value = "9">9</option>
		<option value = "10">10</option>
		</select>
		</div>

	<div id = "inputs">

<div class="row"><label for = "title">{#title#}:</label><input type = "text" name = "userfile1-title" id="title" /></div>
		<div class="row">
<label for="file">{#file#}:</label><input type="file" class="file" name="userfile1" id="file" required="0" realname="{#file#}" size="20" /></div>
</div><input type = "hidden" name="desc" id="desc" value = "" />

		<div class="clear_both_b"></div>

	</div>


	<div class="butn"><button type="submit">{#send#}</button></div>
	<a href = "javascript:blindtoggle('addmsg');" class="butn_link"><span>{#cancel#}</span></a>
	</div>

	</fieldset>
	</form>

</div> {*block_in_wrapper end*}
