<table  id="timeline1" class="timeline" cellpadding="0" cellspacing="1" style = "width:600px;height:400px;">

{*calender head bereich*}
	<thead>
		<tr class="head" >
			<th colspan="7">
				{*lokalisierter monat + jahr ausgeben*}
				{$mstring} {$y}
			</th>
	</tr>
	{*tagesnamen ausgeben*}
	<tr>
		<th>{$langfile.monday}</th>
		<th>{$langfile.tuesday}</th>
		<th>{$langfile.wednesday}</th>
		<th>{$langfile.thursday}</th>
		<th>{$langfile.friday}</th>
		<th>{$langfile.saturday}</th>
		<th>{$langfile.sunday}</th>
	</tr>
	</thead>
	<tbody>

	<tr class="content" valign="top">
		<td valign="middle" rowspan="1" style="width:12px;"><a class="scroll_left" href = "javascript:change('manageajax.php?action=newcal&y={$py}&m={$pm}','thecal');"></a></td>
	</tr>

	{section name = week loop=$weeks}
		
		<tr class = "content">
		
		{*tage der aktuellen woche durchlaufen*}
		{section name = day loop=$weeks[week]}
		
			{*wenn es heute is, hervorheben*}
			{if $thism == $m and $thisy == $y and $thisd == $weeks[week][day].val}
			<td class="today" id = "{$weeks[week][day].val}"><a href = "javascript:void(0)" onclick = "$('t{$weeks[week][day].val}').style.display='block'">{$weeks[week][day].val}</a>
			{else}
			<td class="second" id = "{$weeks[week][day].val}"><a href = "javascript:void(0)" onclick = "$('t{$weeks[week][day].val}').style.display='block'">{$weeks[week][day].val}</a>
			{/if}
			
			{*optionsmenue*}
			<div id = "t{$weeks[week][day].val}"  style = "display:none;border:1px solid;background:grey;color:black" onclick = "this.style.display='none'">
			<ul>
			<li>Option 1</li>
			<li>Option 2</li>
			</ul>
			</div>
			
			{*only output tasks/milestones if the day belongs to the current month*}
			{if $weeks[week][day].currmonth == 1}
			<br />
				{*Milestones des tages*}
					{if $weeks[week][day].milesnum > 0}
						<a href = "#miles{$weeks[week][day].val}" id = "mileslink{$weeks[week][day].val}" ><img src = "templates/standard/img/symbols/miles.png" alt = ""></a>
						<div id = "miles{$weeks[week][day].val}" >
						{section name = stone loop=$weeks[week][day].milestones}
						{$weeks[week][day].milestones[stone].name}<br/>
						{/section}
						</div>
						{literal}
						<script type = "text/javascript">
						new Control.Modal('mileslink{/literal}{$weeks[week][day].val}{literal}',{
						opacity: 0.8,
						position: 'relative',
						width: 500,
						height: 200
						});
						</script>
						{/literal}
					{/if}
					{if $weeks[week][day].tasksnum > 0}
						<a href = "#tasks{$weeks[week][day].val}" id = "tasklink{$weeks[week][day].val}" ><img src = "templates/standard/img/symbols/task.png" alt = ""></a>
						<div id = "tasks{$weeks[week][day].val}">
						{section name = task loop=$weeks[week][day].tasks}
						{$weeks[week][day].tasks[task].title}<br/>
						{/section}
						</div>
						{literal}
						<script type = "text/javascript">
						new Control.Modal('tasklink{/literal}{$weeks[week][day].val}{literal}',{
						opacity: 0.8,
						position: 'relative',
						width: 500,
						height: 200
						});
						</script>
						{/literal}
					{/if}
			
			
				
			
			{/if}
			
			</td>
			
	
		{*ende des tages*}
		{/section}
		</tr>
		
	{*ende der woche*}
	{/section}
	<tr class="content" valign="top">
		<td valign="middle" rowspan="1" style="width:12px;"><a class="scroll_right" href = "javascript:javascript:change('manageajax.php?action=newcal&y={$ny}&m={$nm}','thecal');"></a></td>
	</tr>
	</tbody>
</table>
