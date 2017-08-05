<?php

    class SimBrief extends CodonModule
    {


        public function index()
        {


            $url = 'http://www.simbrief.com/ofp/flightplans/xml/'.$this->get->ofp_id.'.xml';
            $xml = simplexml_load_file($url);
            $this->set('info', $xml);
            $this->render('SimBrief/SimBrief.tpl'); 
            //print_r($xml);
        }
}