{include file="header.tpl" jsload = "ajax"}
<h1>{#deassignuser#}</h1>
<div class ="content_left">

		<div class="block_b" >
			<div class="in">
				<div class="headline">
				<h2><a href="javascript:void(0);" id="userdeassign_toggle" class="win_block" onclick = "toggleBlock('userdeassign');"><img src="./templates/standard/img/symbols/user.png" alt="" />
				<span>{$user.name}</span></a>
				</h2>
				</div>

				<div id = "userdeassign" style = "">

					<div class="block_in_wrapper">
                    {#deleteform#}
					<form class="main" method="post" action="manageproject.php?action=deassign&amp;user={$user.ID}&amp;id={$project.ID}&amp;redir={$redir}" enctype="multipart/form-data" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
					<fieldset>

                        <div class="row"><h3>{$project.name}</h3></div>
                            <div class = "row">
                            <label for = "assignto">{#assignto#}:</label>
    				        <select name = "assignto" id = "assignto" >
					        <option value = "0" selected>{#deletetasks#}</option>
                            {section name=member loop=$members}
                            {if $members[member].ID != $user.ID}
                            <option value="{$members[member].ID}" required="0" />{$members[member].name}</option>
                            {/if}
                            {/section}
                            </select>
                            </div>
                        <div class="clear_both">
                        <div class="butn"><button type="submit">{#send#}</button>
                        </div><a href = "javascript:history.back();" class="butn_link"><span>{#cancel#}</span></a>
					</fieldset>
					</form>

					<div class="clear_both"></div> {*required ... do not delete this row*}
					</div> {*block_in_wrapper end*}

				</div>{*userdeassign end*}
				<div class="clear_both"></div> {*required ... do not delete this row*}
			</div> {*IN end*}
		</div> {*Block B end*}


</div> {*Content_left end*}

{include file="footer.tpl"}