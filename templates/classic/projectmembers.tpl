{include file="header.tpl" jsload = "ajax" }
<h1>{$projectname}<span>/ {#members#}</span></h1>

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }
	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasedited#}</span>
		{elseif $mode == "deleted"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasdeleted#}</span>
		{elseif $mode == "assigned"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasassigned#}</span>
		{elseif $mode == "deassigned"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasdeassigned#}</span>
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
				<h2><a href="javascript:void(0);" id="members_head_toggle" class="win_none" onclick = "toggleBlock('members_head');toggleBlock('paging');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{#members#}</span></a>
				</h2>
				</div>

				<div id = "members_head">

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#user#}</td>
				<td class="c">{#lastlogin#}</td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_users" >
				<ul>
					{section name=member loop=$members}

					{*Color-Mix*}
					{if $smarty.section.member.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">

						<div id = "user_{$members[member].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a"><img style="position:relative;top:-2px;margin:0 0 -5px 9px;" src="./templates/standard/img/symbols/user_small.png" alt="" /></td>
						<td class="b"></td>
						<td class="c">{$members[member].lastlogin}</td>
						<td class="d"></td>
						<td class="tools">
						{if $adminstate > 4}<a class="tool_del" style="margin-left:21px;" href="manageproject.php?action=deassignform&amp;id={$project.ID}&amp;user={$members[member].ID}" title="{#deassign#}"></a>{/if}
						</td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageuser.php?action=profile&amp;id={$members[member].ID}">{$members[member].name}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('user_{$members[member].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="b">

							{if $members[member].avatar != ""}
							<a class="avatar" href="manageuser.php?action=profile&amp;id={$members[member].ID}"><img src="thumb.php?pic=files/{$cl_config}/avatar/{$members[member].avatar}" alt="{$members[member].name}" /></a>
							{else}
							<a class="avatar" href="manageuser.php?action=profile&amp;id={$members[member].ID}"><img src = "thumb.php?pic=templates/standard/img/no_avatar.jpg" alt="{$members[member].name}" /></a>
							{/if}

						</td>
						<td class="c" style="width:354px;">

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



				{if $adminstate > 4}
					{*Add User*}
					<a href="javascript:blindtoggle('adduser');" class="butn_link_b"><span>{#adduser#}</span></a><br />
					<div class="paging_wrapper" id="paging">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>
					<div class="clear_both_b"></div> {*required ... do not delete this row*}
					<div id = "adduser" style = "display:none;">
					{include file="adduserproject.tpl" }
					</div>
					{*Add User End*}
				{else}
					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>
					<div class="clear_both_b"></div> {*required ... do not delete this row*}
				{/if}


				</div> {*members_head end*}


			</div> {*IN end*}
		</div> {*Block B end*}

		{literal}
		<script type = "text/javascript">
		var accord_users = new accordion('accordion_users');
		</script>
		{/literal}


</div> {*Content_left end*}
{include file="footer.tpl"}