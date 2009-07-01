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

    public function uninstallPlugin($id)
    {
        $id = (int) $id;
        $del = mysql_query("DELETE FROM plugins WHERE ID = $id");
        $this->delAllPluginEvents($id);

        if ($del1 and $del2)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function activatePlugin($plugin)
    {
        $plugin = (int) $plugin;
        $upd = mysql_query("UPDATE plugins SET state = 1 WHERE ID = $id");
    }

    public function deactivatePlugin($plugin)
    {
        $plugin = (int) $plugin;
        $upd = mysql_query("UPDATE plugins SET state = 0 WHERE ID = $id");
    }

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

    public function scanPlugindir()
    {
        echo CL_ROOT . "/plugins/";
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
        if (!empty($plugins))
        {
            return $plugins;
        }
        else
        {
            return false;
        }
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
        $state = (int) $state;
        $sel = mysql_query("SELECT ID FROM plugins WHERE state = $state");

        $plugins = array();
        while ($plugin = mysql_fetch_array($sel, MYSQL_ASSOC))
        {
            array_push($plugins, $this->getPlugin($plugin["ID"]));
        }

        return $plugins;
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
        if (!empty($thefunctions))
        {
            foreach($thefunctions as $thefunction)
            {
                $classname = explode("::",$thefunction["name"]);
                $classname = $classname[0];

                if(!class_exists($classname,false))
                {
                echo CL_ROOT . "/plugins/" . $classname . "/class.$classname.php";
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
