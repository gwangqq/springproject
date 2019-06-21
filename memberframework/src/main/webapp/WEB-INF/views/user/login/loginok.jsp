<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kitri.member.model.MemberDto, com.kitri.util.MoveUrl" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

	    <c:if test="${userInfo != null}">
	    <script type="text/javascript">
	    function deleteMember() {
	    	if(confirm("정말로 탈퇴??")) {
	    		$(location).attr("href", "${root}/user/delete.kitri");
	    	}
	    }
	    </script>
	    <span>${userInfo.name}님 안녕하세요!!</span>
	    <a href="${root}/user/logout.kitri">로그아웃</a>
	    <a href="${root}/user/modify.kitri">정보수정</a>
	    <a href="${root}/user?act=singout">회원탈퇴</a>
	    	<c:if test="${'java2' == userInfo.id }">	
	
	    <a href="${root}/admin/mvmemberlist.kitri">관리자</a>
	    	</c:if>
	    </c:if>
	    <c:if test="${userInfo == null}">
	    	<c:redirect url="/user/login.kitri"/>

	</c:if>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>