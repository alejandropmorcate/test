		<div class="headline">
		<h2>

		<a href="javascript:void(0);" id="loghead_toggle" class="{$logbar}" onclick = "toggleBlock('loghead');"><img src="./templates/standard/img/symbols/activity.png" alt="" />


		<span>{#activity#}</span></a></h2>
		</div>

		<div id = "loghead" style = "{$logstyle}">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#action#}</td>
				<td class="c">
				{if $showproject == 1}
				{#project#}
				{/if}
				</td>
				<td class="d">{#user#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<ul>
					{section name=logitem loop=$log}

					{*Color-Mix*}
					{if $smarty.section.logitem.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}
					<div class ="marker_all">
					<div class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a">
							{if $log[logitem].type == "tasklist"}
							<img style="margin:0 0 0 5px;" src="./templates/standard/img/symbols/tasklist.png" alt="" />

							{elseif $log[logitem].type == "user"}
							<img style="margin:0 0 0 3px;" src="./templates/standard/img/symbols/user.png" alt="" />

							{elseif $log[logitem].type == "task"}
							<img style="margin:0 0 0 3px;" src="./templates/standard/img/symbols/task.png" alt="" />

							{elseif $log[logitem].type == "projekt"}
							<img style="margin:0 0 0 3px;" src="./templates/standard/img/symbols/projects.png" alt="" />

							{elseif $log[logitem].type == "milestone"}
							<img style="margin:0 0 0 3px;" src="./templates/standard/img/symbols/miles.png" alt="" />

							{elseif $log[logitem].type == "message"}
							<img style="margin:0 0 0 3px;" src="./templates/standard/img/symbols/msg.png" alt="" />

							{elseif $log[logitem].type == "datei"}
							<img style="margin:0 0 0 3px;" src = "./templates/standard/img/symbols/files.png" alt="" />

							{elseif $log[logitem].type == "track"}
							<img style="margin:0 0 0 3px;" src = "./templates/standard/img/symbols/timetracker.png" alt="" />

							{/if}
						</td>
						<td class="b">
							<strong>{$log[logitem].name|truncate:30:"...":true}</strong><br/>
							<span class="info">{#was#}
							{if $log[logitem].action == 1}
							{#added#}
							{elseif $log[logitem].action == 2}
							{#edited#}
							{elseif $log[logitem].action == 3}
							{#deleted#}
							{elseif $log[logitem].action == 4}
							{#opened#}
							{elseif $log[logitem].action == 5}
							{#closed#}
							{elseif $log[logitem].action == 6}
							{#assigned#}
							{/if}
							{$log[logitem].datum}
							</span>
						</td>
						<td class="c">
						{if $showproject == 1}
						<a href = "manageproject.php?action=showproject&amp;id={$log[logitem].project}">{$log[logitem].proname|truncate:25:"...":true}</a>
						{/if}
						</td>
						<td class="d">
						<a href = "manageuser.php?action=profile&amp;id={$log[logitem].user}">{$log[logitem].username|truncate:25:"...":true}</a>
						</td>
						<td class="tools"></td>
						</tr></table>
						</div> {*Focus End*}
						</div> {*Marker End*}

					</li>
					{/section}
				</ul>
				</div> {*Table_Body End*}
					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>

{if $adminstate > 4}
				<div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a href = "manageproject.php?action=projectlogxls&amp;id={$project.ID}"><img src = "templates/standard/img/symbols/files/excel.png" alt="" /></a>
						<a href = "manageproject.php?action=projectlogpdf&amp;id={$project.ID}" title = "{#icalexport#}"><img src = "templates/standard/img/symbols/files/application-pdf.png" alt="" /></a>

					</div>
				</div>
{/if}

				<div class="clear_both"></div> {*required ... do not delete this row*}
				</div>