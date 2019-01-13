<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<title>Pinball Website Template | single-page :: w3layouts</title>
		<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!---start-click-drop-down-menu----->
		<script src="/resources/js/jquery.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
			var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
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
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="logo">
					<a href="../main.do"><img src="/resources/images/youtube.png" title="pinbal" /></a>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!---//End-header---->
		<!---start-content---->
		<div class="content">
			<div class="wrap">
			<div class="single-page">
							<div class="single-page-artical">
								<div class="artical-content">
<!-- 									<img src="/resources/images/1.jpg" title="banner1"> -->
									<div id="player"  ><input type = "hidden" id ="videoId" value = "${vo.videoId }" ></div>

    <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');
      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	  var videoId = $("#videoId").attr("value")
      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '700',
          width: '400',
          videoId: ''+videoId,
          events: {
            'onReady': onPlayerReady,
//             'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }     
    </script>
									<h3><a href = #>${vo.title }</a></h3>
								    </div>
								    <div class="artical-links">
		  						 	<ul>
		  						 		<li><img src="/resources/images/blog-icon2.png" title="Admin"><span>조회수 </span><span>${vo.viewCount }</span></li>
		  						 		<li><img src="/resources/images/chnnel.png" title="Comments" width="25" height="15"><span>채널 </span><span> ${vo.channelTitle } </span></li>
<!-- 		  						 		<li><a href="#"><img src="/resources/images/blog-icon4.png" title="Lables"><span>View posts</span></a></li> -->
		  						 	</ul>
		  						 </div>
<!-- 		  						 <div class="share-artical"> -->
<!-- 		  						 	<ul> -->
<!-- 		  						 		<li><a href="#"><img src="/resources/images/facebooks.png" title="facebook">Facebook</a></li> -->
<!-- 		  						 		<li><a href="#"><img src="/resources/images/twiter.png" title="Twitter">Twiiter</a></li> -->
<!-- 		  						 		<li><a href="#"><img src="/resources/images/google+.png" title="google+">Google+</a></li> -->
<!-- 		  						 		<li><a href="#"><img src="/resources/images/rss.png" title="rss">Rss</a></li> -->
<!-- 		  						 	</ul> -->
<!-- 		  						 </div> -->
		  						 <div class="clear"> </div>
							</div>
						</div>
						 </div>
		</div>
		<!----start-footer--->
		<!----//End-footer--->
		<!---//End-wrap---->
	</body>
</html>

