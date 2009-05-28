{include file="header.tpl" jsload = "ajax" jsload3 = "lightbox" }
<h1>{$projectname}<span>/ {#files#}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }
	<div class="infowin_left" >
	<span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/files.png" alt=""/>{#filewasdeleted#}</span>
	</div>

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/files.png" alt=""/>{#filewasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/files.png" alt=""/>{#filewasedited#}</span>
		{elseif $mode == "folderadded"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/folder.png" alt=""/>{#folderwasadded#}</span>
		{elseif $mode == "folderedited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/folder.png" alt=""/>{#folderwasedited#}</span>
		{elseif $mode == "folderdel"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/folder.png" alt=""/>{#folderwasdeleted#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}

	<form style="float:left;">
		{#folder#}:
		<select name = "thefolder" id = "thefolder" onchange = "change('manageajax.php?action=fileview&id={$project.ID}&folder='+this.value,'fileview');">
		<option value = "">{#rootdir#}</option>
		{section name=fold loop=$folders}
		<option value = "{$folders[fold].ID}">/{$folders[fold].name}</option>
		{/section}
		</select>
	</form>
	
	<div style="position:relative;top:-2px;left:0;margin:0 0 -2px 0;">
		<a href = "javascript:blindtoggle('addfolder');" class="butn_link_b" style="margin: 0 0 0 10px"><span>{#addfolder#}</span></a>
		<a href = "javascript:change('manageajax.php?action=folderview&id={$project.ID}','fileview');" class="butn_link_b" style="margin: 0 0 0 10px"><span>{#managefolders#}</span></a>
	</div>

	<div class="clear_both_b"></div> {*required ... do not delete this row*}
	<div id = "addfolder" style = "display:none;">	
	<div class="block_in_wrapper">
	<h2>{#addfolder#}</h2>
	<form class="main" action="managefile.php?action=addfolder&amp;id={$project.ID}" method="post" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
	<fieldset>

	<div class="row"><label for = "foldertitle">{#title#}:</label><input type = "text" name = "foldertitle" id="foldertitle" /></div>
	<div class="row"><label for = "folderdesc">{#description#}:</label><input type = "text" name = "folderdesc" id="folderdesc" /></div>

	<div class="row">
	<label>&nbsp;</label>
	<div class="butn"><button type="submit">{#addbutton#}</button></div>
	<a href = "javascript:blindtoggle('addfolder');" class="butn_link"><span>{#cancel#}</span></a>
	</div>

	</fieldset>
	</form>

</div> {*block_in_wrapper end*}
</div>	


		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="files_toggle" class="win_block" onclick = "toggleBlock('files');"><img src="./templates/standard/img/symbols/files.png" alt="" />
				<span>{#files#}</span></a>
				</h2>
				</div>

				<div id = "files" style = "">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#title#}</td>
					<td class="c" style="width:307px;">{#file#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>
<div id = "fileview">

				<div class="table_body">
					<div id = "accordion_files" >
					<ul>
					{section name=file loop=$files}

					{*Color-Mix*}
					{if $smarty.section.file.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
					<div id="files_focus{$files[file].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td style="height:39px;padding:0;" class="a"><a href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;"{/if}><img style="margin:0 0 0 6px;" src = "templates/standard/img/symbols/files/{$files[file].type}.png" alt="{$files[file].name}" /></a></td>
								<td class="b"></td>
								<td class="c" style="width:307px;"><a href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;" {/if}>{$files[file].name|truncate:40:"...":true}</a></td>
                                <td class="tools">{if $adminstate > 0}
                                <a class="tool_edit" href="managefile.php?action=editform&amp;id={$project.ID}&amp;file={$files[file].ID}" title="{#edit#}"></a>
                                <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'files_focus{$files[file].ID}\',\'managefile.php?action=delete&amp;id={$project.ID}&amp;file={$files[file].ID}\')');"  title="{#delete#}"></a>{/if}</td>
							</tr></table>

							<div class="link_in_toggle" >
							<a style="top:-33px;" href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" {/if}>{$files[file].title|truncate:40:"...":true}</a>
							</div>

							<div class="accordion_toggle">
							<a style="top:-33px;" class="open" href="javascript:void(0);" onclick = "switchClass('files_focus{$files[file].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$files[file].desc|nl2br}
							{if $files[file].tagsarr[0] != ""}<br /><strong>{#tags#}:</strong>
							{section name = tag loop=$files[file].tagsarr}
							<a href = "managetags.php?action=gettag&tag={$files[file].tagsarr[tag]}&amp;id={$project.ID}">{$files[file].tagsarr[tag]}</a>
							{/section}
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
					var accord_files = new accordion('accordion_files');

					</script>
					{/literal}
				</div> {*Table_Body End*}

					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>
</div> {*ajaxarea end*}


                <div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a href = "managefile.php?action=zipexport&id={$project.ID}"><img src = "templates/standard/img/symbols/files/application-zip.png" /></a>
					</div>
				</div>

						<div class="clear_both"></div>

					{*Add File*}

                        {if $adminstate > 0}
                        <a href = "javascript:blindtoggle('addfile');" class="butn_link_b"><span>{#addfile#}</span></a>{/if}<br />
						<div class="clear_both_b"></div> {*required ... do not delete this row*}
						<div id = "addfile" style = "display:none;">
						{include file="addfileform.tpl" }
						</div>
					{*Add File End*}

			</div>{*Files end*}


			</div> {*IN end*}
		</div> {*Block B end*}



</div> {*Content_left end*}
{include file="footer.tpl"}