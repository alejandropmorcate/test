{include file="header.tpl" jsload = "ajax" }
<h1>{$projectname}<span>/ {#tasks#}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id = "selectedid"/> {*required object for focus cells*}


{include file="top-project.tpl" }
	{*System Message*}
	
	<div class="infowin_left"  id = "systemmsg">
		<span id = "added" style = "display:none;" class="info_in_green"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasadded#}</span>
		<span id = "edited" style = "display:none;" class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasedited#}</span>
		<span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasdeleted#}</span>
		<span id = "opened" style = "display:none;" class="info_in_green"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasopened#}</span>
		<span id = "closed" style = "display:none;" class="info_in_green"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasclosed#}</span>
		<span id = "assigned" style = "display:none;" class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasassigned#}</span>
		<span id = "deassigned" style = "display:none;" class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasdeassigned#}</span>
		<span id = "listadded" style = "display:none;" class="info_in_green"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasadded#}</span>
        <span id = "listclosed" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/tasklist_done.png" alt=""/>{#tasklistwasclosed#}</span>
		<span id = "listdeleted" style = "display:none;" class="info_in_red"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasdeleted#}</span>
		<span id = "listopened" style = "display:none;" class="info_in_green"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasopened#}</span>

	</div>
	{*/System Message*}

{*Add Tasklist*}
  {if $adminstate > 0}
	<a href = "javascript:blindtoggle('addlist');" class="butn_link"><span>{#addtasklist#}</span></a>
	<div class="clear_both"></div> {*required ... do not delete this row*}
	<div id = "addlist" style = "display:none;">
	{include file="addtasklist.tpl" }
</div><br />
{/if}
{*/Add Tasklist*}

{if $lists[0][0]}
	{*Tasks*}
	{section name=list loop=$lists}
		<div class="block_a" >
			<div class="in">
				<div class="headline">
					<a href="javascript:void(0);" id="taskhead_{$lists[list].ID}_toggle" class="win_block" onclick = "toggleBlock('taskhead_{$lists[list].ID}');"></a>

					<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="managetasklist.php?action=showtasklist&amp;id={$project.ID}&amp;tlid={$lists[list].ID}" title="{#tasklist#} {$lists[list].name}">
					<img src="./templates/standard/img/symbols/tasklist.png" alt="" />
					<span>{$lists[list].name}</span>
					</a>
					</h2>
					</div>
					</div>

					<div style="position:relative;">
					<div class="win_tools" style="left:541px;">
                    {if $adminstate > 0}<a href="managetasklist.php?action=close&amp;tlid={$lists[list].ID}&amp;id={$project.ID}" class="wintool_close" title="{#close#}" ></a>
					<a href="managetasklist.php?action=editform&amp;tlid={$lists[list].ID}&amp;id={$project.ID}" class="wintool_edit" title="{#edit#}" ></a>
					<a href="javascript:confirmit('{#confirmdel#}','managetasklist.php?action=del&amp;tlid={$lists[list].ID}&amp;id={$project.ID}');" class="wintool_del" title="{#delete#}" ></a>{/if}
					</div>
					</div>
				</div>

				<div id = "taskhead_{$lists[list].ID}" style = "{$taskstyle}">

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#tasks#}</td>
				<td class="c">{#user#}</td>
				<td class="d">{#daysleft#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_{$lists[list].ID}" >
				<ul>
					{section name=task loop=$lists[list].tasks}

					{*Color-Mix*}
					{if $smarty.section.task.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					{if $lists[list].tasks[task].daysleft < 0}
					<div class ="marker_late">
					{elseif $lists[list].tasks[task].daysleft == 0}
					<div class ="marker_today">
					{else}
					<div class ="marker_all">
					{/if}

						<div id = "tasks_{$lists[list].tasks[task].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}
                        <a class="butn_check" href="javascript:closeElement('tasks_{$lists[list].tasks[task].ID}','managetask.php?action=close&amp;tid={$lists[list].tasks[task].ID}&amp;id={$project.ID}');" title="{#close#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"><a href="manageuser.php?action=profile&amp;id={$lists[list].tasks[task].user_id}">{$lists[list].tasks[task].user|truncate:25:"...":true}</a></td>
						<td class="d">{$lists[list].tasks[task].daysleft}</td>
                        <td class="tools">
                        <a class="tool_edit" id = "edit_task{$lists[list].tasks[task].ID}" href="managetask.php?action=editform&amp;tid={$lists[list].tasks[task].ID}&amp;id={$project.ID}" {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#edit#}"></a>
						<a class="tool_del"   href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'tasks_{$lists[list].tasks[task].ID}\',\'managetask.php?action=del&amp;tid={$lists[list].tasks[task].ID}&amp;id={$project.ID}\')');"    {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#delete#}"></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="managetask.php?action=showtask&amp;tid={$lists[list].tasks[task].ID}&amp;id={$lists[list].tasks[task].project}">
							{if $lists[list].tasks[task].title != ""}
							{$lists[list].tasks[task].title|truncate:30:"...":true}
							{else}
							{$lists[list].tasks[task].text|truncate:30:"...":true}
							{/if}
						</a></div>

						<div class="accordion_toggle">
						<a class="open" href="#" onclick = "switchClass('tasks_{$lists[list].tasks[task].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$lists[list].tasks[task].text|nl2br}</td>
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



			{*Add Task*}
                <div class="clear_both"></div>{if $adminstate > 0}
                <a href = "javascript:blindtoggle('form_{$lists[list].ID}');" class="butn_link_b" ><span>{#addtask#}</span></a>{/if}

				<div class="clear_both_b"></div>
				<div id = "form_{$lists[list].ID}" style = "display:none;">
                {include file="addtask.tpl" }
				</div>
			{*Add Task End*}

			</div> {*taskhead end*}
			</div> {*IN end*}
		</div> {*Block A end*}
	

	{literal}
		<script type = "text/javascript">
		var accord_{/literal}{$lists[list].ID}{literal} = new accordion('accordion_{/literal}{$lists[list].ID}{literal}');


		</script>
	{/literal}
	{/section}
	{/if}
	{*Tasks End*}
	
{*only show the block if there are closed tasklists*}
{if $oldlists[0][0]}
	{*Done Tasklists*}
		<div class="block_a" >
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="taskhead_{$oldlists[oldlist].ID}_toggle" class="win_block" onclick = "toggleBlock('taskhead_{$oldlists[oldlist].ID}');"><img src="./templates/standard/img/symbols/tasklist_done.png" alt="" />
				<span>{#donetasklists#}</span></a>
				</h2>
				<div class="clear_both"></div> {*required ... do not delete this row*}
				</div>

				<div id = "taskhead_{$oldlists[oldlist].ID}" style = "{$taskstyle}">

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#tasklist#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_{$oldlists[oldlist].ID}" >
				<ul>
					{section name = oldlist loop=$oldlists}


					{*Color-Mix*}
					{if $smarty.section.oldlist.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all_closed">

						<div id = "tasks_{$oldlists[oldlist].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}<a class="butn_checked" href="javascript:closeElement('tasks_{$oldlists[oldlist].ID}','managetasklist.php?action=open&amp;tlid={$oldlists[oldlist].ID}&amp;id={$project.ID}');" title="{#open#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
                        <td class="tools"><a class="tool_del" style="margin-left:21px;" href="managetasklist.php?action=del&amp;tlid={$oldlists[oldlist].ID}&amp;id={$project.ID}" title="{#delete#}" {if $adminstate < 1}style = "visibility:hidden;"{/if}></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="managetasklist.php?action=showtasklist&amp;id={$project.ID}&amp;tlid={$oldlists[oldlist].ID}">

							{$oldlists[oldlist].name|truncate:30:"...":true}

						</a></div>

						<div class="accordion_toggle">
						<a class="open" href="#" onclick = "switchClass('tasks_{$oldlists[oldlist].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$oldlists[oldlist].desc}</td>
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
			</div> {*taskhead end*}

			</div> {*IN end*}
		</div> {*Block A end*}
	

	{literal}
		<script type = "text/javascript">
		var accord_{/literal}{$oldlists[oldlist].ID}{literal} = new accordion('accordion_{/literal}{$oldlists[oldlist].ID}{literal}');

		</script>
	{/literal}
	{/if}
	{*Tasks End*}
	
	{*if no lists are there at all, display a message*}
	{if !$oldlists[0][0] and !$lists[0][0]}
	<div style = "text-align:center;">{#notasklists#}</div>
	{/if}


</div> {*Content_left end*}


{*Right Column*}
<div class="content_right">

</div>

{include file="footer.tpl"}