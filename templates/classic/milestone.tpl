{include file="header.tpl" jsload = "ajax"}
<h1>{$projectname}</h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }



		<div class="block_c">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="mile_toggle" class="win_block" onclick = "toggleBlock('mile');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{$milestone.name}</span></a>
				</h2>
				</div>

				<div id = "mile" style = "">
					<div class="table_head">
					<table class="blue" cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b">{#milestone#}</td>
					<td class="c">{#start#}</td>
					<td class="d">{#end#}</td>
					<td class="e"></td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<ul>

					<li class="bg_a">


					<div id="mile_focus" class="focus_off">

							<table cellpadding="0" cellspacing="0">
							<tr>
							<td class="a">{if $adminstate > 0}{if $milestone.status == 1}<a class="butn_check" href="managemilestone.php?action=close&amp;mid={$milestone.ID}&amp;id={$project.ID}" title="{#close#}"></a>{else}<a class="butn_checked" href="managemilestone.php?action=open&amp;mid={$milestone.ID}&amp;id={$project.ID}" title="{#open#}"></a>{/if}{/if}</td>
							<td class="b">{$milestone.name|truncate:30:"...":true}</td>
							<td class="c">{$milestone.startstring}</td>
							<td class="d">{$milestone.endstring}</td>
							<td class="tools">{if $adminstate > 0}<a class="tool_edit" href="managemilestone.php?action=editform&amp;mid={$milestone.ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del" href="javascript:void(0);" onclick = "confirmit('{#confirmdel#}','managemilestone.php?action=del&amp;mid={$milestone.ID}&amp;id={$project.ID}');" title="{#delete#}"></a>{/if}</td>
							</tr></table>


							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							<td class="descript">{$milestone.desc|nl2br}

							{section name=task loop=$milestone.tasks}
							{if  $smarty.section.task.first == TRUE}
							<br/><br/><b>{#tasklists#}:</b>
							{/if}
								<a href  = "managetasklist.php?action=showtasklist&amp;tlid={$milestone.tasks[task].ID}&amp;id={$project.ID}">{$milestone.tasks[task].name}</a>
								{if  $smarty.section.task.last == FALSE},{/if}
							{/section}
							{section name=msg loop=$milestone.messages}
							{if  $smarty.section.msg.first == TRUE}
							<br/><b>{#messages#}:</b>
							{/if}
							<a href  = "managemessage.php?action=showmessage&amp;mid={$milestone.messages[msg].ID}&amp;id={$project.ID}">{$milestone.messages[msg].title}</a>
							{if  $smarty.section.msg.last == FALSE},{/if}
							{/section}
							</td>
							</tr>
							</table>


					</div> {*Focus End*}


					</li>
					</ul>

				</div> {*Table_Body End*}
			</div>{*Mile end*}
			<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block C end*}


</div> {*Content_left end*}
{include file="footer.tpl"}