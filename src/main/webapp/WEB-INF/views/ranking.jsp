<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	window.onload = function(){
		getRanking();
	}
	function getRanking(){
		commonAjax('/getRanking.do', "", 'post', function(result){
			getRankingList(result);
		});
	}
	
	function getRankingList(res){
		if(res != null){
			var tag = "";
			res.forEach(function(d, idx){
				var id = d.id,
					memNum = d.memNum;
 				
				tag += "<div> memNum = " + memNum + "</div>";
			});
			$("#rankingList").empty().append(tag);
		} else{
			window.close;
		}
	}
	
	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>

<span id="rankingList" class="rankingList"></span>

</body>
</html>