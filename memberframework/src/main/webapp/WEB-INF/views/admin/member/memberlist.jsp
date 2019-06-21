<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	memberList();
	
	$("#searchBtn").click(function() {
		//var key = $("#key").val();
		//var word = $("#word").val();
		memberList();
		$("#word").val('');
	});
	
});

function memberList() {
	$("#mlist").empty();
	$.ajax({
		type : "GET",			//form의 type 비슷하다 //경로 "xml/03.xml" 파일을 만들자 
		url:"${root}/admin/memberlist.kitri",	
		dataType : "json",
		timeout : 30000,
		data : {"key" : $("#key").val(), "word" : $("#word").val()}, 
		cache:false,
		success:function(data){	// 성공
			var list = data.memberlist;
			var len = list.length;
			var view ="";
			for(var i=0; i<len; i++) {
				
				view += "<tr>\n";
				view += "<td>"+ list[i].id+"</td>"
				view += "<td>"+ list[i].name+"</td>"
				view += "<td>"+ list[i].emailId+"@" + list[i].emailDomain+"</td>"
				view += "<td>"+ list[i].tel1+"-"+ list[i].tel2+"-" +list[i].tel3 +"</td>"
				view += "<td>"+ list[i].address+"</td>"
				view += "<td>"+ list[i].joindate+"</td>"
				/* var id = $(member[i]).find("id").text();
				var name = $(member[i]).find("name").text();
				var email = $(member[i]).find("email").text();
				var tel = $(member[i]).find("tel").text();
				var address = $(member[i]).find("address").text();
				var joindate = $(member[i]).find("joindate").text();
				
				var tr = $("<tr>").attr("class", "table-active");
				var td1 = $("<td>").text(id);
				var td2 = $("<td>").text(name);
				var td3 = $("<td>").text(email);
				var td4 = $("<td>").text(tel);
				var td5 = $("<td>").text(address);
				var td6 = $("<td>").text(joindate);
	
				tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6); */
				$("#mlist").empty().append(view);
			}
		}
	});
}

</script>
<div class="table-responsive-lg">
  <h2>회원목록</h2>
  <table class="table">
  	<tr>
  		<td>
  			<form class="form-inline" action="">
			  <select class="form-control" id="key" name="key">
					<option value="id">아이디</option>
					<option value="tel3">전화번호뒷자리</option>
					<option value="address">주소</option>
				</select>
			  <input type="text" class="form-control" id="word" name="word">
			  <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
			</form>
  		</td>
  	</tr>
  </table>
  <table class="table">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>주소</th>
        <th>가입일</th>
      </tr>
    </thead>
    <tbody id="mlist"></tbody>
  </table>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
