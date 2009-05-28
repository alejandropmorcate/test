{include file="header.tpl" jsload = "ajax"  }

<div class ="content_left">
	<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

	<h1>{#mytasks#}</h1>

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
	    {if $mode == "added"}
	    <span class="info_in_green"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasadded#}</span>
	    {elseif $mode == "edited"}
	    <span class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasedited#}</span>
	    {elseif $mode == "deleted"}
	    <span class="info_in_red"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasdeleted#}</span>
	    {elseif $mode == "opened"}
	    <span class="info_in_green"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasopened#}</span>
	    {elseif $mode == "closed"}
	    <span class="info_in_red"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasclosed#}</span>
	    {elseif $mode == "assigned"}
	    <span class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasassigned#}</span>
	    {elseif $mode == "deassigned"}
	    <span class="info_in_yellow"><img src="templates/standard/img/symbols/task.png" alt=""/>{#taskwasdeassigned#}</span>
	    {elseif $mode == "listclosed"}
	    <span class="info_in_red"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasclosed#}</span>
	    {elseif $mode == "listdeleted"}
	    <span class="info_in_red"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasdeleted#}</span>
	    {/if}
	</div>
	{literal}
	<script type = "text/javascript">
	apperar = new Effect.Appear('systemmsg', { duration: 2.0 })
	 </script>
	{/literal}



	{if $tasknum > 0}
		{section name=project loop=$myprojects}
		{if $myprojects[project].tasknum}


		<div class="block_a">
			<div class="in">
				<div class="headline">
				<a href="javascript:void(0);" id="taskhead_{$myprojects[project].ID}_toggle" class="win_none" onclick = "toggleBlock('taskhead_{$myprojects[project].ID}');"></a>

					<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="managetask.php?action=showproject&amp;id={$myprojects[project].ID}" title="{$myprojects[project].name}">
					<img src="./templates/standard/img/symbols/projects.png" alt="" />
					<span>{$myprojects[project].name}</span>
					</a>
					</h2>
					</div>
					</div>
				</div>

				<div id = "taskhead_{$myprojects[project].ID}" style = "{$taskstyle}">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b"><a href = "managetask.php?action=showproject&amp;id={$myprojects[project].ID}">{#tasks#}</a></td>
				<td class="c">{#tasklist#}</td>
				<td class="d">{#daysleft#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_{$myprojects[project].ID}" >
				<ul>
					{section name=task loop=$myprojects[project].tasks}

					{*Color-Mix*}
					{if $smarty.section.task.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					{if $myprojects[project].tasks[task].daysleft < 0}
					<div class ="marker_late">
					{elseif $myprojects[project].tasks[task].daysleft == 0}
					<div class ="marker_today">
					{else}
					<div class ="marker_all">
					{/if}
						<div id = "task_{$myprojects[project].tasks[task].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}
                        <a class="butn_check" href="javascript:closeElement('task_{$myprojects[project].tasks[task].ID}','managetask.php?action=close&amp;tid={$myprojects[project].tasks[task].ID}&amp;id={$myprojects[project].ID}');" title="{#close#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"><a href="managetasklist.php?action=showtasklist&amp;&amp;tlid={$myprojects[project].tasks[task].liste}&amp;id={$myprojects[project].ID}">{$myprojects[project].tasks[task].list|truncate:25:"...":true}</a></td>
						<td class="d">{$myprojects[project].tasks[task].daysleft}</td>
                        <td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managetask.php?action=editform&amp;tid={$myprojects[project].tasks[task].ID}&amp;id={$myprojects[project].ID}" title="{#edit#}"></a>
						<a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'task_{$myprojects[project].tasks[task].ID}\',\'managetask.php?action=del&amp;tid={$myprojects[project].tasks[task].ID}&amp;id={$myprojects[project].ID}\')');"  title="{#delete#}"></a>
						{/if}</td>
						</tr></table>

						<div class="link_in_toggle"><a href="managetask.php?action=showtask&amp;tid={$myprojects[project].tasks[task].ID}&amp;id={$myprojects[project].tasks[task].project}">
							{if $myprojects[project].tasks[task].title != ""}
							{$myprojects[project].tasks[task].title|truncate:30:"...":true}
							{else}
							{$myprojects[project].tasks[task].text|truncate:30:"...":true}
							{/if}
						</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('task_{$myprojects[project].tasks[task].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}
						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$myprojects[project].tasks[task].text|nl2br}</td>
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
					<a href = "javascript:blindtoggle('form_{$myprojects[project].ID}');" class="butn_link_b"><span>{#addtask#}</span></a>{/if}
					<a href = "managetask.php?action=ical" title = "{#icalexport#}"><img src = "templates/standard/img/symbols/files/text-calendar.png" alt="" /></a>
					<div class="clear_both_b"></div>
					<div id = "form_{$myprojects[project].ID}" style = "display:none;">
					{include file="addmytask.tpl" }
					</div>

				{*Add Task End*}




			{*Tasks donetasks*}

				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#donetasks#}</td>
				<td class="c">{#tasklist#}</td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_closed_{$myprojects[project].ID}" >
				<ul>
					{section name=oldtask loop=$myprojects[project].oldtasks}

					{*Color-Mix*}
					{if $smarty.section.oldtask.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all_closed">

						<div id = "tasks_{$myprojects[project].oldtasks[oldtask].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}
                        <a class="butn_checked" href="managetask.php?action=open&amp;tid={$myprojects[project].oldtasks[oldtask].ID}&amp;id={$myprojects[project].ID}&amp;redir=mytasks.php" title="{#open#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"><a href="managetasklist.php?action=showtasklist&amp;&amp;tlid={$myprojects[project].oldtasks[oldtask].liste}&amp;id={$myprojects[project].ID}">{$myprojects[project].oldtasks[oldtask].list|truncate:25:"...":true}</a></td>
						<td class="d"></td>
                        <td class="tools">{if $adminstate > 0}
                        <a class="tool_edit" href="managetask.php?action=editform&amp;tid={$myprojects[project].oldtasks[oldtask].ID}&amp;id={$myprojects[project].ID}" title="{#edit#}"></a>
                        <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'tasks_{$myprojects[project].oldtasks[oldtask].ID}\',\'managetask.php?action=del&amp;tid={$myprojects[project].oldtasks[oldtask].ID}&amp;id={$myprojects[project].ID}\')');" title="{#delete#}"></a>{/if}</td>
						
						</tr></table>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('tasks_{$myprojects[project].oldtasks[oldtask].ID}','focus_on','focus_off');">

							{if $myprojects[project].oldtasks[oldtask].title != ""}
							{$myprojects[project].oldtasks[oldtask].title|truncate:30:"...":true}
							{else}
							{$myprojects[project].oldtasks[oldtask].text|truncate:30:"...":true}
							{/if}

						</a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">{$myprojects[project].oldtasks[oldtask].text|nl2br}</td>
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
		{/if}

		{literal}
		<script type = "text/javascript">
		var accord_{/literal}{$myprojects[project].ID}{literal} = new accordion('accordion_{/literal}{$myprojects[project].ID}{literal}');
		var accord_{/literal}{$myprojects[project].ID}{literal} = new accordion('accordion_closed_{/literal}{$myprojects[project].ID}{literal}');
		</script>
		{/literal}
		{/section}



	{else}
	<b>{#notasks#}</b>
	{/if}


</div> {*Content_left end*}

<div class ="content_right">
	<strong>{#export#}</strong><br />
				<a title = "{#rssfeed#}" href = "managerss.php?action=mymsgs-rss&amp;user={$userid}"><img src = "templates/standard/img/symbols/files/application-rss+xml.png" alt="" /></a>
</div>
{include file="footer.tpl"}