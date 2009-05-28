{include file="header.tpl" jsload = "ajax" }

<div class ="content_left">
	<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}


	{if $newproject == 1}
	{#projectwasadded#}
	{/if}
	{if $editproject == 1}
	{#projectwasedited#}
	{/if}
	{if $delproject == 1}
	{#projectwasdeleted#}
	{/if}
	{if $openproject == 1}
	{#projectwasopened#}
	{/if}
	{if $closeproject == 1}
	{#projectwasclosed#}
	{/if}
	{if $assignproject == 1}
	{#projectwasassigned#}
	{/if}
	{if $deassignproject == 1}
	{#projectwasdeassigned#}
	{/if}

	<h1>{#myprojects#}</h1>



		<div class="block_a">
			<div class="in">
				<div class="headline">

					<a href="javascript:void(0);" id="projecthead_{$myprojects[project].ID}_toggle" class="win_none" onclick = "toggleBlock('projecthead_{$myprojects[project].ID}');"><img src="./templates/standard/img/symbols/projects.png" alt="" /></a>
					

					<div style="position:relative;">
						<div class="win_tools">
							<h2>

								<img src="./templates/standard/img/symbols/projects.png" alt="" />
								<span>{#myprojects#}</span>

							</h2>
						</div>
					</div>				
				
				</div>


				<div id = "projecthead_{$myprojects[project].ID}">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#openprojects#}</td>
					<td class="c"></td>
					<td class="d"></td>
					<td class="e"></td>
					</tr>
					</table>
				</div>

				<div class="table_body">
				<div id = "accordion_1" >
				<ul>
					{section name=project loop=$myprojects}

					{*Color-Mix*}
					{if $smarty.section.project.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">

						<div id = "project_{$myprojects[project].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
						<td class="a">{if $adminstate > 4}
						  <a class="butn_check" href="javascript:closeElement('project_{$myprojects[project].ID}','manageproject.php?action=close&amp;id={$myprojects[project].ID}');" title="{#close#}"></a>
						
						{else}<div style="width:1px;height:16px;"></div>
						{/if}</td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
						<td class="tools">{if $adminstate > 4}
						<a class="tool_edit" href="manageproject.php?action=editform&amp;tid={$myprojects[project].ID}&amp;id={$myprojects[project].ID}" title="{#edit#}"></a>
						<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'project_{$myprojects[project].ID}\',\'manageproject.php?action=del&amp;id={$myprojects[project].ID}\')');"  {if $adminstate < 5}style="visibility:hidden;" {/if}></a></td>
						{/if}</td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageproject.php?action=showproject&amp;id={$myprojects[project].ID}">{$myprojects[project].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('project_{$myprojects[project].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}
						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$myprojects[project].desc}</td>
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

				<div class="clear_both"></div>





			{*Doneprojects*}

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#closedprojects#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<ul>
					{section name=clopro loop=$oldprojects}

					{*Color-Mix*}
					{if $smarty.section.clopro.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all_closed">

						<div id = "doneprojects_1" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
						<td class="a">{if $adminstate > 4}<a class="butn_checked" href="manageproject.php?action=open&amp;id={$oldprojects[clopro].ID}" title="{#open#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"><a href="manageuser.php?action=profile&amp;id={$lists[list].oldtasks[oldtask].user_id}">{$lists[list].oldtasks[oldtask].user}</a></td>
						<td class="d"></td>
						<td class="tools">{if $adminstate > 4}<a class="tool_edit" href="manageproject.php?action=editform&amp;id={$oldprojects[clopro].ID}" title="{#edit#}"></a><a class="tool_del" href="manageproject.php?action=del&amp;id={$oldprojects[clopro].ID}" title="{#delete#}"></a>{/if}</td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageproject.php?action=showproject&amp;id={$oldprojects[clopro].ID}">{$oldprojects[clopro].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('doneprojects_{$oldprojects[clopro].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$oldprojects[clopro].desc}</td>
						</tr>
						</table>
						</div> {*Accordion_Content End*}
						</div> {*Focus End*}
						</div> {*Marker End*}

					</li>
					{/section}
				</ul>
				</div> {*Table_Body End*}
			<div class="clear_both"></div> {*required ... do not delete this row*}


			</div> {*projecthead end*}

			</div> {*IN end*}
		</div> {*Block B end*}

		{literal}
		<script type = "text/javascript">
		var accord_{/literal}{$myprojects[project].ID}{literal} = new accordion('accordion_1');
		var accord_{/literal}{$oldprojects[clopro].ID}{literal} = new accordion('doneprojects_1');
		</script>
		{/literal}



</div> {*Content_left end*}
{include file="footer.tpl"}