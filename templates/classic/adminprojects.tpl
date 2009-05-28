{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
<h1>{#administration#}<span>/ {#projectadministration#}</span></h1>

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}
{include file="admin_top.tpl"}
		<div class="infowin_left" >
		<span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#projectwasdeleted#}</span>
		<span id = "closed" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#projectwasclosed#}</span>
		</div>

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#projectwasadded#}</span>
		{elseif $mode == "opened"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#projectwasopened#}</span>
        {elseif $mode == "deassigned"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#userwasdeassigned#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}


		{*Projects*}
		<div class="block_a">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="projects_toggle" class="win_block" onclick = "toggleBlock('projects');"><img src="./templates/standard/img/symbols/projects.png" alt="" />
				<span>{#openprojects#}</span></a>
				</h2>
				</div>

				<div id="projects">

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#project#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_projects" >
				<ul>
					{section name=opro loop=$opros}

					{*Color-Mix*}
					{if $smarty.section.opro.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">

						<div id = "projects_{$opros[opro].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a"><a class="butn_check" href="javascript:closeElement('projects_{$opros[opro].ID}','admin.php?action=closepro&amp;id={$opros[opro].ID}');" title="{#close#}"></a></td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
						<td class="tools">
						<a class="tool_edit" href="manageproject.php?action=editform&amp;id={$opros[opro].ID}"></a>
						<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'projects_{$opros[opro].ID}\',\'admin.php?action=deletepro&amp;id={$opros[opro].ID}\')');" title="{#delete#}"></a></td>
					
					
						</tr></table>

						<div class="link_in_toggle"><a href="manageproject.php?action=showproject&amp;id={$opros[opro].ID}">{$opros[opro].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('projects_{$opros[opro].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="b" style="width:295px;padding-right:30px;">

								<h2>{#description#}</h2>
								<div style="width:295px;overflow:auto;">
								{$opros[opro].desc}
								</div>
						</td>
						<td class="c" style="width:263px;">



								<h2><a href = "manageuser.php?action=showproject&amp;id={$opros[opro].ID}">{#members#}</a></h2>


								<table cellpadding="0" cellspacing="0" style="background:white;">

								{section name = membs loop=$opros[opro].members}
								{if $smarty.section.membs.index % 2 == 0}
								<tr>
								{else}
								<tr style="background:#f4f7f9;">
								{/if}
								<td style="padding:2px 0;">
								<div class="avatar">
								{if $opros[opro].members[membs].avatar != ""}
								<img src = "thumb.php?pic=files/{$cl_config}/avatar/{$opros[opro].members[membs].avatar}&amp;height=25&amp;width=25" alt="" />
								{else}
								<img src = "thumb.php?pic=templates/standard/img/no_avatar.jpg&amp;height=25&amp;width=25" alt="" />
								{/if}
								</div>
								</td>
								<td style="width:204px;padding:0 0 0 5px;">
								<a href = "manageuser.php?action=profile&amp;id={$opros[opro].members[membs].ID}">{$opros[opro].members[membs].name}</a>
								</td>
								<td class="tools" style="width:26px;padding:0;">
                                <a class="tool_del" href="manageproject.php?action=deassignform&amp;user={$opros[opro].members[membs].ID}&amp;id={$opros[opro].ID}&amp;redir=admin.php?action=projects" title="{#deassign#}"></a>
								</td>
								</tr>
								{/section}
								</table>



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

				</div> {*projects end*}

	{*Add Project*}
            {if $adminstate > 4}
			<a href = "javascript:blindtoggle('form_{$myprojects[project].ID}');" class="butn_link_b"><span>{#addproject#}</span></a><br />
			<div class="clear_both_b"></div>
			<div id = "form_{$myprojects[project].ID}" style = "display:none;">
            {include file="addproject.tpl" }
            </div>
            {/if}
			{*Add Project End*}

			</div> {*IN end*}
		</div> {*Block A end*}

		{literal}
		<script type = "text/javascript">
		var accord_miles = new accordion('accordion_projects');
		</script>
		{/literal}

		{*Done Projects*}
		<div class="block_a">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="doneprojects_toggle" class="win_block" onclick = "toggleBlock('doneprojects');"><img src="./templates/standard/img/symbols/projects.png" alt="" />
				<span>{#closedprojects#}</span></a>
				</h2>
				</div>

				<div id="doneprojects">


				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#project#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_doneprojects" >
				<ul>
					{section name=clopro loop=$clopros}

					{*Color-Mix*}
					{if $smarty.section.clopro.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all_closed">

						<div id = "doneprojects_{$clopros[clopro].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a"><a class="butn_checked" href="admin.php?action=openpro&amp;id={$clopros[clopro].ID}" title="{#open#}"></a></td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
						<td class="tools"><a class="tool_edit" href="manageproject.php?action=editform&amp;id={$clopros[clopro].ID}" title="{#edit#}"></a>
						<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'projects_{$clopros[clopro].ID}\',\'admin.php?action=deletepro&amp;id={$clopros[clopro].ID}\')');" title="{#delete#}"></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageproject.php?action=showproject&amp;id={$clopros[clopro].ID}">{$clopros[clopro].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('doneprojects_{$clopros[clopro].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">
							{$clopros[clopro].desc}
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

				</div> {*doneprojects end*}

			</div> {*IN end*}
		</div> {*Block A end*}

		{literal}
		<script type = "text/javascript">
		var accord_miles = new accordion('accordion_doneprojects');
		</script>
		{/literal}





</div> {*Content_left end*}
{include file="footer.tpl"}