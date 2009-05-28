
	<ul>
							{section name=fold loop=$folders}	
								<li>
									<div class="itemwrapper" id="iw_{$folders[fold].ID}">

											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="leftmen" valign="top">
														<div class="inmenue">
															<a class="export" href="#" title="{#export#}"></a>
														</div>																				
													</td>
													<td class="thumb">
													  	<a href = "javascript:change('manageajax.php?action=fileview&id={$project.ID}&folder={$folders[fold].ID}','filescontent');">
															<img src="./templates/frost/images/symbols/folder-sub.png" alt="" />
													 	</a>																		
													</td>
													<td class="rightmen" valign="top">
														<div class="inmenue">
															<a class="del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'files_focus{$ordner[file].ID}\',\'managefile.php?action=delete&amp;id={$project.ID}&amp;file={$folders[fold].ID}\')');" title="{#delete#}" onclick="fadeToggle('iw_{$folders[fold].ID}');"></a>
															<!--<a class="edit" href="#" title="{#editfile#}"></a>-->
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<span class="name">
															<a href = "{$myprojects[project].messages[message].files[file].datei}"{if $myprojects[project].messages[message].files[file].imgfile == 1} rel="lytebox[img{$myprojects[project].messages[message].ID}]" {elseif $myprojects[project].messages[message].files[file].imgfile == 2} rel = "lyteframe[text{$myprojects[project].messages[message].ID}]"{/if} title="{$myprojects[project].messages[message].files[file].name}">
																{if $folders[fold].name != ""}
																	{$folders[fold].name|truncate:13:"...":true}
																{else}
																	{#folder#}
																{/if}
															</a>
														</span>
													</td>
												<tr/>
											</table>						
															
									</div> {*itemwrapper End*}
								</li>
							{/section} {*lop folder End*}


							{section name=file loop=$files}
								<li>
									<div class="itemwrapper" id="iw_{$files[file].ID}">

											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="leftmen" valign="top">
														<div class="inmenue">
															
														</div>																				
													</td>
													<td class="thumb">
													 	<a href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;"{/if}>
													 		{if $files[file].imgfile == 1}
													 		<img src = "thumb.php?pic={$files[file].datei}&amp;width=32" alt="{$files[file].name}" />
													 		{else}
													 		<img src = "templates/frost/images/files/{$files[file].type}.png" alt="{$files[file].name}" />
													 		{/if}
													 	</a>																		
													</td>
													<td class="rightmen" valign="top">
														<div class="inmenue">
													<a class="del" href="javascript:confirmfunction('{$langfile.confirmdel}','deleteElement(\'iw_{$files[file].ID}\',\'managefile.php?action=delete&amp;id={$project.ID}&amp;file={$files[file].ID}\')');" title="{#delete#}"></a>
														<a class="edit" href="#" title="{#editfile#}"></a>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<span class="name">
															<a href = "{$files[file].datei}"{if $files[file].imgfile == 1} rel="lytebox[img{$files[file].ID}]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text{$files[file].ID}]"{/if} title="{$files[file].name}">
																{if $files[file].title != ""}
																{$files[file].title|truncate:13:"...":true}
																{else}
																{$files[file].name|truncate:13:"...":true}
																{/if}
															</a>
														</span>
													</td>
												<tr/>
											</table>						
															
									</div> {*itemwrapper End*}
								</li>
							{/section} {*files in fldes End*}
							</ul>
							<script type = "text/javascript">
								$('dirname').innerHTML = '{$foldername}';
							
								$('filenum').innerHTML = '{$filenum}';
								new LyteBox();
							
							
							</script>