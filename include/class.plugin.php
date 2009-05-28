<?php

class plugin
{
    /**
     * Constructor
     *
     * @access protected
     */
    public $task;
    public $tasklist;
    public $project;
    public $user;
    public $datei;
    function __construct()
    {
        $task = new task();
        $tasklist = new tasklist();
        $project = new project();
        $user = new user();
        $datei = new datei();

        $this->task = $task;
        $this->tasklist = $tasklist;
        $this->project = $project;
        $this->user = $user;
        $this->datei = $datei;

	}

    public function getAvailablePlugins()
    {
        $dir = scandir("./plugins/");
        $plugins = array();

        foreach($dir as $folder)
        {
            if ($folder != "." and $folder != "..")
            {
                array_push($plugins, $folder);
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
    public function setPluginStatus($id, $status)
    {
    }
}
