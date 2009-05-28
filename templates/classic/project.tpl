{include file="header.tpl" jsload = "ajax" stage = "project"}
<h1>{$project.name}<span>/ {#overview#}</span></h1>
<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}


{include file="top-project.tpl"}

	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/projects.png" alt=""/>{#projectwasedited#}</span>
		{elseif $mode == "timeadded"}
		<span class="info_in_green"><img src="templates/standard/img/symbols/timetracker.png" alt=""/>{#timetrackeradded#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
	systemMsg('systemmsg');
	 </script>
	{/literal}


		<div class="block_a">
			<div class="in">
				{include file="menu-project.tpl"}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block A end*}
	{*Milestones*}
		<div class="block_c">
			<div class="in">
				<div class="headline">
				   	<a href="javascript:void(0);" id="milehead_toggle" class="{$milebar}" onclick = "toggleBlock('milehead');"></a>

					<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<a href="managemilestone.php?action=showproject&amp;id={$project.ID}" title="{#milestones#}">
					<img src="./templates/standard/img/symbols/miles.png" alt="" />
					<span>{#milestones#}</span>
					</a>
					</h2>
					</div>
					</div>
				</div>

				<div id="milehead"  style = "{$milestyle}">
				<table class="timeline" cellpadding="0" cellspacing="1">

				<tr class="head">
				<td></td>
				{section name = day loop=$timestr}
				<td>{$timestr[day]}</td>
				{/section}
				<td></td>
				</tr>


				<tr class="content" valign="top">

					<td valign="middle" rowspan="2" class="nav"><a class="scroll_left" href = "{literal}javascript:change('manageajax.php?action=timeline2prev&amp;start=0&amp;end=7&amp;id={/literal}{$project.ID}{literal}','milehead');{/literal}"></a></td>

					{section name=tag loop=$timeline1}
					{if $smarty.section.tag.index % 2 == 0}
						{if $timeline1[tag].tagstr == $today}
						<td class="today">
						{else}
						<td class="second">
						{/if}

					{else}
					<td>
					{/if}

					<span style="white-space:nowrap;">{$timeline1[tag].tagstr}</span>
					{if $timeline1[tag].milestone.ID > 0}
					<p><a id = "link{$timeline1[tag].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline1[tag].milestone.ID}&amp;id={$timeline1[tag].milestone[1]}" >{$timeline1[tag].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline1[tag].milestone.ID}">{$timeline1[tag].milestone.desc|nl2br}</span></p>
				{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline1[tag].milestone.ID}{literal}','tip{/literal}{$timeline1[tag].milestone.ID}{literal}');
				</script>
				{/literal}
				{/if}</td>
					{/section}

					<td valign="middle" rowspan="2" class="nav"><a class="scroll_right" href = "{literal}javascript:change('manageajax.php?action=timeline2next&amp;start=0&amp;end=7&amp;id={/literal}{$project.ID}{literal}','milehead');{/literal}"></a></td>

					</tr>

				<tr class="content" valign="top">
					{section name=day loop=$timeline2}
					{if $smarty.section.day.index % 2 == 0}
						{if $timeline2[day].tagstr == $today}
						<td class="today">
						{else}
						<td class="second">
						{/if}
					{else}
					<td>
					{/if}
					<span style="white-space:nowrap;">{$timeline2[day].tagstr}</span>
								{if $timeline2[day].milestone.ID > 0}
					<p><a id = "link{$timeline2[day].milestone.ID}" href="managemilestone.php?action=showmilestone&amp;msid={$timeline2[day].milestone.ID}&amp;id={$timeline2[day].milestone[1]}" >{$timeline2[day].milestone.name|truncate:30:"...":true}</a><br/><span style="display:none;" class="tooltip" id = "tip{$timeline2[day].milestone.ID}">{$timeline2[day].milestone.desc|nl2br}</span></p>
				{literal}
				<script type = "text/javascript">
				new Tooltip('link{/literal}{$timeline2[day].milestone.ID}{literal}','tip{/literal}{$timeline2[day].milestone.ID}{literal}');
				</script>
				{/literal}
				{/if}</td>


					{/section}
				</tr>

				</table>
				<div class="clear_both_b"></div>
	{*Add Mile*}
            {if adminstate > 0}
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

	{*Milestones End*}
{*Timetracker*}
{if $adminstate > 0}
	<div class="block_b">
				<div class="in">
		<div class="headline">

		<a href="javascript:void(0);" id="trackerhead_toggle" class="{$trackbar}" onclick = "toggleBlock('trackerhead');"></a>
                        <div class="clear_both"></div> {*required ... do not delete this row*}

                <div style="position:relative;">
                        <div class="win_tools">
                        <h2>
                        <a href="managetimetracker.php?action=showproject&amp;id={$project.ID}" title="{#milestones#}">
                        <img src="./templates/standard/img/symbols/timetracker.png" alt="" />
                        <span>{#timetracker#}</span>
                        </a>
                        </h2>
                        </div>
                        </div>

		</div>
		<div id = "trackerhead" style = "{$trackstyle}">

		<div class="block_in_wrapper">
		<form class="main" id = "trackeradd" method = "post" action = "managetimetracker.php?action=add" {literal}onsubmit="return validateCompleteForm(this,'input_error');{/literal}">
		<fieldset>
		  <input type = "hidden" name = "project" value = "{$project.ID}" />
		  	<div class = "row"><label for = "started">{#started#}:</label>
			  <input type = "text" id = "started" name = "started" required = "1"  style = "width:90px;" regexp="^\d\d:\d\d$" realname = "{#started#} (Format: hh:mm)" />&nbsp;<a href = "javascript:getnow('started');" title = "{#inserttime#}">(hh:mm)</a></div>
		  	<div class = "row"><label for = "ended">{#ended#}:</label>
			  <input  type = "text" id = "ended" name = "ended"  required = "1" regexp="^\d\d:\d\d$" realname = "{#ended#} (Format: hh:mm)" style = "width:90px;"/ >&nbsp;<a href = "javascript:getnow('ended');" title = "{#inserttime#}">(hh:mm)</a></div>
		  	<div class = "row"><label for ="trackcomm">{#comment#}:</label><textarea name = "comment" id = "trackcomm" required = "0"  ></textarea></div>
		  	<div class = "row">
			<label for = "ttask">{#task#}:</label>
			<select name = "ttask" id = "ttask" >
		  	<option value = "0" >{#chooseone#}</option>
		  	{section name = task loop=$ptasks}
		  		{if $ptasks[task].title != ""}
		  		<option value = "{$ptasks[task].ID}">{$ptasks[task].title}</option>
		  		{else}
		  		<option value = "{$ptasks[task].ID}">{$ptasks[task].text|truncate:30:"...":true}</option>
				{/if}
			{/section}
		  	</select>
		  	<div class = "row">
		  	<label>&nbsp;</label>
		 <div class="butn">	  <button type="submit">{#addbutton#}</button></div>

		  	</div>
		</fieldset>
		</form>
		</div>{*Block In Wrapper A end*}
	<div class="clear_both_b"></div>

		</div>
				</div> {*IN end*}
			</div> {*Block A end*}
{/if}

	{*Log*}
		 	<div class="block_b">
				<div class="in">
					{* Activity Log *}
					{include file="log.tpl" }
				</div> {*IN end*}
			</div> {*Block A end*}
</div> {*Content_left end*}


<div class ="content_right">
{if $done > 0}
{$flashstr}
{/if}

<div class="clear_both_b"></div>

{if $cloud != ""}
<div class = "right_in">
<h2>{#tags#}</h2>
{$cloud}
</div>
<div class="clear_both_b"></div>
{/if}
<div class="right_in">
<h2 onclick="$('query').focus();">{#search#}<span id="indicator1" style="display: none"><img src="templates/standard/img/symbols/indicator_arrows.gif" alt="{#searching#}" /></span>
</h2>
</div>
<form id = "search" class = "main" style="clear:both;" method = "get" action = "managesearch.php" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
<fieldset>
<div class = "row">
<input type="text" class = "text" id="query" name="query"  /></div>

<div id="choices"></div>
<input type = "hidden" name = "action" value = "projectsearch" />
<input type = "hidden" name = "project" value = "{$project.ID}" />
</fieldset>
<div class="butn"><button type="submit">{#gosearch#}</button></div>
</form>


</div>

{literal}
  <script type = "text/javascript">
  new Ajax.Autocompleter('query', 'choices', 'managesearch.php?action=ajaxsearch-p&project={/literal}{$project.ID}{literal}', {paramName:'query',minChars: 2,indicator: 'indicator1'});
 	</script>
{/literal}
{include file="footer.tpl"}