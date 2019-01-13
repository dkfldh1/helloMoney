<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<style>
.category{
	font: 400 20px/20px 'Open Sans', sans-serif;
	color:#7F7F7F;
	margin:auto;
	padding:0px;
	text-align:left;
	height: 50;
 } 
 .detail{
 	font:400 25px/25px 'Open Sans', sans-serif;
	display: block;
	color: #363636;
	font-weight: 900;
	text-transform: uppercase;
	text-align: left;
	margin:auto;
	padding:0px;
}    
/*  #categoryTitle{  */
/*      font: 400 28px/28px 'Open Sans', sans-serif;  */
/*      color: #626262;  */
/*      text-align: left;  */
/*      font-weight: 400;  */
/*      padding: 0.3em 0 0;  */
/*      display: block;  */
/*     margin-bottom: 2%;  */
    
/*  }  */

</style>
	<head>
		<title>Kingcar</title>
		<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!-- Global CSS for the page and tiles -->
  		<link rel="stylesheet" href="/resources/css/main.css">
  		<!-- //Global CSS for the page and tiles -->
		<!---start-click-drop-down-menu----->
		<script src="/resources/js/jquery.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
var $ = jQuery.noConflict();
//파라미터 초기화
var parameters =
{		
		id : '',
		category : '',
		videoId : '',
		index : 0,
		keyword : ''
}

