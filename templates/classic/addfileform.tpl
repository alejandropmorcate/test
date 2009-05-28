<div class="block_in_wrapper">

	<h2>{#addfile#}</h2>
	{#maxsize#}: {$postmax}<br/><br/>
	<form class="main" action="managefile.php?action=upload&amp;id={$project.ID}" method="post" enctype="multipart/form-data" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
	<fieldset>


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
		<div class = "row">
		<form>
		<label for = "upfolder">Ordner:</label>
		<select name = "upfolder" id = "upfolder">
		<option value = "">Stammordner</option>
		{section name=fold loop=$folders}
		<option value = "{$folders[fold].ID}">/{$folders[fold].name}</option>
		{/section}
		</select>
		</form>
	</div>
		<div class="clear_both_b"></div>
<div id = "inputs">

<div class="row"><label for = "title">{#title#}:</label><input type = "text" name = "userfile1-title" id="title" /></div>
<div class="row"><label for = "tags">{#tags#}:</label><input type = "text" name = "userfile1-tags" id="tags" /></div>

		<div class="row">
<label for="file">{#file#}:</label><input type="file" class="file" name="userfile1" id="file" required="1" realname="{#file#}" size="20" /></div>
</div>

		<div class="row"><label for = "desc">{#description#}</label><textarea name="desc" id="desc" rows="3" cols="1"></textarea></div>

		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#addbutton#}</button></div>
		<a href = "javascript:blindtoggle('addfile');" class="butn_link"><span>{#cancel#}</span></a>
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}