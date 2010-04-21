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

    /**
    * Install a plugin to the plugin directory
    * This just installs the plugin to the plugin directory, so Collabtive can find it.
    *
    * @param string name Name of the plugin
    * @param string description Description of what it does
    * @return int ID of the installed plugin
    *
    */
    public function installPlugin($name, $description)
    {
        $name = mysql_real_escape_string($name);
        $description = mysql_real_escape_string($description);

        $ins = mysql_query("INSERT INTO plugins (name,description) VALUES ('$name','$description')");
        if ($ins)
        {
            $insid = mysql_insert_id();
            return $insid;
        }
        else
        {
            return false;
        }
    }

    public function installPluginFromAppStore()
    {

    }

    public function listAppStorePlugins()
    {

    }


    /**
    * Remove a plugin and all of its events
    *
    * @param int $id ID of the plugin
    * @return bool
    */
    public function uninstallPlugin($plugin)
    {
        $plugin = (int) $plugin;
        $del = mysql_query("DELETE FROM plugins WHERE ID = $plugin");
        $this->delAllPluginEvents($plugin);

        if ($del1 and $del2)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
    * Activate a plugin
    *
    * @param int $plugin ID of the plugin
    * @return bool
    */
    public function activatePlugin($plugin)
    {
        $plugin = (int) $plugin;
        $upd = mysql_query("UPDATE plugins SET state = 1 WHERE ID = $id");
    }

    /**
    * Deactivate a plugin
    *
    * @param int $plugin ID of the plugin
    * @return bool
    */
    public function deactivatePlugin($plugin)
    {
        $plugin = (int) $plugin;
        $upd = mysql_query("UPDATE plugins SET state = 0 WHERE ID = $id");
    }

    /**
    * Check if a plugin is installed to the directory
    *
    * @param string $pluginname Name of the plugin
    * @return bool
    */
    public function isInstalledPlugin($pluginname)
    {
        $pluginname = mysql_real_escape_string($pluginname);

        $sel = mysql_query("SELECT ID FROM plugins WHERE name = '$pluginname'");
        $chk = mysql_fetch_row($sel);
        $chk = $chk[0];

        if ($chk > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
    * Scan the plugindir. Install not installed plugins to the directory and add its events.
    *
    * @return void $plugins
    */
    public function scanPlugindir()
    {
        $dir = scandir(CL_ROOT . "/plugins/");
        $plugins = array();

        foreach($dir as $folder)
        {
            if ($folder != "." and $folder != "..")
            {
                if (!$this->isInstalledPlugin($folder))
                {
                    $file = simplexml_load_file(CL_ROOT . "/plugins/" . $folder . "/config.xml");
                    $insid = $this->installPlugin($file->name, $file->description);
                    if ($insid)
                    {
                        foreach($file->calls as $call)
                        {
                            $this->addPluginEvent($insid, $call->call->signal , $call->call->action , $call->call->name , "");
                        }
                    }
                }
            }
        }
		return true;
    }

    public function addPluginEvent($plugin, $signal, $action, $name, $params)
    {
        $plugin = (int) $plugin;
        $signal = mysql_real_escape_string($signal);
        $action = mysql_real_escape_string($action);
        $name = mysql_real_escape_string($name);
        $params = serialize($params);

        return $ins = mysql_query("INSERT INTO pluginevents (pid,signal,action,name,params) VALUE ($plugin,'$signal','$action','$name','$params')");
    }

    public function delPluginEvent($event)
    {
        $event = (int) $event;
        return $del = mysql_query("DELETE FROM pluginevents WHERE ID = $event");
    }

    public function delAllPluginEvents($plugin)
    {
        $plugin = (int) $plugin;
        $del = mysql_query("DELETE FROM pluginevents WHERE pid = $plugin");
    }

    public function getPluginEvents($plugin)
    {
        $plugin = (int) $plugin;
        $sel = mysql_query("SELECT * FROM pluginevents WHERE pid = $plugin");
        while ($plugins = mysql_fetch_array($sel, MYSQL_ASSOC))
        {
            $this->registerPluginEvent($plugins["signal"], $plugins["action"] , $plugins["name"] , unserialize($plugins["params"]));
        }
        return $this->getFunclist();
    }

    public function getPlugin($id)
    {
        $id = (int) $id;
        $sel = mysql_query("SELECT * FROM plugins WHERE ID = $id");
        $plugin = mysql_fetch_array($sel, MYSQL_ASSOC);
        $plugin["functions"] = $this->getPluginEvents($plugin["ID"]);

        return $plugin;
    }

    public function getPlugins($state = 1)
    {
        return array();
        $state = (int) $state;
        $sel = mysql_query("SELECT ID FROM plugins WHERE state = $state");

        $plugins = array();
        //while ($plugin = mysql_fetch_array($sel, MYSQL_ASSOC))
        //{
        //    array_push($plugins, $this->getPlugin($plugin["ID"]));
        //}

        return $plugins;
    }

    public function getFunclist()
    {
        return $this->pluginFuncs;
    }
	
	public function addHookData(Smarty $template, $hook, array $data)
    {
        $template->append($hook, $data);
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
        if (!empty($thefunctions))
        {
            foreach($thefunctions as $thefunction)
            {
                $classname = explode("::", $thefunction["name"]);
                $classname = $classname[0];

                if (!class_exists($classname, false))
                {
                    include(CL_ROOT . "/plugins/" . $classname . "/class.$classname.php");
                }
                $thefunction["params"] = array();
                array_push($thefunction["params"], $objid);
                call_user_func_array($thefunction["name"], $thefunction["params"]);
            }
        }
    }

    private function registerPluginEvent($signal, $action, $name, $params)
    {
        $this->pluginFuncs[$signal][$action][] = array("name" => $name, "params" => $params);
    }

    private function unregisterPluginEvent()
    {
    }
}
