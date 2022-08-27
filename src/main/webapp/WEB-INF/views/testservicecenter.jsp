<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function createChatingRoom(res){
	if(res != null){
		var tag = "";
		res.forEach(function(d, idx){
			var rn = d.rname.trim();
			
			var roomNumber = d.rno,
			    roomImg = d.imageUrl,
			    category = d.category,
			    rowner = d.rowner;
				
			tag += "<div class='test'><img class='img' src=" + roomImg + "/><br><p class='rCategory'>[" + category + "]</p><a class='rName' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>" + rn +"</a><a class='rRowner'>" + rowner + "</a></div>";
		});
		$("#roomList").empty().append(tag);
	}
}
</script>
<body>

</body>
</html>