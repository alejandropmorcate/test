<div id="site_background">
	<div id="sitebody">

		<div id="header">

			<div class="left">
			<h1 class="head"><a href="index.php" title="{#desktop#}"><img src="./templates/classic/img/fcw-logo-main.png" alt="" /></a></h1>
			</div>

			<div class="right">
			{if $loggedin == 1}

			<div class="button">
				<a class="{$mainclasses.desktop}" href="index.php"><span>{#desktop#}</span></a>
				<a class="{$mainclasses.profil}" href="manageuser.php?action=profile&amp;id={$userid}"><span>{#myaccount#}</span></a>
                {if $adminstate == 5}
                <a class="{$mainclasses.admin}" href="admin.php?action=projects"><span>{#administration#}</span></a>
                {/if}
				<a class="logout" href="manageuser.php?action=logout"><span>{#logout#}</span></a>

			</div>
			{/if}
			</div>

		</div>


		<div id="contentwrapper">

