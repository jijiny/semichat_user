<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 검색조건 쿼리스트링 가져오기 -->
<c:forEach var="i" items="${paging.search }">
<c:if test="${i.key=='searchType' }">
   <c:set var="searchType" value="${i.value }"/>
</c:if>
<c:if test="${i.key=='keyword' }">
   <c:set var="keyword" value="${i.value }"/>
</c:if>
</c:forEach>
<c:set var="query" value="&searchType=${searchType}&keyword=${keyword }"/>
<!--  -->

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js" charset="utf-8"></script>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<jsp:include page="/WEB-INF/views/layout/header_board.jsp"/>

<script type="text/javascript">
	
$(document).ready(function(){

	//글쓰기 버튼 누르면 이동
	$("#btnNoticeWrite").click(function(){
		location.href="/notice/write";
	});
		

	
	})
</script>
<style type="text/css">
/* #board { */
/*    background-color: #4ea1d3; */
/*    border-color: #4ea1d3; */
/*    color: white; */
/* } */
#info {
	 background-color:  #4ea1d3; 
   color: white;
}

th, td{
   
   text-align: center;
}

tr td:not(:first-child), tr th:not(:first-child) {
   border-left: 0.4px solid lightgray;
}

tr td:nth-child(2) {
   text-align: left;
}

option {
   
}

td {
 border-bottom: 0.4px solid lightgray;
}

#board {
 	background-color: #4ea1d3;
   border-color: #4ea1d3;
   color: white;
}
</style>
<div class="container">

<form action="/notice/list" method="get">
<div style="margin: 1%; float: right;">

<select name="searchType">
   <option value="nBoardTitle">제목</option>
   <option value="counselorId">작성자</option>
</select>

<input type="text" id="search" name="search">
<button>검색</button>
</div>
</form>

<table class="table table-hover" style="text-align: center;">
<tr id="info">
	<th style="width: 10%">번호</th>
	<th style="width: 50%">제목</th>
	<th style="width: 15%">작성자</th>
	<th style="width: 10%">작성일</th>
	<th style="width: 15%">조회수</th>
</tr>

<c:forEach items="${list }" var="noticeboard">
<tr>
	<td>${noticeboard.nBoardNo }</td>
	<td><a href="/notice/show?noticeboardno=${noticeboard.boardNo }">${noticeboard.nBoardTitle }</a></td>
	<td>${noticeboard.counselorId }</td>
	<td>${noticeboard.nBoardDate }</td>
	<td>${noticeboard.nBoardViews }</td>	
</tr>
</c:forEach>
</table>

<div>


<c:if test="${counselorPosition eq 'manager'}">
<button id="btnNoticeWrite" class="btn btn-md b-btn" style="float: right; background-color: #4ea1d3; color: white;">작성</button>
</c:if>
<c:if test="${counselorPosition eq 'counselor'}">
</c:if>
</div>

</div> <!-- container end -->

<jsp:include page="/WEB-INF/views/layout/notice_paging.jsp" />




<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>