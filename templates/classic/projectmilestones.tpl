{include file="header.tpl" jsload = "ajax"}
<h1>{$projectname}<span>/ {#milestones#}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}

{include file="top-project.tpl" }


	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "added"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/miles.png" alt=""/>{#milestonewasadded#}</span>
		{elseif $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/miles.png" alt=""/>{#milestonewasedited#}</span>
		{elseif $mode == "deleted"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/miles.png" alt=""/>{#milestonewasdeleted#}</span>
		{elseif $mode == "opened"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/miles.png" alt=""/>{#milestonewasopened#}</span>
		{elseif $mode == "closed"}
		<span class="info_in_red"><img src="templates/standard/img/symbols/miles.png" alt=""/>{#milestonewasclosed#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}




	{*Milestones late*}
		{if $countlate > 0}
		<div class="block_c" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="milehead_late_toggle" class="win_block" onclick = "toggleBlock('milehead_late');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{#latestones#}</span></a>
				</h2>
				</div>

				<div id = "milehead_late" style = "{$milestyle}">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#milestone#}</td>
				<td class="c">{#due#}</td>
				<td class="d">{#dayslate#}</td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_miles_late" >
				<ul>
					{section name=latestone loop=$latemilestones}

					{*Color-Mix*}
					{if $smarty.section.latestone.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_late">

						<div id = "miles_late_{$latemilestones[latestone].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a">{if $adminstate > 0}<a class="butn_check" href="managemilestone.php?action=close&amp;mid={$latemilestones[latestone].ID}&amp;id={$project.ID}" title="{#close#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c">{$latemilestones[latestone].fend}</td>
						<td class="d">{$latemilestones[latestone].dayslate}</td>
                        <td class="tools"><a class="tool_edit" href="managemilestone.php?action=editform&amp;mid={$latemilestones[latestone].ID}&amp;id={$project.ID}" {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#edit#}"></a>
						<a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managemilestone.php?action=del&amp;mid={$latemilestones[latestone].ID}&amp;id={$project.ID}');"  {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#delete#}"></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="managemilestone.php?action=showmilestone&amp;msid={$latemilestones[latestone].ID}&amp;id={$project.ID}">{$latemilestones[latestone].name|truncate:30:"...":true}</a></div>


						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('miles_late_{$latemilestones[latestone].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">
							{$latemilestones[latestone].desc}



							{section name=task loop=$latemilestones[latestone].tasks}
							{if  $smarty.section.task.first == TRUE}
							<br/><br/><b>{#tasklists#}:</b>
							{/if}
							<a href  = "managetasklist.php?action=showtasklist&amp;tlid={$latemilestones[stone].tasks[task].ID}&amp;id={$project.ID}">{$latemilestones[latestone].tasks[task].name}</a>
							{if  $smarty.section.task.last == FALSE},{/if}
							{/section}

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

			</div>{*milehead end*}
			</div> {*IN end*}
		</div> {*Block A end*}
		{/if}
	{*Milestones late End*}

	{*Milestones new*}<span id = "indic" style = "display:none;"><img src = "templates/standard/img/symbols/indicator_arrows.gif" alt = ""></span>

		<div class="block_c" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="timeline_toggle" class="win_block" onclick = "toggleBlock('timeline');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{#newmilestones#}</span></a>
				</h2>
				</div>

				<div id="timeline">
				<div id = "miles_new">
				<table id="timeline" class="timeline" cellpadding="0" cellspacing="1">
				<tr class="head">
				<td></td>
				{section name = day loop=$timestr}
				<td>{$timestr[day]}</td>
				{/section}
				<td></td>
				</tr>

				<tr class="content" valign="top">
				<td valign="middle" rowspan="4" style="width:12px;"><a class="scroll_left" href = "{literal}javascript:change('manageajax.php?action=timeline2prev&amp;start=0&amp;end=7','timeline');{/literal}"></a></td>
					{section name=tag loop=$timeline1}
					<td {if $timeline1[tag].tagstr == $today}class="today"{else}class="{cycle values="second,"}"{/if}><span style="white-space:nowrap;">{$timeline1[tag].tagstr}</span>
					<p>{if $timeline1[tag].milestone.ID > 0}<a id = "link{$timeline1[tag].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline1[tag].milestone.ID}&amp;id={$project.ID}">{$timeline1[tag].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline1[tag].milestone.ID}">{$timeline1[tag].milestone.desc|nl2br}</span>
						{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline1[tag].milestone.ID}{literal}','tip{/literal}{$timeline1[tag].milestone.ID}{literal}');
				</script>
				{/literal}
					{/if}</p></td>

					{/section}
				<td valign="middle" rowspan="4" style="width:12px;"><a class="scroll_right" href = "{literal}javascript:change('manageajax.php?action=timeline2next&amp;start=0&amp;end=7','timeline');{/literal}"></a></td>

					</tr>
				<tr class="content" valign="top">
					{section name=day loop=$timeline2}
					<td {if $timeline2[day].tagstr == $today}class="today"{else}class="{cycle values=",second"}"{/if}><span style="white-space:nowrap;">{$timeline2[day].tagstr}</span>
				<p>{if $timeline2[day].milestone.ID > 0}<a id = "link{$timeline2[day].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline2[day].milestone.ID}&amp;id={$project.ID}">{$timeline2[day].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline2[day].milestone.ID}">{$timeline2[day].milestone.desc|nl2br}</span>
					{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline2[day].milestone.ID}{literal}','tip{/literal}{$timeline2[day].milestone.ID}{literal}');
				</script>
				{/literal}
				{/if}</p></td>

					{/section}
				</tr>
				<tr class="content" valign="top">
					{section name=day loop=$timeline3}
					<td {if $timeline3[day].tagstr == $today}class="today"{else}class="{cycle values=",second"}"{/if}><span style="white-space:nowrap;">{$timeline3[day].tagstr}</span>
							<p>{if $timeline3[day].milestone.ID > 0}<a id = "link{$timeline3[day].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline3[day].milestone.ID}&amp;id={$project.ID}">{$timeline3[day].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline3[day].milestone.ID}">{$timeline3[day].milestone.desc|nl2br}</span>
									{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline3[day].milestone.ID}{literal}','tip{/literal}{$timeline3[day].milestone.ID}{literal}');
				</script>
				{/literal}
							{/if}</p></td>

					{/section}
				</tr>
				<tr class="content" valign="top">
					{section name=day loop=$timeline4}
					<td {if $timeline4[day].tagstr == $today}class="today"{else}class="{cycle values=",second"}"{/if}><span style="white-space:nowrap;">{$timeline4[day].tagstr}</span>
							<p>{if $timeline4[day].milestone.ID > 0}<a id = "link{$timeline4[day].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline4[day].milestone.ID}&amp;id={$project.ID}">{$timeline4[day].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline4[day].milestone.ID}">{$timeline4[day].milestone.desc|nl2br}</span>
								{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline4[day].milestone.ID}{literal}','tip{/literal}{$timeline4[day].milestone.ID}{literal}');
				</script>
				{/literal}
							{/if}</p></td>

					{/section}
				</tr>
				</table>
				<div class="clear_both_b"></div>
	</div> {* ajax end*}
	<a href = "javascript:changeshow('managemilestone.php?action=mileslist&id={$project.ID}','miles_new','indic');"><img src = "templates/standard/img/symbols/files/application-vnd.oasis.opendocument.spreadsheet-template.png" alt = ""></a>
<a href = "javascript:changeshow('managemilestone.php?action=milescal&id={$project.ID}','miles_new','indic');"><img src = "templates/standard/img/symbols/files/text-calendar.png" alt = ""></a>
				<div class="clear_both_b"></div>

			{*Add Mile*}
            {if $adminstate > 0}
			<a href="javascript:blindtoggle('addstone');" class="butn_link"><span>{#addmilestone#}</span></a><br />
			<div class="clear_both_b"></div> {*required ... do not delete this row*}
			<div id = "addstone" style = "display:none;">
			{include file="addmilestone.tpl" }
			</div>
            {/if}
			{*Add Mile End*}
			</div>

			</div> {*IN end*}
		</div> {*Block C end*}





	{*Milestones new End*}


	{*Milestones done*}

		<div class="block_c" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="milehead_done_toggle" class="win_block" onclick = "toggleBlock('milehead_done');"><img src="./templates/standard/img/symbols/miles.png" alt="" />
				<span>{#donemilestones#}</span></a>
				</h2>
				</div>

				<div id = "milehead_done" style = "">
				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#milestone#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_miles_done" >
				<ul>
					{section name=stone loop=$donemilestones}

					{*Color-Mix*}
					{if $smarty.section.stone.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all_closed">

						<div id = "miles_done_{$donemilestones[stone].ID}" class="focus_off">

						<table class="line" cellpadding="0" cellspacing="0">
						<tr>
                        <td class="a">{if $adminstate > 0}<a class="butn_checked" href="managemilestone.php?action=open&amp;mid={$donemilestones[stone].ID}&amp;id={$project.ID}" title="{#open#}"></a>{/if}</td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
                        <td class="tools"><a class="tool_edit" href="managemilestone.php?action=editform&amp;mid={$donemilestones[stone].ID}&amp;id={$project.ID}" {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#editmilestone#}"></a>
						<a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managemilestone.php?action=del&amp;mid={$donemilestones[stone].ID}&amp;id={$project.ID}');" {if $adminstate < 1}style = "visibility:hidden;"{/if} title="{#delete#}"></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="managemilestone.php?action=showmilestone&amp;msid={$donemilestones[stone].ID}&amp;id={$project.ID}">{$donemilestones[stone].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('miles_done_{$donemilestones[stone].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="descript">
							{$donemilestones[stone].desc}

							{section name=task loop=$donemilestones[stone].tasks}
							{if  $smarty.section.task.first == TRUE}
							<br/><br/><b>{#tasklists#}:</b>
							{/if}
								<a href  = "managetasklist.php?action=showtasklist&amp;tlid={$donemilestones[stone].tasks[task].ID}&amp;id={$project.ID}">{$donemilestones[stone].tasks[task].name}</a>
								{if  $smarty.section.task.last == FALSE},{/if}
							{/section}

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

			</div>{*milehead end*}
			</div> {*IN end*}
		</div> {*Block A end*}

	{*Milestones done End*}



	{literal}
	<script type = "text/javascript">
	try{
	var accord_miles = new accordion('accordion_miles_late');
	}
	catch(e)
	{}

	try{
	var accord_miles = new accordion('accordion_miles_done');
	}
	catch(e){}
	</script>
	{/literal}




</div> {*Content_left end*}
{include file="footer.tpl"}