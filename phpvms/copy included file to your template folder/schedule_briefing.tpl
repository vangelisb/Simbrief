
<h3>Flight Briefing</h3>
<script src="http://skyvector.com/linkchart.js"></script>
<table width="98%" align="center" cellpadding="4">
    <!-- Flight ID -->
    <tr style="background-color: #333; color: #FFF;">
        <td colspan="2">Flight</td>
    </tr>
    <tr>
        <td colspan="2">
        <?php echo $schedule->code.$schedule->flightnum; ?>
        </td>
    </tr>
    
    <tr  style="background-color: #333; color: #FFF;">
        <td>Departure</td>
        <td>Arrival</td>
    </tr>
    
    <tr>
        <td width="50%" ><?php echo "{$schedule->depname} ($schedule->depicao)"; ?><br />
            <a href="https://pilotweb.nas.faa.gov/geo/icaoRadius.html?icao_id=<?php echo $schedule->depicao?>&radius=2"
                target="_blank">Click to view NOTAMS</a>
        </td>
        <td width="50%" ><?php echo "{$schedule->arrname} ($schedule->arricao)"; ?><br />
            <a href="https://pilotweb.nas.faa.gov/geo/icaoRadius.html?icao_id=<?php echo $schedule->arricao?>&radius=2"
                target="_blank">Click to view NOTAMS</a></td>
    </tr>
    
    <!-- Times Row -->
    <tr style="background-color: #333; color: #FFF;">
        <td>Departure Time</td>
        <td>Arrival Time</td>
    </tr>
    <tr>
        <td width="50%" ><?php echo "{$schedule->deptime}"; ?></td>
        <td width="50%" ><?php echo "{$schedule->arrtime}"; ?></td>
    </tr>
    
    <!-- Aircraft and Distance Row -->
    <tr style="background-color: #333; color: #FFF;">
        <td>Aircraft</td>
        <td>Distance</td>
    </tr>
    <tr>
        <td width="50%" ><?php echo "{$schedule->aircraft}"; ?></td>
        <td width="50%" ><?php echo "{$schedule->distance}"; ?></td>
    </tr>
    
    <tr style="background-color: #333; color: #FFF;">
        <td>Departure METAR</td>
        <td>Arrival METAR</td>
    </tr>
    <tr>
        <td width="50%" ><div id="<?php echo $schedule->depicao; ?>" class="metar">Getting Airport METAR</div> <br />
            <a href="http://flightaware.com/resources/airport/<?php echo $schedule->depicao?>/weather" target="_blank">
            View Weather Details</a>
        </td>
        <td width="50%" ><div id="<?php echo $schedule->arricao; ?>" class="metar">Getting Airport METAR</div><br />
            <a href="http://flightaware.com/resources/airport/<?php echo $schedule->arricao?>/weather" target="_blank">
            View Weather Details</a></td>
    </tr>
    
    <!-- Route -->
    <tr style="background-color: #333; color: #FFF;">
        <td colspan="2">Route</td>
    </tr>
    <tr>
        <td colspan="2">
        <?php 
        # If it's empty, insert some blank lines
        if($schedule->route == '')
        {
            echo '<br /> <br /> <br />';
        }
        else
        {
            echo strtoupper($schedule->route); 
        }
        ?>
        </td>
    </tr>
    
    <!-- Notes -->
    <tr style="background-color: #333; color: #FFF;">
        <td colspan="2">Notes</td>
    </tr>
    <tr>
        <td colspan="2" style="padding: 6px;">
        <?php 
            # If it's empty, insert some blank lines
            if($schedule->notes == '')
            {
                echo '<br /> <br /> <br />';
            }
            else
            {
                echo "{$schedule->notes}"; 
            }
        ?>
        </td>
    </tr>
    
    
</table>

<table width="98%" align="center" padding="2">
<tr style="background-color: #333; color: #FFF; padding: 5px;">
    <td>Additional Data</td>
</tr>
<tr>
    <td><a href="http://flightaware.com/analysis/route.rvt?origin=<?php echo $schedule->depicao?>&destination=<?php echo $schedule->arricao?>">View recent IFR Routes data</a></td>
</tr>
</table>





    
  

<form id="sbapiform">





<table>
    <tr>
       <?php $planedata=(OperationsData::getAircraftByReg($schedule->registration)) ;?>
        <td><input type="hidden" name="type" size="5" type="text" placeholder="ZZZZ"  value="<?php echo $planedata->icao ;?>"></td>
               </td>
    <tr>
    <tr>
 
        <td><input type="hidden" name="orig" size="5" type="text" placeholder="ZZZZ" maxlength="4" value="<?php echo $schedule->depicao ; ?>"></td>
    <tr>
    <tr>
       
        <td><input type="hidden" name="dest" size="5" type="text" placeholder="ZZZZ" maxlength="4" value="<?php echo $schedule->arricao ; ?>"></td>
    <tr>
    <tr>
     
        <td><input type="hidden" name="route" placeholder="Enter your route here"></td>
    </tr>
    <tr>
        <td colspan=2></td>
    </tr>
    <tr>
        
        <td><input type="hidden" name="units" size="5" type="text" placeholder="ZZZZ" maxlength="4" value="KGS"></td>
         </tr>
    <tr>
     
</table>
    


<br><br>



<input type="hidden" name="airline" value="<?php echo $schedule->code?>"> 
<br>


<input type="hidden" name="fltnum" value="<?php echo $schedule->flightnum?>"> 

<?php $today = date("dMy");?>

<input type="hidden" name="date" value="<?php echo $today?>"> 

<?php $deptimes = explode(":", $schedule->deptime); ?>

<input type="hidden" name="deph" value="<?php echo $deptimes[0]?>">
<input type="hidden" name="depm" value="<?php echo $deptimes[1]?>">    

<?php $arrtimes = explode(":", $schedule->arrtime); ?>

<input type="hidden" name="steh" value="<?php echo $arrtimes[0]?>">
<input type="hidden" name="stem" value="<?php echo $arrtimes[1]?>">



<input type="hidden" name="reg" value="<?php echo $schedule->registration?>">    


 <input type="hidden" name="navlog" value="1"> 
<input type="hidden" name="selcal" value="GR-FS">    

<input type="hidden" name="planformat" value="lido">


<input type="button" onclick="simbriefsubmit('http://www.YourWebSite.com/index.php/SimBrief');" style="font-size:30px" value="Generate Simbrief">


</form>

    </div>
<div align="right" style="font-size: small;">Data Courtesy of <a href="http://flightaware.com" target="_new">FlightAware</a></div>
<br />
