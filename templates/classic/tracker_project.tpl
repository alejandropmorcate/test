{include file="header.tpl" jsload = "ajax" }
<h1>{#timetracker#}</h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}
{include file="top-project.tpl" }

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/timetracker.png" alt=""/>{#timetracker#} {#was#} {#added#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/timetracker.png" alt=""/>{#timetracker#} {#was#} {#edited#}</span>
		{elseif $mode == "deleted"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/timetracker.png" alt=""/>{#timetracker#} {#was#} {#deleted#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}

	<a href="javascript:blindtoggle('filter');" class="butn_link"><span>{#filterreport#}</span></a><br />
					<div class="clear_both_b"></div> {*required ... do not delete this row*}
				<div id = "filter" {if $start == "" and $end == "" and $task < 1 and $usr < 1}style = "display:none;"{/if}>
					{include file="filtertracker.tpl" }
					</div>
	<div class="block_b">
			<div class="in">
			<div class="headline">
				<a href="javascript:void(0);" id="tracker_toggle" class="win_block" onclick = "toggleBlock('tracker');"></a>


<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<img src="templates/standard/img/symbols/timetracker.png" alt="" />
						<span>{#report#}</span>
					</h2>
					</div>
					</div>

						</div>
				<div id = "tracker" >

						<div class="table_head">
							<table cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a" style = "width:130px;padding-left:4px">{#user#}</td>
							<td class="a" style = "width:100px;">{#day#}</td>
							<td class="a" style = "width:125px;">{#started#}</td>
							<td class="a" style = "width:125px;">{#ended#}</td>
							<td class="a" style = "width:100px;">{#hours#}</td>
							<td class="tools" style = "width:42px;"></td>
							</tr>
							</table>
						</div>

				<div class="table_body">
				<div id = "accordion_tracker">
				<ul>
					{section name = track loop=$tracker}

					{*Color-Mix*}
					{if $smarty.section.track.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
						<div id = "track_{$tracker[track].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a" style = "width:130px;padding-left:4px"><a href = "manageuser.php?action=profile&amp;id={$tracker[track].user}" title="{$tracker[track].uname}">{$tracker[track].uname|truncate:16:"...":true}</a></td>
						<td class="a" style = "width:100px;">{$tracker[track].daystring}</td>
						<td class="a" style = "width:125px;">{$tracker[track].startstring}</td>
						<td class="a" style = "width:125px;">{$tracker[track].endstring}</td>
						<td class="a" style = "width:100px;">{$tracker[track].hours}</td>
                        <td class="tools" style = "width:42px;"><a class="tool_edit" href="managetimetracker.php?action=editform&amp;tid={$tracker[track].ID}&amp;id={$project.ID}" title="{#edit#}"></a>
                        <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'track_{$tracker[track].ID}\',\'managetimetracker.php?action=del&amp;tid={$tracker[track].ID}&amp;id={$project.ID}\')');"  title="{#delete#}"></a></td>
					
						</tr></table>


						<div class="accordion_toggle">
						<a class="open" style="width:75px;" href="javascript:void(0);" onclick = "switchClass('track_{$tracker[track].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}
						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="descript" style="width:628px;"><strong>{#comment#}:</strong><br />{$tracker[track].comment}
						{if $tracker[track].task > 0}
						<br /><br />
						<strong>{#task#}:</strong><br />
						<a href = "managetask.php?action=showtask&amp;tid={$tracker[track].task}&amp;id={$project.ID}">{$tracker[track].tname}</a>
						{/if}
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
					<table cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a" style = "width:130px;padding-left:4px"><strong>{#totalhours#}</strong></td>
							<td class="a" style = "width:100px;"></td>
							<td class="a" style = "width:125px;"></td>
							<td class="a" style = "width:125px;"></td>
							<td class="a" style = "width:100px;"><strong>{$totaltime}</strong></td>
							<td class="tools" style = "width:28px;"></td>
							</tr>
							</table>
				</div> {*Table_Body End*}
					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>


				<div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a href = "managetimetracker.php?action=projectxls&amp;id={$project.ID}{if $start != "" and $end != ""}&amp;start={$start}&amp;end={$end}{/if}{if $usr > 0}&amp;usr={$usr}{/if}{if $task > 0}&amp;task={$task}{/if}"><img src = "templates/standard/img/symbols/files/excel.png" alt="" /></a>
					<a href = "managetimetracker.php?action=projectpdf&amp;id={$project.ID}{if $start != "" and $end != ""}&amp;start={$start}&amp;end={$end}{/if}{if $usr > 0}&amp;usr={$usr}{/if}{if $task > 0}&amp;task={$task}{/if}"><img src = "templates/standard/img/symbols/files/application-pdf.png" alt="" /></a>
					</div>
				</div>


					<div class="clear_both"></div> {*required ... do not delete this row*}
							</div> {*taskhead end*}
			</div> {*IN end*}
		</div> {*Block A end*}

		{literal}
		<script type = "text/javascript">
		var accord_tasks = new accordion('accordion_tracker');
		</script>
		{/literal}

</div> {*Content_left end*}

{include file="footer.tpl"}