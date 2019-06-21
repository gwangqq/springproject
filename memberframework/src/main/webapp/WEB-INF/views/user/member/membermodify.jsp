<%@page import="com.kitri.member.model.MemberDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kitri.member.model.MemberDetailDto"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%
	MemberDetailDto memberDetailDto = (MemberDetailDto) request.getAttribute("userInfo");
%>
${request. }
<script type="text/javascript" src="${root}/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
		 
		$('#zipcode').focusin(function() {
			$('#zipModal').modal();
		});
	var name = '<%=memberDetailDto.getName()%>';
	var id = '<%=memberDetailDto.getId()%>';
	var emailid = '<%=memberDetailDto.getEmailId()%>';
	var emaildomain = '<%=memberDetailDto.getEmailDomain()%>';
	var tel1 = '<%=memberDetailDto.getTel1()%>';
	var tel2 = '<%=memberDetailDto.getTel2()%>';
	var tel3 = '<%=memberDetailDto.getTel3()%>';
	var zipcode = '<%=memberDetailDto.getZipcode()%>';
	alert(zipcode);
	var address = '<%=memberDetailDto.getAddress()%>';
	var address_detail = '<%=memberDetailDto.getAddressDetail()%>';
	$("#name").val(name);
	$("#id").val(id);
	$("#emailid").val(emailid);
	$("#emaildomain").val(emaildomain);
	$("#tel1").val(tel1);
	$("#tel2").val(tel2);
	$("#tel3").val(tel3);
	$("#zipcode").val(zipcode);
	$("#address").val(address);
	$("#address_detail").val(address_detail);
	document.getElementById("registerBtn").addEventListener("click", function(e) {
	modify();
	});
});

function modify() {
	if(document.getElementById("pass").value.length == 0) {
		submit();
	} else {
		if (document.getElementById("pass").value != document.getElementById("passcheck").value) {
			alert("비밀번호 확인!!");
			return;
		} else {
			if(pass == $("#pass").val() && emailid == $("#emailid").val() &&
					emaildomain == $("emaildomain").val() && tel1 == $("#tel1").val() &&
					tel2 == $("#tel2").val() && tel3 == $("tel3").val() &&
					zipcode == $("zipcode").val() && address_detail == $("address_detail").val()) {
				alert("변경된 정보가 없습니다.");
				return;
			} else {
			submit();
			}
		}
	}
	
}
function submit() {
	document.getElementById("membermodifyform").action = "${root}/user"; // 값지정
	document.getElementById("membermodifyform").submit(); // 보내기
}
</script>
<body>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>정보수정</h2>
		<form id="membermodifyform" method="post" action="">
			<input type="hidden" name="act" value="register">
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name" value="${userInfo.name}" readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="id" name="id" onkeyup="javascript:idcheck();" readonly="readonly" value="${userInfo.id}">
				<div id="idresult"></div>
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="pass" name="pass" placeholder="" value = "${userInfo.pass}">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호재입력</label>
				<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="" value = "${userInfo.pass}">
			</div>
			<div class="form-group" align="left">
				<label for="email">이메일</label><br>
				<div id="email" class="custom-control-inline">
				<input type="text" class="form-control" id="emailid" name="emailid" placeholder="" size="25" value="${userInfo.address}"> @
				
				
				<select class="form-control" id="emaildomain" name="emaildomain">
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="hanmail.net">hanmail.net</option>
				</select>
				
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
				<select class="form-control" id="tel1" name="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="041">041</option>
					<option value="051">051</option>
					<option value="061">061</option>
				</select> _
				<input type="text" class="form-control" id="tel2" name="tel2" placeholder="1234"> _
				<input type="text" class="form-control" id="tel3" name="tel3" placeholder="5678">
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label><br>
				<div id="addressdiv" class="custom-control-inline">
					<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" size="7" maxlength="5" readonly="readonly">
					<!--<button type="button" class="btn btn-primary" onclick="javascript:">우편번호</button>-->
				</div>
				<input type="text" class="form-control" id="address" name="address" placeholder="" readonly="readonly">
				<input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn" onclick="javascript:modify();">확인</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/user/member/zipsearch.jsp" %>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>