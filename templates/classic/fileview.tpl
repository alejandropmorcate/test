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