//검색

				$(function() {
					
					$.ajax({
						url : 'addList.do',
						dataType : 'text',
						success : function(data) {
								$('#listView').append(data)
						}
					})
					
					
					$('#activator').click(function(){
						$('#box').animate({'top':'50px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
									
			});
		</script>
        <!----//End-dropdown--->
		<!---//End-click-drop-down-menu----->
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="logo">
					<a href="main.do"><img src="/resources/images/youtube.png" title="pinbal" /></a>
				</div>
				<div class="nav-icon">
					 <a href="#" class="right_bt" id="activator"><span> </span> </a>
				</div>
				 <div class="box" id="box">
					 <div class="box_content">        					                         
						<div class="box_content_center">
						 	<div class="form_content">
								<div class="menu_box_list">
									<ul>
										<li><a href="#"><span>home</span></a></li>
										<li><a href="#"><span>About</span></a></li>
										<li><a href="#"><span>Works</span></a></li>
										<li><a href="#"><span>Clients</span></a></li>
										<li><a href="#"><span>Blog</span></a></li>
										<li><a href="/contact.do"><span>Contact</span></a></li>
										<div class="clear"> </div>
									</ul>
								</div>
								<a class="boxclose" id="boxclose"> <span> </span></a>
							</div>                                  
						</div> 	
					</div> 
				</div>       	  
				<div class="top-searchbar">
						<input type="text"  id = "searchKeyword"/><input type="submit"  id = "searchButton"value="" />
				</div>
				<div class="userinfo">
					<div class="user">
						<ul>
							<li><a href="/admin.do"><span>관리자페이지</span></a></li>
						</ul>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!---//End-header---->    
		<!---start-content---->
	<div class="content" style = "height: 70%; margin-top: 15em" > 
		<div class="wrap" id = "addContent" >
			 <div class ="main" role="main"  id = "add">
			     
	    	<ul id = "tiles" class="tiles" style="padding-bottom: 8em; z-index: 6; ">
			<c:forEach items="${list }" var="list" varStatus="status">
				<li style = "top:50px; position: relative;" class = "myContent"  >
					<c:if test="${(status.index == 0 )&& keyword ne '' }">
						<h4 onclick="return false;" id = "categoryTitle" style = "top : -60px; position: relative ; font: 400 28px/28px 'Open Sans', sans-serif; line-height: 0;">${keyword} 검색결과</h4>
					</c:if>      
					<c:if test="${(status.index == 0 ) && keyword eq '' }">
						<h4 onclick="return false;" id = "categoryTitle" style = "top : -60px; position: relative ; font: 400 28px/28px 'Open Sans', sans-serif; line-height: 0;">${list.category }</h4>
					</c:if>      
					<c:set value="${list.category }" var="category"></c:set>
					<a href="#"  ><img width="235" height="130" src="${list.thumbnail }"id = "${list.id }" class = "myThumbnail" ></a>
						<div class="post-infod">
								<div class="post-basic-info">
									<h3>
										<a href="#" style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden" id = "${list.id }" class = "myThumbnail" >${list.title}</a>
									</h3>  
									<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>조회수</b> ${list.viewCount}</p>
									<p style = "height:27px; text-overflow: ellipsis; white-space: nowrap;overflow: hidden"><b>채널</b> ${list.channelTitle}</p>
								</div>
						</div>
				</li>   
			</c:forEach>
		</ul>  
			    
		   	 </div>
		</div>
	</div>	
		<!---//End-content---->
		<!----wookmark-scripts---->
		  <script src="/resources/js/jquery.imagesloaded.js"></script>
		  <script src="/resources/js/jquery.wookmark.js"></script>
		  <script type="text/javascript">
		    (function ($){
		    	
		      var $tiles = $('.tiles'),
		          $handler = $('li', $tiles),
		          $main = $('.main'),
		          $window = $(window),
		          $document = $(document),
		          options = {
		            autoResize: true, // This will auto-update the layout when the browser window is resized.
		            container: $main, // Optional, used for some extra CSS styling
		            offset: 0, // Optional, the distance between grid items
		            itemWidth:235 // Optional, the width of a grid item   
		          };
		      /**
		       * Reinitializes the wookmark handler after all images have loaded
		       */
		      function applyLayout() {
		        $tiles.imagesLoaded(function() {
		          // Destroy the old handler
		          if ($handler.wookmarkInstance) {
		            $handler.wookmarkInstance.clear();
		          }
		
		          // Create a new layout handler.
		          $handler = $('li', $tiles);
		          $handler.wookmark(options);
		        });   
		      }
		      
	      $(document).on('click','#searchButton', function() {
	  		var keyword = $("#searchKeyword").val()
	  		var category = ""

	  			if(keyword.length<2){ alert("검색어를 두글자 이상 입력해 주세요"); return;}
	  		location.href = "search.do?category="+"&index=0&keyword="+keyword
	  })   	         
	  
	  $(window).scroll(function(){
		  onScroll();  
	  })
	  
	  /**
		       * When scrolled all the way to the bottom, add more tiles
		       */
		      function onScroll() {
		        // Check if we're within 100 pixels of the bottom edge of the broser window.
		        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
		            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 300);
				console.log(" $document.height = " + $document.height())
				console.log("$window.scrollTop() + winHeight = " + $window.scrollTop() + winHeight)
		        if (closeToBottom) {  
		        	var category = "${category}"    
		          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
// 		          var $items = $('li', $tiles),
// 		              $firstTen = $items.slice(0, 10);
// 		          $tiles.append($firstTen.clone());///////////
					parameters.index+=30  
					$.ajax({
						url : 'search.do',
						dataType : 'text',
						data : {
							index : parameters.index,
							category : category,
							keyword : ''
							},
						success : function(data) {
				//			if(index<$('tr').length)
								$('#tiles').append(data) 
								console.log(data)
								 applyLayout(); 
						}
					})

		
		          applyLayout();
		        }
		      };
		   
		      // Call the layout function for the first time
		      applyLayout();
		      // Capture scroll event.
// 		      $window.bind('scroll.wookmark', onScroll);
		    })(jQuery);
		    
			  var id =0 ;
			  

		  </script>
		  
 <script>   

$( document ).ready(function(){
// 	var categoryList = '${category}';
// 	categoryList = categoryList.replace("[","")
// 	categoryList = categoryList.replace("]","")
// 	categoryList = categoryList.split(", ")
// 	alert(categoryList[0])
	
// 	var repeat = categoryList.size
// 		value = categoryList[0]    
	$(".myThumbnail").click(function(){
		var id = $(this).attr("id")
	location.href = "/detailPage.do?id="+ id   
	})   
        
	//검색
// 	$(document).on('click','#searchButton', function() {
// 	var keyword = $("#searchKeyword").val()
// 	var category = ""
// 	if(keyword.length<2){ alert("검색어를 두글자 이상 입력해 주세요"); return;}
// 	search(keyword,category, parameters.index);
    
// 	})   		
})
</script>
		
	</body>
</html>

