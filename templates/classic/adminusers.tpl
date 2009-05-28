{include file="header.tpl" jsload = "ajax"}
<h1>{#administration#}<span>/ {#useradministration#}</span></h1>

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}
{include file="admin_top.tpl"}

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "deleted"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasdeleted#}</span>
		{elseif $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasedited#}</span>
        {elseif $mode == "de-assigned"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#permissionswereedited#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}



		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="userhead_toggle" class="win_block" onclick = "toggleBlock('userhead');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{#useradministration#}</span></a>
				</h2>
				</div>

				<div id = "userhead" style = "">



				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#user#}</td>
				<td class="c" style="width:307px">{#lastlogin#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_users" >
				<ul>
					{section name=user loop=$users}

					{*Color-Mix*}
					{if $smarty.section.user.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">

						<div id = "user_{$users[user].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a"><img style="position:relative;top:-2px;margin:0 0 -5px 9px;" src="./templates/standard/img/symbols/user_small.png" alt="" /></td>
						<td class="b"></td>
						<td class="c">{$users[user].lastlogin}</td>
						<td class="d"></td>
						<td class="tools">
						{if $users[user].ID != $userid}
						<a class="tool_edit" href="admin.php?action=editform&amp;id={$users[user].ID}" title="{#edit#}"></a>
						<a class="tool_del" href="javascript:confirmit('{#confirmdel#}','admin.php?action=deleteuserform&amp;id={$users[user].ID}');" title="{#delete#}"></a>
						{else}
						<a class="tool_edit" style="margin-left:21px;" href="admin.php?action=editform&amp;id={$users[user].ID}" title="{#edit#}"></a>
						{/if}
						</td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageuser.php?action=profile&amp;id={$users[user].ID}">{$users[user].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('user_{$users[user].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="b">

							{if $users[user].avatar != ""}
							<a class="avatar" href="manageuser.php?action=profile&amp;id={$users[user].ID}"><img src="thumb.php?pic=files/{$cl_config}/avatar/{$users[user].avatar}" alt="{$users[user].name}" /></a>
							{else}
							<a class="avatar" href="manageuser.php?action=profile&amp;id={$users[user].ID}"><img src="thumb.php?pic=templates/standard/img/no_avatar.jpg" alt="{$users[user].name}" /></a>
							{/if}

						</td>
						<td class="c" style="width:354px;">
						<h2>{#projects#}</h2>

							<form class="main" method="post" action="admin.php?action=massassign">
							<fieldset>
								{section name=proj loop=$users[user].projects}
								<div class="row"><input type="checkbox" class="checkbox" value="{$users[user].projects[proj].ID}" id="projects{$users[user].ID}-{$users[user].projects[proj].ID}" name="projects[]" required="0" {if $users[user].projects[proj].assigned == 1}checked="checked"{/if} />
								<label style="width:270px;" for="projects{$users[user].ID}-{$users[user].projects[proj].ID}">{$users[user].projects[proj].name|truncate:40:"...":true}</label></div>
								{/section}

								<input type = "hidden" name = "id" value = "{$users[user].ID}" />
								<div class="row">
								<div class="butn"><button type="submit">{#send#}</button></div>
								</div>

							</fieldset>
							</form>

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
				</div> {*Table_Body End*}

				<div class="clear_both"></div> {*required ... do not delete this row*}

			</div>{*userhead end*}

			{*Add User*}
			<a href="javascript:blindtoggle('adduser');" class="butn_link_b"><span>{#adduser#}</span></a><br />
			<div class="paging_wrapper" id="paging">
					{paginate_prev} {paginate_middle} {paginate_next}
			</div>
			<div class="clear_both_b"></div> {*required ... do not delete this row*}
			<div id = "adduser" style = "display:none;">
			{include file="adduserform.tpl" }
			</div>
			{*Add User End*}

			</div> {*IN end*}
		</div> {*Block B end*}



		{literal}
		<script type = "text/javascript">
		var accord_users = new accordion('accordion_users');
		</script>
		{/literal}






</div> {*Content_left end*}
{include file="footer.tpl"}