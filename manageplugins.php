<?php
require("./init.php");


$objplugin = new plugin();

$objplugin->scanPlugindir();
$objplugin->getPlugins(0);
echo "<pre>";
print_r($objplugin->getFunclist());
echo "</pre>";
$objplugin->callSignalFuncs("task", "add", 100);
