{include file="header.tpl"  jsload = "ajax"  jsload1="tinymce" jsload3 = "lightbox"}
<h1>{$projectname}<span>/ {#messages#}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }
	<div class = "infowin_left">
	<span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasdeleted#}</span>
	</div>	

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/msg.png" alt=""/>{#messagewasedited#}</span>
		{elseif $mode == "replied"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/msg_reply.png" alt=""/>{#replywasadded#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}



		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="messages_toggle" class="win_block" onclick = "toggleBlock('messages');"><img src="./templates/standard/img/symbols/msgs.png" alt="" />
				<span>{#messages#}</span></a>
				</h2>
				</div>

				<div id = "messages" style = "">
				{if $messagenum > 0}

				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b" style="width:180px;">{#messages#}</td>
					<td class="c" style="width:120px;">{#on#}</td>
					<td class="d">{#by#}</td>
					<td style="width:90px;">{#replies#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<div id = "accordion_messages" >
					<ul>
					{section name=message loop=$messages}

					{*Color-Mix*}
					{if $smarty.section.message.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
					<div id="messages_focus{$messages[message].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td class="a"><a class="butn_reply" href="managemessage.php?action=replyform&amp;mid={$messages[message].ID}&amp;id={$project.ID}" title="{#answer#}"></a></td>
								<td class="b" style="width:180px;"></td>
								<td class="c" style="width:120px;">{$messages[message].postdate}</td>
								<td class="d"><a href="manageuser.php?action=profile&amp;id={$messages[message].user}">{$messages[message].username|truncate:20:"...":true}</a></td>

								<td style="width:90px;">
								{if $messages[message].replies > 0}
								<a href = "managemessage.php?action=showmessage&amp;mid={$messages[message].ID}&amp;id={$messages[message].project}#replies">{$messages[message].replies}</a>
								{else}
								{$messages[message].replies}
								{/if}
								</td>

								<td class="tools"><a class="tool_edit" href="managemessage.php?action=editform&amp;mid={$messages[message].ID}&amp;id={$project.ID}" title="{#edit#}"></a>
								<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'messages_focus{$messages[message].ID}\',\'managemessage.php?action=del&amp;mid={$messages[message].ID}&amp;id={$project.ID}\')');" title="{#delete#}"></a></td>
							</tr></table>

							<div class="link_in_toggle"><a href="managemessage.php?action=showmessage&amp;mid={$messages[message].ID}&amp;id={$project.ID}">{$messages[message].title|truncate:20:"...":true}</a></div>

							<div class="accordion_toggle">
							<a class="open" style="width:170px;" href="javascript:void(0);" onclick = "switchClass('messages_focus{$messages[message].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="b" style="width:180px;">

								{if $messages[message].avatar != ""}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=files/{$cl_config}/avatar/{$messages[message].avatar}" alt="" /></div>
								{else}
								<div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
								{/if}

							</td>
							<td class="message">
								<div class="msgin">
								{$messages[message].text|nl2br}
								</div>
								
								
							
							{if $messages[message].tagsarr[0] != "" or $messages[message].milestones[0] != ""}
							<div style="border-top:1px dashed;margin:15px 0 0 0;padding:15px 0 0 0;">	
							<!-- If Tags in Messages -->	
								{if $messages[message].tagsarr[0] != ""}
							
									<strong>{#tags#}: </strong>						
									{section name = tag loop=$messages[message].tagsarr}			
									<a href = "managetags.php?action=gettag&tag={$messages[message].tagsarr[tag]}&amp;id={$project.ID}">{$messages[message].tagsarr[tag]}</a>
									{/section}
									
								{/if}
						
								{if $messages[message].tagsarr[0] != "" and $messages[message].milestones[0] != ""}
								<br /><br />
								{/if}
															
								<!-- If Milestones in Messages -->
								{if $messages[message].milestones[0] != ""}
								
								<strong>{#milestone#}:</strong>
								<a href = "managemilestone.php?action=showmilestone&amp;msid={$messages[message].milestones.ID}&amp;id={$project.ID}">{$messages[message].milestones.name}</a>
				
								{/if}
							</div>
							{/if}
							
	
							
							<!-- If Files in Messages -->
							{if $messages[message].files[0][0] > 0}
								<table cellpadding="0" cellspacing="0" style="border-top:1px dashed;margin:15px 0">
								<tr><td colspan="3" class="thead" style="padding:9px 0 3px 0;">{#files#}</td></tr>
								{section name = file loop=$messages[message].files}
									<tr class="{cycle values="bg_one,bg_two"}">
									<td style="width:26px;padding:2px 0;">
									<a href = "{$messages[message].files[file].datei}" {if $messages[message].files[file].imgfile == 1} rel="lytebox[]" {elseif $messages[message].files[file].imgfile == 2} rel = "lyteframe[text]" {/if}><img src = "templates/standard/img/symbols/files/{$messages[message].files[file].type}.png" alt="{$messages[message].files[file].name}" /></a>
									</td><td style="width:347px;padding:0 0 0 5px;">
									<a href = "{$messages[message].files[file].datei}"{if $messages[message].files[file].imgfile == 1} rel="lytebox[img{$messages[message].ID}]" {elseif $messages[message].files[file].imgfile == 2} rel = "lyteframe[text{$messages[message].ID}]"{/if}>{$messages[message].files[file].name}</a>
									</td>
									<td class="tools" style="width:26px;padding:0;">
									<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'messages_focus{$messages[message].ID}\',\'managefile.php?action=delete&id={$messages[message].project}&file={$messages[message].files[file].ID}')\')');" title="{#delete#}"></a>

							
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
					var accord_messages = new accordion('accordion_messages');
					</script>
					{/literal}
				</div> {*Table_Body End*}

				{/if}

					{*Add Message*}
						<a href = "javascript:blindtoggle('addmsg');" class="butn_link_b"><span>{#addmessage#}</span></a>
						<div class="clear_both_b"></div> {*required ... do not delete this row*}
						<div id = "addmsg" style = "display:none;">
						{include file="addmessageform.tpl" }
						</div>
					{*Add Message End*}

				</div>{*Messages end*}


			</div> {*IN end*}
		</div> {*Block B end*}




</div> {*Content_left end*}
{include file="footer.tpl"}