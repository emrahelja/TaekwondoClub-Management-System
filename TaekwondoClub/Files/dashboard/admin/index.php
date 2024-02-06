<?php
require '../../include/db_conn.php';
page_protect();
?>
<!DOCTYPE html>
<html lang="en">
<head> 

    
    <title>TAEKWONDO CLUB </title>

    <link rel="stylesheet" href="../../css/style.css"  id="style-resource-5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/dashMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/entypo.css">
     <style>
    	.page-container .sidebar-menu #main-menu li#dash > a {
    	background-color: #2b303a;
    	color: #ffffff;
		}

    </style>

</head>
<body class="page-body  page-fade" onload="collapseSidebar()">

<div class="page-container sidebar-collapsed" id="navbarcollapse">	

<div class="sidebar-menu">

	<header class="logo-env">
	
	<!-- logo -->
	<div class="logo">
		<a href="main.php">
			<img src="tkd.png" alt="" width="192" height="80" />
		</a>
	</div>
	
			
					
	

	</header>
	<?php include('nav.php'); ?>
</div>

	<div class="main-content">

		<div class="row">
			
			<!-- Profile Info and Notifications -->
			<div class="col-md-6 col-sm-8 clearfix">	
					
			</div>
			
			
			<!-- Raw Links -->
			<div class="col-md-6 col-sm-4 clearfix hidden-xs">
				
				<ul class="list-inline links-list pull-right">

					<li>Welcome <?php echo $_SESSION['full_name']; ?> 
					</li>
				
					<li>
						<a href="logout.php">
							Log Out <i class="entypo-logout right"></i>
						</a>
					</li>
				</ul>
				
			</div>
			
		</div>


	<h1>REGISTRACIJA CLANOVA</h1>

<hr />

<div class="a1-container a1-small a1-padding-32" style="margin-top:2px; margin-bottom:2px;">
<div class="a1-card-8 a1-light-gray" style="width:500px; margin:0 auto;">
<div class="a1-container a1-dark-gray a1-center">
	<h3>NOVI CLAN</h3>
</div>
<form id="form1" name="form1" method="post" class="a1-container" action="index.php">
 <table width="100%" border="0" align="center">
 <tr>
   <td height="35"><table width="100%" border="0" align="center">
		<tr>
		  <td height="35">CLAN ID:</td>
		  <td height="35"><input type="text" id="boxx" name="m_id" value="<?php echo time(); ?>" readonly required/></td>
		</tr>
	   
	   <tr>
	   <td height="35">IME:</td>
	   <td height="35"><input name="u_name" id="boxx"  required/></td>
	 </tr>
	 <tr>
	   <td height="35">ADRESA:</td>
	   <td height="35"><input  name="street_name" id="boxx"   required/></td>
	 </tr>
	   <td height="35">KATEGORIJA:</td>
	   <td height="35"><input type="number" name="zipcode" id="boxx" maxlength="6" ></td>
	 </tr>
	<tr>
	   <td height="35">SPOL:</td>
	   <td height="35"><select name="gender" id="boxx" required>

			<option value="">--Please Select--</option>
			<option value="Male">MUSKO</option>
			<option value="Female">ZENSKO</option>
		</select></td>
	 </tr>
	<tr>
	   <td height="35">DATUM RODJENJA:</td>
	   <td height="35"><input type="date" name="dob" id="boxx"  size="30"></td>
	 </tr>
	 <tr>
	   <td height="35">BROJ TELEFONA:</td>
	   <td height="35"><input type="number" name="mobile" id="boxx" maxlength="10" required/ size="30"></td>
	 </tr>
	  <tr>
	   <td height="35">EMAIL:</td>
	   <td height="35"><input type="email" name="email" id="boxx" required/ size="30"></td>
	 </tr>
	 <tr>
	   <td height="35">DATUM UPISA:</td>
	   <td height="35"><input type="date" name="jdate" id="boxx" required size="30"></td>
	 </tr>
	 <tr>
	   <td height="35">GRUPA:</td>
	   <td height="35"><select name="plan" id="boxx" required onchange="myplandetail(this.value)">
			<option value="">--Please Select--</option>
			<?php
				$query="select * from plan where active='yes'";
				$result=mysqli_query($con,$query);
				if(mysqli_affected_rows($con)!=0){
					while($row=mysqli_fetch_row($result)){
						echo "<option value=".$row[0].">".$row[1]."</option>";
					}
				}

			?>
			
		</select></td>
	 </tr>
	
<tbody id="plandetls">
	 
	</tbody>

	 <tr>
	 <tr>
	   <td height="35">&nbsp;</td>
	   <td height="35"><input class="a1-btn a1-blue" type="submit" name="submit" id="submit" value="Register" >
		 <input class="a1-btn a1-blue" type="reset" name="reset" id="reset" value="Reset"></td>
	 </tr>
   </table></td>
 </tr>
 </table>
</form>
</div>
</div>   

<script>
	function myplandetail(str){

		if(str==""){
			document.getElementById("plandetls").innerHTML = "";
			return;
		}else{
			if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
				}
				xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("plandetls").innerHTML=this.responseText;
		
				}
			};
			
				xmlhttp.open("GET","plandetail.php?q="+str,true);
				xmlhttp.send();	
		}
		
	}
</script>


	
</div>

</body>
</html>

