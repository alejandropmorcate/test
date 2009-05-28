

<div id="tabs">
	<a class="{$classes.overview}" href = "manageproject.php?action=showproject&amp;id={$project.ID}"><span>{#overview#}</span></a>
	<a class="{$classes.miles}" href = "managemilestone.php?action=showproject&amp;id={$project.ID}"><span>{#milestones#}</span></a>
    <a class="{$classes.tasks}" href = "managetask.php?action=showproject&amp;id={$project.ID}"><span>{#tasks#}</span></a>
    {if $adminstate > 0}
	<a class="{$classes.msgs}" href = "managemessage.php?action=showproject&amp;id={$project.ID}"><span>{#messages#}</span></a>
    {/if}
	<a class="{$classes.files}" href = "managefile.php?action=showproject&amp;id={$project.ID}"><span>{#files#}</span></a>
	<a class="{$classes.users}" href = "manageuser.php?action=showproject&amp;id={$project.ID}"><span>{#members#}</span></a>
	{if $adminstate > 4}
	<a class="{$classes.tracker}" href = "managetimetracker.php?action=showproject&amp;id={$project.ID}"><span>{#timetracker#}</span></a>
	{/if}
</div>

<div class="clear_both"></div>