{include file="header.tpl" jsload = "ajax" jsload3 = "lightbox" }

<div class ="content_left">
<input type = "hidden" name = "selectedid" id  = "selectedid"/> {*required object for focus cells*}


		<div class="block_b">
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="results_toggle" class="win_block" onclick = "toggleBlock('results');"><img src="./templates/standard/img/symbols/system-search.png" alt="" />
				<span>{$num} {#results#}</span></a>
				</h2>
				</div>

				<div id = "results">
				<div class="table_head">
					<table cellpadding="0" cellspacing="0">
					<tr>
					<td class="a"></td>
					<td class="b" style="width:396px;">{#title#}</td>
					<td class="c" style="width:188px;">{#project#}</td>
					</tr>
					</table>
				</div>


				<div class="table_body">
					<div id = "accordion_results" >
					<ul>
					{section name=obj loop=$result}

					{*Color-Mix*}
					{if $smarty.section.obj.index % 2 == 0}
					<li class="bg_a">
					{else}
					<li class="bg_b">
					{/if}

					<div class ="marker_all">
					<div id="results_focus{$result[obj].ID}" class="focus_off">

							<table cellpadding="0" cellspacing="0">
								<tr>
								<td style="height:39px;padding:0;" class="a"><img style="margin:0 0 0 3px;position:relative;top:3px;" src = "templates/standard/img/symbols/{$result[obj].icon}" alt="{$result[obj].type}" /></td>
								<td class="b" style="width:396px;"></td>
								<td class="c" style="width:188px;" >{$result[obj].pname}</td>
							</tr></table>

							<div class="link_in_toggle">
							{if $result[obj].type == "file"}
								<a style="top:-33px;" href = "files/{$result[obj].project}/{$result[obj].name}" {if $result[obj].imgfile == 1} rel="lytebox[]" {elseif $result[obj].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;" {/if}>{$result[obj].name|truncate:40:"...":true}</a>
								{elseif $result[obj].name != ""}
								<a style="top:-33px;" href = "{$result[obj].url}">{$result[obj].name|truncate:40:"...":true}</a>
								{else}
								<a style="top:-33px;" href = "{$result[obj].url}">{$result[obj].title|truncate:40:"...":true}</a>
								{/if}

							</div>

							<div class="accordion_toggle">
							<a style="top:-33px;width:385px;" class="open" href="javascript:void(0);" onclick = "switchClass('results_focus{$result[obj].ID}','focus_on','focus_off');"></a>
							</div> {*Accordeon_Toggle End*}
							<div class="accordion_content">
							<table class="description" cellpadding="0" cellspacing="0">
							<tr valign="top">
							<td class="a"></td>
							{if $result[obj].desc != ""}
							<td class="descript">{$result[obj].desc|nl2br}</td>
							{else}
							<td class="descript">{$result[obj].text|nl2br}</td>
							{/if}
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
					var accord_files = new accordion('accordion_results');

					</script>
					{/literal}
				</div> {*Table_Body End*}

				</div>

						<div class="clear_both"></div>






			</div> {*IN end*}
		</div> {*Block B end*}


</div> {*Content_left end*}
{include file="footer.tpl"}