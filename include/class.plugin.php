<?php

class plugin
{
    private $pluginFuncs;
    /**
     * Constructor
     *
     * @access protected
     */
    function __construct()
    {
        $this->pluginFuncs = array();
    }

    public function loadPlugins()
    {
        $sel = mysql_query("SELECT * FROM plugins");
        while ($plugins = mysql_fetch_array($sel, MYSQL_ASSOC))
        {
            $this->registerPlugin($plugins["signal"], $plugins["action"] , $plugins["name"] , unserialize($plugins["params"]));
        }
        return $this->getFunclist();
    }

    public function registerPlugin($signal, $action, $name, $params)
    {
        $this->pluginFuncs[$signal][$action][] = array("name" => $name, "params" => $params);
    }

    public function unregisterPlugin()
    {
    }

    public function getFunclist()
    {
        return $this->pluginFuncs;
    }

    public function callSignalFuncs($signal, $action = "", $objid = 0)
    {
        if (!$action)
        {
            $thefunctions = $this->pluginFuncs[$signal];
        }
        else
        {
            $thefunctions = $this->pluginFuncs[$signal][$action];
        }

        foreach($thefunctions as $thefunction)
        {
            array_push($thefunction["params"], $objid);
            @call_user_func_array($thefunction["name"], $thefunction["params"]);
        }
    }
}
