{include file="header.tpl"  jsload = "ajax" }
<div class ="content_left">

<div id = "thecal"></div>

</div> {*Content_left end*}
{literal}
<script type = "text/javascript">
change('manageajax.php?action=newcal','thecal');
</script>
{/literal}
{include file="footer.tpl"}