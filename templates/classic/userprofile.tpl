{include file="header.tpl" jsload = "ajax"  }
<script type="text/javascript"  src="http://api.maps.yahoo.com/ajaxymap?v=3.8&appid=
YRCsiSPV34EgcnY.HiqXO2P1ukUMh0.tlLg9JjYxWqgfxgyeT1wUbg_oZ9OJ8Ti1Mg--"></script>  
<h1>{#userprofile#}</h1>
<div class ="content_left">

    <div class="infowin_left" style = "display:none;top:-36px;" id = "systemmsg">
        {if $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/img/symbols/user.png" alt=""/>{#userwasedited#}</span>
        {/if}
    </div>
    {literal}
	   <script type = "text/javascript">
	  systemMsg('systemmsg');
        </script>
    {/literal}


		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="userprofile_toggle" class="win_block" onclick = "toggleBlock('userprofile');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{$user.name}</span></a>
				</h2>
				</div>

				<div id = "userprofile" style = "">

					<div class="block_in_wrapper">


						<div style="float:left;width:360px;" >

						<table cellpadding="0" cellspacing="0">
						<tr valign="top">
                        {if $user.email}
                        <td class="label"><b>{#email#}:</b></td><td><a href = "mailto:{$user.email}">{$user.email}</a></td>
                        {/if}

						</tr>
						<tr valign="top">
                        {if $user.adress OR $user.adress2 OR $user.state OR $user.country}
						<td class="label"><b>{#address#}:</b></td>
						<td>
						<span style="display:block;clear:both;">{$user.adress}</span>
						<span style="display:block;clear:both;">{$user.zip} {$user.adress2}</span>
						<span style="display:block;clear:both;">{$user.state}</span>
						<span style="display:block;clear:both;">{$user.country}</span>
						</td>
                        {/if}
						</tr>
						{if $user.tagsarr[0] != ""}
							<tr><td class = "label"><b>{#tags#}:</b></td><td><span style="display:block;clear:both;">
							{section name = tag loop=$user.tagsarr}
							<a href = "managetags.php?action=gettag&tag={$user.tagsarr[tag]}&amp;id=0">{$user.tagsarr[tag]}</a>
							{/section}
							</span></td></tr>
						{/if}
						{if $user.url}
						<tr><td class = "label"><b>{#url#}:</b></td><td><span style="display:block;clear:both;"><a href = "{$user.url}">{$user.url}</a></span></td></tr>
						{/if}
						{if $userid == $user.ID}
						<tr><td class="label"></td><td>
						<a href="manageuser.php?action=editform&amp;id={$user.ID}" class="butn_link"><span>{#edit#}</span></a>
						</td></tr>
						{/if}
						</table>
					</div>


						<div style="float:left;width:108px;" >
						{if $user.avatar != ""}
						<div class="avatar"><img src = "thumb.php?pic=files/{$cl_config}/avatar/{$user.avatar}" alt="" /></div>
						{else}
						<div class="avatar"><img src = "thumb.php?pic=templates/standard/img/no_avatar.jpg" alt="" /></div>
						{/if}
						</div>


						<div class="clear_both_b"></div> {*required ... do not delete this row*}
	<a href = "manageuser.php?action=vcard&amp;id={$user.ID}" title="{#vcardexport#}"><img src = "templates/standard/img/symbols/files/text-x-vcard.png" alt="" /></a>



					</div> {*block_in_wrapper end*}

				</div>{*userprofile end*}

				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block B end*}
{if $adminstate > 4}
	{*Projects*}
		<div class="block_a">
			<div class="in">
				<div class="headline">
				<h2><a href="#" id="projects_toggle" class="win_block" onclick = "toggleBlock('projects');"><img src="./templates/standard/img/symbols/projects.png" alt="" />
				<span>{#projects#}</span></a>
				</h2>
				</div>

				<div id="projects">


				<div class="table_head">
				<table cellpadding="0" cellspacing="0">
				<tr>
				<td class="a"></td>
				<td class="b">{#project#}</td>
				<td class="c"></td>
				<td class="d"></td>
				<td class="e"></td>
				</tr>
				</table>
				</div>

				<div class="table_body">
				<div id = "accordion_projects" >
				<ul>
					{section name=opro loop=$opros}

					{*Color-Mix*}
					{if $smarty.section.opro.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">

						<div id = "projects_{$opros[opro].ID}" class="focus_off">

						<table cellpadding="0" cellspacing="0">
						<tr>
						<td class="a"><a class="butn_check" href="javascript:closeElement('projects_{$opros[opro].ID}','manageproject.php?action=close&amp;id={$opros[opro].ID}');" title="{#close#}"></a></td>
						<td class="b"></td>
						<td class="c"></td>
						<td class="d"></td>
						<td class="tools"><a class="tool_edit" href="manageproject.php?action=editform&amp;id={$opros[opro].ID}"></a>
						<a class="tool_del" href = "javascript:confirmfunction('{#confirmdel#}','deleteElement(\'projects_{$opros[opro].ID}\',\'admin.php?action=deletepro&amp;id={$opros[opro].ID}&amp;redir=admin.php?action=projects\')');" title="{#delete#}"></a></td>
						</tr></table>

						<div class="link_in_toggle"><a href="manageproject.php?action=showproject&amp;id={$opros[opro].ID}">{$opros[opro].name|truncate:30:"...":true}</a></div>

						<div class="accordion_toggle">
						<a class="open" href="javascript:void(0);" onclick = "switchClass('projects_{$opros[opro].ID}','focus_on','focus_off');"></a>
						</div> {*Accordeon_Toggle End*}

						<div class="accordion_content">
						<table class="description" cellpadding="0" cellspacing="0">
						<tr valign="top">
						<td class="a"></td>
						<td class="b" style="width:295px;padding-right:30px;">

								<h2>{#description#}</h2>
								<div style="width:295px;overflow:auto;">
								{$opros[opro].desc}
								</div>
						</td>
						<td class="c" style="width:263px;">



								<h2><a href = "manageuser.php?action=showproject&amp;id={$opros[opro].ID}">{#members#}</a></h2>


								<table cellpadding="0" cellspacing="0" style="background:white;">

								{section name = membs loop=$opros[opro].members}
								{if $smarty.section.membs.index % 2 == 0}
								<tr>
								{else}
								<tr style="background:#f4f7f9;">
								{/if}
								<td style="padding:2px 0;">
								<div class="avatar">
								{if $opros[opro].members[membs].avatar != ""}
								<img src = "thumb.php?pic=files/{$cl_config}/avatar/{$opros[opro].members[membs].avatar}&amp;height=25&amp;width=25" alt="" />
								{else}
								<img src = "thumb.php?pic=templates/standard/img/no_avatar.jpg&amp;height=25&amp;width=25" alt="" />
								{/if}
								</div>
								</td>
								<td style="width:204px;padding:0 0 0 5px;">
								<a href = "manageuser.php?action=profile&amp;id={$opros[opro].members[membs].ID}">{$opros[opro].members[membs].name}</a>
								</td>
								<td class="tools" style="width:26px;padding:0;">
                                <a class="tool_del" href="manageproject.php?action=deassign&amp;user={$opros[opro].members[membs].ID}&amp;id={$opros[opro].ID}&amp;redir=admin.php?action=projects" title="{#deassign#}"></a>
								</td>
								</tr>
								{/section}
								</table>



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

				</div> {*projects end*}

			</div> {*IN end*}
		</div> {*Block A end*}

{* timetracker *}
		{if $totaltime > 0}

	<a href="javascript:blindtoggle('filter');" class="butn_link"><span>{#filterreport#}</span></a><br />
					<div class="clear_both_b"></div> {*required ... do not delete this row*}
					<div id = "filter" {if $start == "" and $end == "" and $fproject < 1}style = "display:none;"{/if}>
		<div class="block_in_wrapper" style="width:600px;">
<h2>{#filterreport#}</h2>

	<form class="main" method="get" action="manageuser.php" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="start">{#start#}:</label><input type="text" name="start" id="start"  onfocus = "dpck.close();" value = "{$start}" /></div>
		<div class="row"><label for="end">{#end#}:</label><input type="text" name="end" id="end" onfocus = "dpck2.close();" value = "{$end}"/></div>
		<div class = "row"><label for = "fproject">{#project#}</label>
		<select name = "project" id = "fproject" >
		<option value = "">{#chooseone#}</option>
		{section name = proj loop=$opros}
			<option value = "{$opros[proj].ID}" {if $opros[proj].ID == $fproject}selected="selected"{/if}>{$opros[proj].name}</option>
		{/section}
		</select></div>
<input type = "hidden" name = "action" value ="profile" />
<input type = "hidden" name = "id" value="{$user.ID}" />

        {literal}
		<script type="text/javascript">
		     var dpck2	= new DatePicker({
                relative	: {/literal}'start'{literal},
                language	: {/literal}'{$locale}'{literal},
                topOffset: -75,
                leftOffset: 235,
                keepFieldEmpty: true
                });

        </script>
		<script type="text/javascript">
		     var dpck	= new DatePicker({
                relative	: {/literal}'end'{literal},
                language	: {/literal}'{$locale}'{literal},
                topOffset: -100,
                leftOffset: 235,
                keepFieldEmpty: true
                });
        </script>

        {/literal}

	    <div class="clear_both_b"></div>
<div class="clear_both_b"></div>
		<div class="row">
		<label>&nbsp;</label>
		<div class="butn"><button type="submit">{#filter#}</button></div>
		<a href = "javascript:blindtoggle('filter');" class="butn_link"><span>{#cancel#}</span></a>
		</div>
	</fieldset>
	</form>

</div> {*block_in_wrapper end*}

					</div>
{*timetracker start*}
<div class="block_b">
			<div class="in">
			<div class="headline">
				<a href="javascript:void(0);" id="tracker_toggle" class="win_none" onclick = "toggleBlock('tracker');"></a>


<div class="clear_both"></div> {*required ... do not delete this row*}

					<div style="position:relative;">
					<div class="win_tools">
					<h2>
					<img src="./templates/standard/img/symbols/timetracker.png" alt="" />
						<span>{#report#}</span>
					</h2>
					</div>
					</div>

						</div>
				<div id = "tracker" style = "display:none;" >

						<div class="table_head">
							<table cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a" style = "width:130px;padding-left:4px">{#project#}</td>
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
						<td class="a" style = "width:130px;padding-left:4px"><a href = "managetimetracker.php?action=showproject&amp;id={$tracker[track].project}" title="{$tracker[track].pname}">{$tracker[track].pname|truncate:16:"...":true}</a></td>
						<td class="a" style = "width:100px;">{$tracker[track].daystring}</td>
						<td class="a" style = "width:125px;">{$tracker[track].startstring}</td>
						<td class="a" style = "width:125px;">{$tracker[track].endstring}</td>
						<td class="a" style = "width:100px;">{$tracker[track].hours}</td>
                        <td class="tools" style = "width:42px;"><a class="tool_edit" href="managetimetracker.php?action=editform&amp;tid={$tracker[track].ID}&amp;id={$project.ID}" title="{#edit#}"></a><a class="tool_del" href="javascript:confirmit('{#confirmdel#}','managetimetracker.php?action=del&amp;tid={$tracker[track].ID}&amp;id={$project.ID}');"  title="{#delete#}"></a></td>
						</tr></table>


						<div class="accordion_toggle">
						<a class="open" style="width:80px;" href="javascript:void(0);" onclick = "switchClass('track_{$tracker[track].ID}','focus_on','focus_off');"></a>
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
							<td class="tools" style = "width:42px;"></td>
							</tr>
							</table>
				</div> {*Table_Body End*}
					<div class="paging_wrapper" id="paging" style="padding-top:16px;">
							{paginate_prev} {paginate_middle} {paginate_next}
					</div>


				<div class="export">
					<a href="javascript:void(0);" title="{#export#}"></a>
					<div class="export_men">
						<a href = "managetimetracker.php?action=userxls&amp;id={$project.ID}{if $start != "" and $end != ""}&amp;start={$start}&amp;end={$end}{/if}{if $usr > 0}&amp;usr={$usr}{/if}{if $task > 0}&amp;task={$task}{/if}{if $fproject > 0}&amp;project={$fproject}{/if}"><img src = "templates/standard/img/symbols/files/excel.png" alt="" /></a>
					<a href = "managetimetracker.php?action=userpdf&amp;id={$project.ID}{if $start != "" and $end != ""}&amp;start={$start}&amp;end={$end}{/if}{if $usr > 0}&amp;usr={$usr}{/if}{if $task > 0}&amp;task={$task}{/if}{if $fproject > 0}&amp;project={$fproject}{/if}"><img src = "templates/standard/img/symbols/files/application-pdf.png" alt="" /></a>
					</div>
				</div>


					<div class="clear_both"></div> {*required ... do not delete this row*}
							</div> {*taskhead end*}
			</div> {*IN end*}
		</div> {*Block A end*}{/if}
		{literal}
		<script type = "text/javascript">
		var accord_miles = new accordion('accordion_projects');
		var accord_track = new accordion('accordion_tracker');
		</script>
		{/literal}
		{/if}

</div> {*Content_left end*}

{include file="footer.tpl"}