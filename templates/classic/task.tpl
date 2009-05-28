{include file="header.tpl" jsload = "ajax"}
<h1>{$projectname}<span>/ {#task#}{if $task.title != ""}&nbsp;({$task.title}){/if}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }



		<div class="block_a">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="task_toggle" class="win_block" onclick = "toggleBlock('task');"><img src="./templates/standard/img/symbols/task.png" alt="" />
                <span>
				{if $task.title != ""}
                {$task.title}
                {else}
                {$task.text}
                {/if}
                </span></a></h2>
				</div>

				<div id = "task" style = "">
					<div class="table_head">
					<table class="blue" cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#task#}</td>
				    <td class="c">{#user#}</td>
					<td class="d">{#end#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<ul>

					<li class="bg_a">

					<div id="task_focus" class="focus_off">

							<table cellpadding="0" cellspacing="0">
							<tr>
							<td class="a">{if $adminstate > 0}<a class="butn_check" href="managetask.php?action=close&amp;tid={$task.ID}&amp;id={$project.ID}" title="{#close#}"></a>{/if}</td>
							<td class="b">
	                            {if $task.title != ""}
	                            {$task.title|truncate:30:"...":true}
	                            {else}
	                            {$task.text|truncate:30:"...":true}
	                            {/if}
							</td>
							<td class="c">{$task.user|truncate:25:"...":true}</td>
							<td class="d">{$task.endstring}</td>
							<td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managetask.php?action=editform&amp;tid={$task.ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del"  href="javascript:void(0);" onclick = "confirmit('{#confirmdel#}','managetask.php?action=del&amp;tid={$task.ID}&amp;id={$project.ID}');" title="{#delete#}"></a>{/if}</td>
							</tr></table>

							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$task.text}</td>
							</tr>
							</table>


					</div> {*Focus End*}

					</li>
					</ul>

				</div> {*Table_Body End*}
			</div>{*Task end*}
			<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block C end*}


</div> {*Content_left end*}
{include file="footer.tpl"}