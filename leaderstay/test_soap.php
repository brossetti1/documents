<?php
	require_once('nusoap.php');

	$client = new nusoap_client('http://leaderstay.com/testing/leaderstay.php');
//	$client = new nusoap_client('http://leaderstay.com/leaderstay.php');

	/*make a reservation*/
/*	$param = array(	'id'=>"1", 
			'code' => "35w490tjgf1", 
			'firstname'  => "myname" , 
			'lastname' => "kp" ,
			'email'  => "test@test.com", 
			'telnumber'=> "6987543210" ,
			'countryofresidence'=> "gr", 
			'propertycode'=> "3",  
			'checkindate'=> "14/11/2012",
			'numberofnights'=>"2",
			'asksuitability'=> "pets|elderly or infirm",
			'persons'=>"3");
	$reply = $client->call('reserve',array('parameters' => $param));*/


	/*amend a reservation*/
/*	$param = array(	'id'=>"1", 
			'old_LScode' => "513947",
			'code' => "35w490tjgfge2", 
			'firstname'  => "myname" , 
			'lastname' => "kp" ,
			'email'  => "test@test.com", 
			'telnumber'=> "6987543210" ,
			'countryofresidence'=> "gr", 
			'checkindate'=> "17/09/2011",
			'checkintime'=> "09:30",
			'checkouttime'=>"12:00",
			'numberofnights'=>"1",
			'persons'=>"3");

	$reply = $client->call('amend',array('parameters' => $param));*/


	/*cancel a reservation*/
/*	$param = array(	'id'=>"1", 
			'LScode' => "513947_1");
//			'code' => "456bedwr");

	$reply = $client->call('cancel',array('parameters' => $param));
	

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "result=".$reply['result'] . " <br/>";
				echo "confirmationnumber=".$reply['confirmationnumber'] . " <br/>";
		}
	}
	*/
	
	/*get a list of all the villas*/
	$param = array('id'=>"1", 'villaid' => '3');

	$reply = $client->call('getAvailableInfo',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "name=".$reply . " <br/>";
			echo "----------------------------------------<br/>";
			foreach ($reply as $r ) {
				echo "villaid=".$r['villaid'] . " <br/>";
				echo "name=".$r['name'] . " <br/>";
				echo "country=".$r['country'] . " <br/>";
				echo "region=".$r['region'] . " <br/>";
				echo "area=".$r['area'] . " <br/>";
				echo "street_address=".$r['street_address'] . " <br/>";
				echo "property_type=".$r['property_type'] . " <br/>";
				echo "built=".$r['built'] . " <br/>";
				echo "renovated=".$r['renovated'] . " <br/>";
				echo "size_SQM=".$r['size_SQM'] . " <br/>";
				echo "max_persons=".$r['max_persons'] . " <br/>";
				echo "floors_no=".$r['floors_no'] . " <br/>";
				echo "grounds_SQM=".$r['grounds_SQM'] . " <br/>";
				echo "view=".$r['view'] . " <br/>";
				echo "change_of_sheets=".$r['change_of_sheets'] . " <br/>";
				echo "checkin_time=".$r['checkin_time'] . " <br/>";
				echo "checkout_time=".$r['checkout_time'] . " <br/>";
			echo "----------------------------------------<br/>";
			}
			
		}
	}
	
	/*get list and prices of all available villas in specified dates*/
/*	$param = array('id'=>"1", 
			'checkindate'=> "14/07/2012",
			'numberofnights'=>"2",
			'persons'=>"3");

	$reply = $client->call('getPriceAvailabilityList',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "name=".$reply . " <br/>";
			echo "----------------------------------------<br/>";
			foreach ($reply as $r ) {
				echo "villaid=".$r['villaid'] . " <br/>";
				echo "price=".$r['price'] . " ".$r['currency'] . " <br/>";
				if( $r['offer'] !== "" ) echo " (Offer: ".$r['offer'].")<br />";
				echo "----------------------------------------<br/>";
			}
		}
	}*/

	/*get available info of a villa*/
