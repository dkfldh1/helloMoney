// 카테고리 클릭 함수
function categoryClick(categoryName) {
	$.ajax({
		url : 'categoryDetail.do',
		data : {
			keyword : '',
			categoryName : categoryName
		},
		success : function(data) {
			$("#listView").html()
			$("#listView").html(data)  
		
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	})
}

//비디오 삭제 함수
function deleteVideo(categoryName,id) {
	$.ajax({
		url : 'deleteVideo.do',
		type : 'POST',
		data : {
			id : id
		},
		success : function() {
			categoryClick(categoryName)
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	})
}

//동영상 추가 함수
function addVideo(categoryName){
	if (categoryName == null || categoryName == "") {
		alert("카테고리를 먼저 선택해주세요");
		return;
	}
	
	$.ajax({
		url : 'addVideo.do',
		type : 'POST',
		data : {
			categoryName : categoryName
		},
		success : function(data) {
			$("#listView").html()
			categoryClick(categoryName);
			alert("30개 동영상이 추가되었습니다")
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
}

//카테고리 추가하는 함수
function addCategory(categoryName){
	if (categoryName.length < 2) {
		alert("이름을 두글자 이상 입력해주세요");
		return;
	}	
	
	$.ajax({
		url : 'addCategory.do',
		type : 'POST',
		data : {
			categoryName : categoryName
		},
		success : function(data) {
			location.href = "/admin.do"
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
	
}
//카테고리 지우는 함수
function deleteCategory(id){
	if (id == null || id == "") {
		alert("카테고리를 먼저 선택해주세요");
		return;
	}
	
	$.ajax({
		url : 'deleteCategory.do',
		type : 'POST',
		data : {
			id : id
		},
		success : function(data) {
			alert("카테고리가 삭제되었습니다");
			location.href = "/admin.do";
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
	
}

//메인페이지에 보여줄 유무를 체크해주는 함수
function videoView(categoryName, id, flag){
	$.ajax({
		url : 'videoView.do',
		type : 'POST',
		data : {
			id : id,
			flag : flag
		},
		success : function(data) {
			categoryClick(categoryName)
		},
		error : function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
}
//동영상 목록 출력 함수
function add(index, category, keyword) {
	$.ajax({
		url : 'add.do',
		dataType : 'text',
		data : {
			index : index,
			categoryName : category,
			keyword : keyword
			},
		success : function(data) {
//			if(index<$('tr').length)
				$('#listView').append(data)
		}
	})
}

//검색 함수



$(function(){
	
//파라미터 초기화
var parameters =
{		
		id : '',
		categoryName : '',
		videoId : '',
		index : 30,
		keyword : ''
}

	// 왼쪽의 카테고리 클릭시
	$(".category").click(function() {
		parameters.categoryName = $(this).text().trim()
		parameters.id = $(this).attr("id").trim()
		parameters.keyword = ''
		
		categoryClick(parameters.categoryName);
		parameters.index = 30;  
		
		$(".box-title").html("<b>- " +parameters.categoryName +" - 동영상 목록</b>")
	})

	// 동영상 추가버튼 클릭시
	$("#addVideoButton").click(function() {
		categoryName = parameters.categoryName
		addVideo(categoryName)
	})
	
	// 카테고리 추가버튼 클릭시
	$("#add-button").click(function() {
		categoryName = $("#query").val()
		addCategory(categoryName)
	})
	
	//카테고리 삭제버튼 클릭시
	$("#deleteCategoryButton").click(function(){
		id = parameters.id
		deleteCategory(id)
	})
	
	//삭제버튼 클릭시
	$(document).on('click','.deleteVideo', function() {
		var deleteInfo = $(this).attr("id").split(",")
		
		categoryName = deleteInfo[0]
		id = deleteInfo[1]
		
		deleteVideo(categoryName,id);
	})
		
	//체크박스 체크시
	$(document).on('change','.viewFlagCheck', function() {
		var id = parameters.videoId = $(this).attr("id");
		var flag = "N"
	    if($(this).is(":checked")) {
	    		  if( $(":checkbox:checked").length>12 ){
	    			  	alert("메인페이지에 보여줄 동영상은 12개까지 선택 가능합니다")
	    			  	$("input:checkbox[id='"+id+"']").attr("checked", false);

	    			    return;
	    		  }
		  flag = "Y"
	    }
	    videoView(parameters.categoryName, id,flag)
	})
	
	//스크롤 내렸을때
	$('#listView').scroll(function() {
		var sl = $('#listView').scrollTop() + $('#listView').height();
		var sh = $('#listView').prop('scrollHeight')
		keyword = parameters.keyword
		
		if (sh-sl == 20) { 
			console.log(parameters.index)
			console.log($('tr').length)
			add(parameters.index, parameters.categoryName, keyword)
			parameters.index += 30;
				  

		}
	})
	
	//검색버튼
	$(document).on('click','#searchButton', function() {
		var keyword = $("#searchKeyword").val()
		if(keyword.length<2){ alert("검색어를 두글자 이상 입력해 주세요"); return;}
		
		parameters.keyword = keyword
		search(keyword);
		
	})
	    
	//카테고리 추가 핫키(Enter)
	$("#query").keydown(function(key) {
		categoryName = $("#query").val()
		if (key.keyCode == 13) addCategory(categoryName)
	});
	
	// 검색 핫키(Enter)
	$("#searchKeywrod").keydown(function(key) {
		var keyword = $("#searchKeywrod").val()
		if (key.keyCode == 13){
			if (keyword.length<2){ alert("검색어를 두글자 이상 입력해 주세요"); return;}
		search(parameters.categoryName,keyword)
			}
	});
	
	//동영상추가(수동) 버튼 클릭
	$(document).on('click','#manualAddVideoButton', function() {
		var categoryName = parameters.categoryName
		if (categoryName == null || categoryName == "") {alert("카테고리를 먼저 선택해주세요"); return;}
		location.href = "insert.do/?categoryName="+categoryName
	})    
	
	//수정 버튼 클릭시
	$(document).on('click','.modifyVideo', function() {
		var modifyInfo = $(this).attr("id").split(",")
		
		id = modifyInfo[1]
		location.href = "modify.do?id="+id 
	})
	
	
	
	
	
	
	
	
});







