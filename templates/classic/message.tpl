{include file="header.tpl"  jsload = "ajax" jsload1 = "tinymce" jsload3 = "lightbox"}
<h1>{$projectname}</h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }

<div class="infowin_left" style = "display:none;" id = "systemmsg">
	{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasedited#}</span>
		{elseif $mode == "deleted"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasdeleted#}</span>
		{elseif $mode == "replied"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/msg_reply.png" alt=""/>{#replywasadded#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	apperar = new Effect.Appear('systemmsg', { duration: 2.0 })
	makeTimer("new Effect.Fade('systemmsg', { duration: 2.0 })",7000);
	 </script>
	{/literal}




		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="message_toggle" class="win_block" onclick = "toggleBlock('message');"><img src="./templates/standard/img/symbols/msg.png" alt="" />
				<span>{$message.title}</span></a>
				</h2>
				</div>

				<div id = "message" style = "">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b" style="width:180px;">{#message#}</td>
					<td class="c" style="width:120px;">{#on#}</td>
					<td class="d">{#by#}</td>
					<td style="width:90px;">{#replies#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<ul>

					<li class="bg_a">

					<div id="message_focus" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td class="a"><a class="butn_reply" href="javascript:blindtoggle('addmsg');"></a></td>
								<td class="b" style="width:180px;">{$message.title|truncate:20:"...":true}</td>
								<td class="c" style="width:120px;">{$message.endstring}</td>
								<td class="d"><a href="manageuser.php?action=profile&amp;id={$message.user}">{$message.username|truncate:20:"...":true}</a></td>

								<td style="width:90px;">
								{$message.replies}
								</td>

								<td class="tools"><a class="tool_edit" href="managemessage.php?action=editform&amp;mid={$message.ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managemessage.php?action=del&amp;mid={$message.ID}&amp;id={$project.ID}');"  title="{#delete#}"></a></td>
							</tr></table>

							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="b" style="width:180px">

								{if $message.avatar != ""}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=files/{$cl_config}/avatar/{$message.avatar}" alt="" /></div>
								{else}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
								{/if}

							</td>
							<td class="message"><div class="msgin">{$message.text}</div>
							
							
							{if $message.tagsarr[0] != "" or $message.milestones[0] != ""}
							<div style="border-top:1px dashed;margin:15px 0 0 0;padding:15px 0 0 0;">	
								<!-- If Tags in Messages -->							
								{if $message.tagsarr[0] != ""}
								<strong>{#tags#}:</strong>
								{section name = tag loop=$message.tagsarr}
								<a href = "managetags.php?action=gettag&tag={$message.tagsarr[tag]}&amp;id={$project.ID}">{$message.tagsarr[tag]}</a>
								{/section}
								{/if}
	
								{if $message.tagsarr[0] != "" and $message.milestones[0] != ""}
								<br /><br />
								{/if}
									
									
								{if $message.milestones[0] != ""}
								<strong>{#milestone#}:</strong>
								<a href = "managemilestone.php?action=showmilestone&amp;msid={$message.milestones.ID}&amp;id={$project.ID}">{$message.milestones.name}</a>
								{/if}
							</div>
							{/if}
							
							
							
							
							{if $message.files[0][0] > 0}
								<table cellpadding="0" cellspacing="0" style="border-top:1px dashed;margin:15px 0">
								<tr><td colspan="3" class="thead" style="padding:9px 0 3px 0;">{#files#}</td></tr>
								{section name = file loop=$message.files}
								<tr class="{cycle values="bg_one,bg_two"}">
								<td style="width:26px;padding:2px 0;">
								<a href = "{$message.files[file].datei}" {if $message.files[file].imgfile == 1} rel="lytebox[]" {elseif $message.files[file].imgfile == 2} rel = "lyteframe[text]" {/if}><img src = "templates/standard/img/symbols/files/{$message.files[file].type}.png" alt="{$message.files[file].name}" /></a>
								</td><td style="width:347px;padding:0 0 0 5px;">
								<a href = "{$message.files[file].datei}" {if $message.files[file].imgfile == 1} rel="lytebox[]" {elseif $message.files[file].imgfile == 2} rel = "lyteframe[text]" {/if} style="line-height:25px">{$message.files[file].name}</a>
								</td>
								<td class="tools" style="width:26px;padding:0;">
	                            <a class="tool_del" href="javascript:void(0);" onclick = "confirmit('{#confirmdel#}','managefile.php?action=delete&id={$message.project}&file={$message.files[file].ID}');" title="{#delete#}"></a>
								</td>
								</tr>
								{/section}
								</table>
							{/if}
							</td>
							</tr>
							</table>

					</div> {*Focus End*}

					</li>
					</ul>

				</div> {*Table_Body End*}
			</div>{*Messages end*}


					{*Answer Message*}
						<a href = "javascript:blindtoggle('addmsg');" class="butn_link_b"><span>{#answer#}</span></a>
						<div class="clear_both_b"></div> {*required ... do not delete this row*}

						<div id = "addmsg" style = "display:none;">
							<div class="block_in_wrapper">
								<h2>{#answer#}</h2>

           						<form class="main"  enctype="multipart/form-data" method="post" action="managemessage.php?action=reply&amp;id={$project.ID}" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal} >
								<fieldset>
									<div class="row"><label for="title">{#title#}:</label><input type="text" name="title" id="title" required="1" realname="{#title#}" /></div>
									<div class="row_editor"><textarea name="text" rows="3" cols="1" ></textarea></div>
	<div class="row"><label for="tags">{#tags#}:</label><input type="text" name="tags" id="tags" required="0" realname="{#tags#}" /></div>

									<input type="hidden" value="{$message.ID}" name="mid" />

									<div class="clear_both_b"></div>

										<div class="clear_both_b"></div>

	<div class="row">
	<a href = "javascript:blindtoggle('files');" class="butn_link"><span>
	<img src="templates/standard/img/symbols/files.png" alt=""/>{#files#} anhängen
	</span></a>



	<div id = "files" style = "display:none;clear:both;">
	   	<div class="clear_both_b"></div>

	   	<div class="row">
		<label for = "thefiles">{#attachfile#}</label>
		<select name = "thefiles" id = "thefiles">
		<option value = "0">{#chooseone#}</option>
		{section name = file loop=$ordner}
		<option value = "{$ordner[file].ID}">{$ordner[file].name}</option>
		{/section}
		</select>
		</div>

		<div class="clear_both_b"></div>

		<strong>{#or#} {#addfile#}</strong>

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
									<div class="row">
									<div class="butn"><button type="submit">{#addbutton#}</button></div>
									<a href = "javascript:blindtoggle('addmsg');" class="butn_link"><span>{#cancel#}</span></a>
									</div>

								</fieldset>
								</form>
							</div> {*block_in_wrapper end*}
						</div>
					{*Answer Message End*}


			</div> {*IN end*}
		</div> {*Block B end*}

{if $replies > 0}

		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="reply_toggle" class="win_block" onclick = "toggleBlock('reply');"><img src="./templates/standard/img/symbols/msg_reply.png" alt="" />
				<span id="replies">{#replies#}</span></a>
				</h2>
				</div>

				<div id = "reply" style = "">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b" style="width:180px;">{#replies#}</td>
					<td class="c" style="width:120px;">{#on#}</td>
					<td class="d">{#by#}</td>
					<td style="width:90px;"></td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<div id = "accordion_replies" >
					<ul>
					{section name=reply loop=$replies}
					{*Color-Mix*}
					{if $smarty.section.reply.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
					<div id="replies_focus{$replies[reply].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td class="a"></td>
								<td class="b" style="width:180px;"></td>
								<td class="c" style="width:120px;">{$replies[reply].postdate}</td>
								<td class="d"><a href="manageuser.php?action=profile&amp;id={$replies[reply].user}">{$replies[reply].username|truncate:20:"...":true}</a></td>

								<td style="width:90px;"></td>

								<td class="tools"><a class="tool_edit" href="managemessage.php?action=editform&amp;mid={$replies[reply].ID}&amp;id={$message.project}" title="{#edit#}"></a><a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managemessage.php?action=del&amp;mid={$replies[reply].ID}&amp;id={$message.project}');"   title="{#delete#}"></a></td>
							</tr></table>

							<div class="accordion_toggle">
							<a class="open" style="width:170px;" href="javascript:void(0);" onclick = "switchClass('replies_focus{$replies[reply].ID}','focus_on','focus_off');">{$replies[reply].title|truncate:20:"...":true}</a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="b" style="width:184px">

								{if $replies[reply].avatar != ""}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=files/{$cl_config}/avatar/{$replies[reply].avatar}" alt="" /></div>
								{else}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
								{/if}

							</td>
							<td class="message"><div class="msgin">{$replies[reply].text}</div>

							{if $replies[reply].tagsarr[0] != ""}<br /><strong>{#tags#}:</strong>
							{section name = tag loop=$replies[reply].tagsarr}
							<a href = "managetags.php?action=gettag&tag={$replies[reply].tagsarr[tag]}&amp;id={$project.ID}">{$replies[reply].tagsarr[tag]}</a>
							{/section}
							{/if}
								{if $replies[reply].files[0][0] > 0}
								<table cellpadding="0" cellspacing="0" style="border-top:1px dashed;margin:15px 0">
								<tr><td colspan="3" class="thead" style="padding:9px 0 3px 0;">{#files#}</td></tr>
								{section name = file loop=$replies[reply].files}
								<tr class="{cycle values="bg_one,bg_two"}">
								<td style="width:26px;padding:2px 0;">
								<a href = "{$replies[reply].files[file].datei}" {if $replies[reply].files[file].imgfile == 1} rel="lytebox[]" {elseif $replies[reply].files[file].imgfile == 2} rel = "lyteframe[text]" {/if}><img src = "templates/standard/img/symbols/files/{$replies[reply].files[file].type}.png" alt="{$replies.files[file].name}" /></a>
								</td><td style="width:347px;padding:0 0 0 5px;">
								<a href = "{$replies[reply].files[file].datei}" {if $replies[reply].files[file].imgfile == 1} rel="lytebox[]" {elseif $replies[reply].files[file].imgfile == 2} rel = "lyteframe[text]" {/if} style="line-height:25px">{$replies[reply].files[file].name}</a>
								</td>
								<td class="tools" style="width:26px;padding:0;">
	                            <a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managefile.php?action=delete&id={$replies[reply].project}&file={$replies[reply].files[file].ID}');" title="{#delete#}"></a>
								</td>
								</tr>
								{/section}
								</table>
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
					var accord_replies = new accordion('accordion_replies');
					accord_replies.activate($$('#accordion_replies .accordion_toggle')[0]);
					</script>
					{/literal}
				</div> {*Table_Body End*}
			</div>{*Replies end*}
			<div class="clear_both"></div> {*required ... do not delete this row*}

			</div> {*IN end*}
		</div> {*Block B end*}
{/if}


</div> {*Content_left end*}
{include file="footer.tpl"}