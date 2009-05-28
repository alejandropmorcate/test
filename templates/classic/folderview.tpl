{include file="header.tpl" jsload = "ajax" jsload3 = "lightbox" showheader="no"}
			<div class="table_body">
					<div id = "accordion_files" >
					<ul>
					{section name=file loop=$ordner}

					{*Color-Mix*}
					{if $smarty.section.file.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
					<div id="files_focus{$ordner[file].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td style="height:39px;padding:0;" class="a"><img style="margin:0 0 0 6px;" src = "templates/standard/img/symbols/folder.png" alt="" /></td>								<td class="b">{$ordner[file].name|truncate:40:"...":true}</td>
								<td class="c" style="width:307px;"></td>
                                <td class="tools">
                                <!--<a class="tool_edit" href="managefile.php?action=editform&amp;id={$project.ID}&amp;file={$ordner[file].ID}" title="{#edit#}"></a>-->
                                {if $adminstate > 0}<a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managefile.php?action=delfolder&amp;id={$project.ID}&amp;folder={$ordner[file].ID}');"  title="{#delete#}"></a>{/if}</td>
							</tr></table>

							<div class="accordion_toggle">
							<a style="top:-33px;" class="open" href="javascript:void(0);" onclick = "switchClass('files_focus{$ordner[file].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$ordner[file].description|nl2br}
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
myLytebox.updateLyteboxItems();
					</script>
					{/literal}
				</div> {*Table_Body End*}
					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
				{*			{paginate_prev} {paginate_middle} {paginate_next} *}
					</div>

