<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>교보문고</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel="stylesheet" href="css/style.css">

<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
	<div id="navigation"> </div>
				<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
			
  <div id="slideShow">
    <ul class="slides">
      <li><img src="image/slideimage1.jpg" id = mainImage Width = 300 height = 300 alt=""></li>
      <li><img src="image/slideimage2.jpg" Width = 300 height = 300 alt=""></li>
      <li><img src="image/slideimage3.jpg" Width = 300 height = 300 alt=""></li>
      <li><img src="image/slideimage4.jpg" Width = 300 height = 300 alt=""></li>
      <li><img src="image/slideimage5.jpg" Width = 300 height = 300 alt=""></li>
      <li><img src="image/slideimage6.jpg" Width = 300 height = 300 alt=""></li>
    </ul>
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
      <span class="prev">&lang;</span> 
      <span class="next">&rang;</span>
    </p>
  </div>
  <script src="js/slideShow.js"></script>
	<script>
  var myImage = document.getElementById("mainImage");
  var imageArray = ["image/slideimage1.jpg",
	  				"image/slideimage2.jpg",
	  				"image/slideimage3.jpg",
	  				"image/slideimage4.jpg",
	  				"image/slideimage5.jpg",
	  				"image/slideimage6.jpg"];
  var imageIndex = 0;
  
  function changeImage(){
	  myImage.setAttribute("src", imageArray[imageIndex]);
	  imageIndex++;
	  if(imageIndex>=imageArray.length){
		  imageIndex = 0;
	  }
  }
  setInterval(changeImage, 3000);
  </script>			
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>