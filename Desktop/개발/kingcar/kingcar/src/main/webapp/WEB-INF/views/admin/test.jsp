<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function handleAPILoaded() {
	  $('#search-button').attr('disabled', false);
	}

	// Search for a specified string.
	function search() {
	  var q = $('#query').val();
	  var request = gapi.client.youtube.search.list({
	    q: q,
	    part: 'snippet'
	  });

	  request.execute(function(response) {
	    var str = JSON.stringify(response.result);
	    $('#search-container').html('<pre>' + str + '</pre>');
	  });
	}
	
$(document).ready(function(){
	$("#search-button1").click(function(){
		search()
	})
})
	

</script>

<title>Insert title here</title>
</head>
  <body>
    <div id="buttons">
      <label> <input id="query" value='cats' type="text"/><button id="search-button"  disabled onclick="search()">Search</button></label>
      <input type = "button" id="search-button1"  value = "검색"/>
    </div>
    <div id="search-container">
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="/resources/js/auth.js"></script>
    <script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
  </body>
</html>