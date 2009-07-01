<?php
require("./init.php");

class testplugin{
    public static function testit($objid)
    {
        echo "huhuhu $objid";
    }
}

$objplugin = new plugin();

$objplugin->registerPlugin("task","add","testplugin::testit",array() );

$plugins = $objplugin->getFunclist();
echo "<pre>";
print_r ($plugins);
echo "</pre>";

$objplugin->callSignalFuncs("task","add",100);