/*	$param = array(	'id'=>"1",
			'villaid' => "3");

	$reply = $client->call('getAvailableInfo',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "name=".$reply . " <br/>";
			echo "----------------------------------------<br/>";
	//echo $reply["result"];
			foreach ($reply as $r ) {
			echo "----------------------------------------<br/>";
				echo "villaid=".$r['villaid'] . " <br/>";
				echo "name=".$r['name'] . " <br/>";
				echo "country=".$r['country'] . " <br/>";
				echo "region=".$r['region'] . " <br/>";
				echo "area=".$r['area'] . " <br/>";
				echo "street_address=".$r['street_address'] . " <br/>";
				echo "property_type=".$r['property_type'] . " <br/>";
				echo "built=".$r['built'] . " <br/>";
				echo "renovated=".$r['renovated'] . " <br/>";
				echo "size_SQM=".$r['size_SQM'] . " <br/>";
				echo "max_persons=".$r['max_persons'] . " <br/>";
				echo "floors_no=".$r['floors_no'] . " <br/>";
				echo "grounds_SQM=".$r['grounds_SQM'] . " <br/>";
				echo "view=".$r['view'] . " <br/>";
				echo "change_of_sheets=".$r['change_of_sheets'] . " <br/>";
				echo "checkin_time=".$r['checkin_time'] . " <br/>";
				echo "checkout_time=".$r['checkout_time'] . " <br/>";
				$amenitiesList = $r['amenitiesList'];
				echo "--- AMENITIES --- <br/>";
				foreach ($amenitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- AMENITIES END --- <br/>";
				$internetList = $r['internetList'];
				echo "--- INTERNET --- <br/>";
				foreach ($internetList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- INTERNET END --- <br/>";
				$kitchen_amenitiesList = $r['kitchen_amenitiesList'];
				echo "--- KITCHEN AMENITIES --- <br/>";
				foreach ($kitchen_amenitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- KITCHEN AMENITIES END --- <br/>";
				$leisure_activitiesList = $r['leisure_activitiesList'];
				echo "--- LEISURE ACTIVITIES --- <br/>";
				foreach ($leisure_activitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- LEISURE ACTIVITIES END --- <br/>";
				$local_area_activitiesList = $r['local_area_activitiesList'];
				echo "--- LOCAL AREA ACTIVITIES --- <br/>";
				foreach ($local_area_activitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- LOCAL AREA ACTIVITIES END --- <br/>";
				$location_typeList = $r['location_typeList'];
				echo "--- LOCATION TYPE --- <br/>";
				foreach ($location_typeList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- LOCATION TYPE END --- <br/>";
				$nearby_attraction_facilitiesList = $r['nearby_attraction_facilitiesList'];
				echo "--- NEARBY ATTRACTION FACILITIES --- <br/>";
				foreach ($nearby_attraction_facilitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- NEARBY ATTRACTION FACILITIES END --- <br/>";
				$outside_amenitiesList = $r['outside_amenitiesList'];
				echo "--- OUTSIDE AMENITIES --- <br/>";
				foreach ($outside_amenitiesList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- OUTSIDE AMENITIES END --- <br/>";
				$roomsacList = $r['roomsacList'];
				echo "--- ROOMS AC --- <br/>";
				foreach ($roomsacList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- ROOMS AC END --- <br/>";
				$stuffList = $r['stuffList'];
				echo "--- STUFF --- <br/>";
				foreach ($stuffList as $am ) {
					echo $am['name'] . " <br/>";
				}
				echo "--- STUFF END --- <br/>";
				$suitabilityList = $r['suitabilityList'];
				echo "--- SUITABILITY --- <br/>";
				foreach ($suitabilityList as $am ) {
					echo $am['name'].", ".$am['quantity'] . "<br/>";
				}
				echo "--- SUITABILITY END --- <br/>";
				$bathroom_facilitiesList = $r['bathroom_facilitiesList'];
				echo "--- BATHROOM FACILITIES --- <br/>";
				foreach ($bathroom_facilitiesList as $am ) {
					echo $am['name'] . ", " . $am['room'] . ", " . $am['quantity'] . " <br/>";
				}
				echo "--- BATHROOM FACILITIES END --- <br/>";
				$bedList = $r['bedList'];
				echo "--- BED --- <br/>";
				foreach ($bedList as $am ) {
					echo $am['name'] . ", " . $am['room'] . ", " . $am['quantity'] . " <br/>";
				}
				echo "--- BED END --- <br/>";
				$distancesList = $r['distancesList'];
				echo "--- DISTANCES --- <br/>";
				foreach ($distancesList as $am ) {
					echo $am['kind'] . ", " . $am['name'] . ", " . $am['km'] . " <br/>";
				}
				echo "--- DISTANCES END --- <br/>";
				$poolList = $r['poolList'];
				echo "--- POOL --- <br/>";
				foreach ($poolList as $am ) {
					echo $am['name'] . ", " . $am['quantity'] . ", " . $am['heated'] . ", " . $am['size'] . " <br/>";
				}
				echo "--- POOL END --- <br/>";
				$roomsList = $r['roomsList'];
				echo "--- ROOMS --- <br/>";
				foreach ($roomsList as $am ) {
					echo $am['name'] . ", " . $am['quantity'] . " <br/>";
				}
				echo "--- ROOMS END --- <br/>";
				$imageList = $r['imageList'];
				echo "--- IMAGES --- <br/>";
				foreach ($imageList as $am ) {
					echo $am['path'] . ", " . $am['priority'] . " <br/>";
				}
				echo "--- IMAGES END --- <br/>";
				echo "terms='".$r['terms'] . "' <br/>";
				echo "description='".$r['description'] . "' <br/>";
				echo "instructions='".$r['instructions'] . "' <br/>";
				echo "google coordinates=(".$r['googleCoordinates']['latitude'].", ".$r['googleCoordinates']['longitude'].") - are accurate=".$r['googleCoordinates']['is_accurate'] . " <br/>";
			echo "----------------------------------------<br/>";
			}
			
		}
	}*/
	
	/*get price and availability of a villa*/
/*	$param = array(	'id'=>"1", 
			'propertycode'=> "3",  
			'checkindate'=> "14/07/2011",
			'checkintime'=> "09:30",
			'checkouttime'=>"12:00",
			'numberofnights'=>"2",
			'persons'=>"3");

	$reply = $client->call('getPriceAvailability',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "is_available=".$reply['is_available'] . " <br/>";
				echo "price=".$reply['price'] . " ".$reply['currency'] . " <br/>";
				if( $reply['offer'] !== "" ) echo " (Offer: ".$reply['offer'].")<br />";
		}
	}
*/
	
	/*get year availability of a villa*/
/*	$param = array(	'id'=>"oknJCyYB0001", 
			'propertycode'=> "3", 
			'year'=>"2011");

	$reply = $client->call('getYearAvailability',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>";
				echo "availabilitystring=".$reply['availabilitystring'] . " <br/>";
				echo "msg=".$reply['msg'] . " <br/>";
		}
	}
*/

	/*get the global hash*/
/*	$param = array(	'id'=>"1");

	$reply = $client->call('getGlobalHash',array('parameters' => $param));

	if ($client->fault){
		print_r($reply);
	} else {
		$err=$client->getError();
		if ($err!="")
			echo $err;
		else {
			echo "The Response is: <br/>";
			echo "<BR>".$reply['hash']."<br />";
		}
	}*/
?>
