{include file="header.tpl" jsload = "ajax" }
<h1>{$projectname}<span>/ {#tasklist#}&nbsp;({$tasklist.name})</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}


{include file="top-project.tpl" }

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/tasklist.png" alt=""/>{#tasklistwasedited#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	apperar = new Effect.Appear('systemmsg', { duration: 2.0 })
	 </script>
	{/literal}


		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="tasklist_toggle" class="win_block" onclick = "toggleBlock('tasklist');"><img src="./templates/standard/img/symbols/tasklist.png" alt="" />
				<span>{$tasklist.name}</span></a>
				</h2>
				</div>

				<div id = "tasklist" style = "">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#description#}</td>
					<td class="c">{#started#}</td>
					<td class="d"></td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<div id = "accordion_managetasklist" >
					<ul>
					<li class="bg_a">

					<div class ="marker_all">
					<div id="status_focus" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
                                <td class="a">{if $adminstate > 0}{if $tasklist.status == 1}<a class="butn_check" href="managetasklist.php?action=close&amp;tlid={$tasklist.ID}&amp;id={$project.ID}" title="{#close#}"></a>{else}<a class="butn_checked" href="managetasklist.php?action=open&amp;tlid={$tasklist.ID}&amp;id={$project.ID}" title="{#open#}"></a>{/if}{/if}</td>
								<td class="b"></td>
								<td class="c">{$tasklist.startstring}</td>
								<td class="d"></td>
                                <td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managetasklist.php?action=editform&amp;tlid={$tasklist.ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del" href="javascript:void(0);" onclick="confirmit('{#confirmdel#}','managetasklist.php?action=del&amp;tlid={$tasklist.ID}&amp;id={$project.ID}');" title="{#delete#}"></a>{/if}</td>
							</tr></table>

							<div class="accordion_toggle">
							<a class="open" href="javascript:void(0);" onclick = "switchClass('status_focus','focus_on','focus_off');">
								{if $tasklist.desc != ""}
								{$tasklist.desc|truncate:30:"...":true}
								{else}
								keine Beschreibung
								{/if}
							</a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$tasklist.desc}</td>
							</tr>
							</table>
							</div> {*Accordion_Content End*}

					</div> {*Focus End*}
					</div> {*Marker End*}

					</li>
					</ul>
					</div> {*Accordion End*}
					{literal}
					<script type = "text/javascript">
					var accord_managetasklist = new accordion('accordion_managetasklist');
					</script>
					{/literal}
				</div> {*Table_Body End*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div>{*Tasklist end*}

			</div> {*IN end*}
		</div> {*Block B end*}



		{*Tasks*}
			<div class="block_a" >
				<div class="in">
					<div class="headline">
					<h2><a href="javascript:void(0);" id="taskhead_toggle" class="win_block" onclick = "toggleBlock('taskhead');"><img src="./templates/standard/img/symbols/task.png" alt="" />
					<span>{#newtasks#}</span></a>
					</h2>
					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div>

					<div id = "taskhead" style = "">
					<div class="table_head">
					<table class="blue" cellpadding="0" cellspacing="0">
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
					<div id = "accordion_tasks" >
					<ul>
						{section name=task loop=$tasks}

						{*Color-Mix*}
						{if $smarty.section.task.index % 2 == 0}
						<li class="bg_a">
						{else}
						<li class="bg_b">
						{/if}

						{if $tasks[task].daysleft < 0}
						<div class ="marker_late">
						{elseif $tasks[task].daysleft == 0}
						<div class ="marker_today">
						{else}
						<div class ="marker_all">
						{/if}

							<div id = "tasks_{$tasks[task].ID}" class="focus_off">

							<table class="line" cellpadding="0" cellspacing="0">
							<tr>
                            <td class="a">{if $adminstate > 0}<a class="butn_check" href="managetask.php?action=close&amp;tid={$tasks[task].ID}&amp;id={$project.ID}" title="{#close#}"></a>{/if}</td>
							<td class="b"></td>
							<td class="c"><a href="manageuser.php?action=profile&amp;id={$tasks[task].user_id}">{$tasks[task].user|truncate:25:"...":true}</a></td>
							<td class="d">{$tasks[task].daysleft}</td>
                            <td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managetask.php?action=editform&amp;tid={$tasks[task].ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del" href="managetask.php?action=del&amp;tid={$tasks[task].ID}&amp;id={$project.ID}" title="{#delete#}"></a>{/if}</td>
							</tr></table>


							<div class="link_in_toggle"><a href="managetask.php?action=showtask&amp;tid={$tasks[task].ID}&amp;id={$tasks[task].project}">
								{if $tasks[task].title != ""}
								{$tasks[task].title|truncate:30:"...":true}
								{else}
								{$tasks[task].text|truncate:30:"...":true}
								{/if}
							</a></div>

							<div class="accordion_toggle">
							<a class="open" href="javascript:void(0);" onclick = "switchClass('tasks_{$tasks[task].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}

							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$tasks[task].text}</td>
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
					var accord_tasks = new accordion('accordion_tasks');
					</script>
					{/literal}

					</div> {*Table_Body End*}

					{*Add Task*}
                        {if $adminstate > 0}
						<div class="clear_both"></div>
						<a href = "javascript:blindtoggle('addtask');" class="butn_link_b"><span>{#addtask#}</span></a><br />
						<div class="clear_both"></div> {*required ... do not delete this row*}
						<div id = "addtask" style = "display:none;">
						{include file="addtask.tpl" }
						</div>
                        {/if}
					{*Add Task End*}

					<div class="clear_both_b"></div> {*required ... do not delete this row*}
					</div>{*taskhead end*}

				</div> {*IN end*}
			</div> {*Block A end*}
		{*Tasks End*}




		{*Donetasks*}
			<div class="block_a" id="donetasks">
				<div class="in">
					<div class="headline">
					<h2><a href="javascript:void(0);" id="taskhead_done_toggle" class="win_block" onclick = "toggleBlock('taskhead_done');"><img src="./templates/standard/img/symbols/task.png" alt="" />
					<span>{#donetasks#}</span></a>
					</h2>
					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div>

					<div id = "taskhead_done" style = "">
					<div class="table_head">
					<table class="blue" cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#tasks#}</td>
					<td class="c">{#user#}</td>
					<td class="d"></td>
					<td class="e"></td>
					</tr>
					</table>
					</div>

					<div class="table_body">
					<div id = "accordion_donetasks" >
					<ul>
						{section name=donetask loop=$donetasks}

						{*Color-Mix*}
						{if $smarty.section.donetask.index % 2 == 0}
						<li class="bg_a">
						{else}
						<li class="bg_b">
						{/if}


						<div class ="marker_all_closed">


							<div id = "tasks_{$donetasks[donetask].ID}" class="focus_off">

							<table class="line" cellpadding="0" cellspacing="0">
							<tr>
                            <td class="a">{if $adminstate > 0}<a class="butn_checked" href="javascript:closeElement('tasks_{$donetasks[donetask].ID}','managetask.php?action=open&amp;tid={$donetasks[donetask].ID}&amp;id={$project.ID}');" title="{#open#}"></a>{/if}</td>
							<td class="b"></td>
							<td class="c"><a href="manageuser.php?action=profile&amp;id={$donetasks[donetask].user_id}">{$donetasks[donetask].user|truncate:25:"...":true}</a></td>
							<td class="d"></td>
                            <td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managetask.php?action=editform&amp;tid={$donetasks[donetask].ID}&amp;id={$project.ID}" title="{#edit#}"></a>
                            <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'tasks_{$donetasks[donetask].ID}\',\'managetask.php?action=del&amp;tid={$donetasks[donetask].ID}&amp;id={$project.ID}\')');" title="{#delete#}"></a>{/if}</td>
							</tr></table>

							<div class="accordion_toggle">
							<a class="open" href="javascript:void(0);" onclick = "switchClass('tasks_{$donetasks[donetask].ID}','focus_on','focus_off');">
								{if $donetasks[donetask].title != ""}
								{$donetasks[donetask].title|truncate:30:"...":true}
								{else}
								{$donetasks[donetask].text|truncate:30:"...":true}
								{/if}
							</a>
							</div> {*Accordeon_Toggle End*}

							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$donetasks[donetask].text}</td>
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
					var accord_donetasks = new accordion('accordion_donetasks');
					</script>
					{/literal}

					</div> {*Table_Body End*}
					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div>{*taskhead end*}

				</div> {*IN end*}
			</div> {*Block A end*}
		{*Donetasks End*}


</div> {*Content_left end*}
{include file="footer.tpl"}