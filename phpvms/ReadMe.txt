SimBrief Phpvms Module created by Vangelis Boulasikis (Baggelis.com)


Installation Instructions

1. Copy files to their coresponding folders

2.Edit simbrief.apiv1.php in core/modules/SimBrief
and add your API Key that you requested by email from Simbrief

3.Edit simbrief.apiv1.js in lib/js
and add your full website addres in the apropiate location

4.Edit your schedule_briefing.tpl in /core/templates and in line 195 edit the link to corespond to your site 
Example 
http://www.yoursitelink/index.php/SimBrief

5. Add this line before </head> tag in layout.tpl
 <script type="text/javascript" src="<?php echo fileurl('lib/js/simbrief.apiv1.js');?>"></script>

For any question you are free to open a new post in the phpvms forum 
I will not answer to pm and email's