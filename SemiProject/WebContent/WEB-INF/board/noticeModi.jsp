<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
   
<jsp:include page="../header4.jsp"/>

<style type="text/css">

		img#boardImg {
		width: 90%;		
		height: 280px;
	}
	table.table {
		width: 90%;
		border: solid 1px gray;
		border-collapse: collapse;
	}
	td.page_tab1 {
		border: solid 1px gray;
		padding: 15px;
		text-align: center;		
	}
	th.page_tab2 {
		border: solid 1px gray;		
		text-align: center;
		padding: 3px;
		font-weight: normal;
	}
	th.board_tab2 {
		width: 80px;
	}	
	a.boardA {
		color: black;
		text-decoration: none;
		font-size: 15pt;
		font-weight: bold;
		width: 100%;
		height: 100%;
	}	
	table.table-bordered td {
		font-size: 11pt;
		text-align: center;
	}
	td.Title:hover {
		cursor: pointer;
	}
	.page_click{
		background-color: black;
		color: white !important;
	}
	td.page_hover:hover {
		cursor: pointer;
	}
	
	
	
	div#noticeWrite{
		margin-top: 100px;
		margin-bottom: 100px;
	}
	input.noticeTitle{
		font-size: 10pt;
		color: gray;
		height: 40px;
		width: 1000px
	}
	input.noticeContent{
		font-size: 10pt;
		color: gray;
		height: 700px;
		width: 1000px; 		
	}
	span#noticeWriter{
		display: inline-block;
		width: 90%;
		font-size: 15pt;
		padding-left: 30px;
	}
</style>

<script type="text/javascript">
$(document).ready(function(){	
	
	if("${fn:trim(requestScope.searchWord)}" != ""){
		$("select#searchType").val("${requestScope.searchType}");
		$("input#searchWord").val("${requestScope.searchWord}");
	}
	
	$(".GoodsQA").removeClass("page_click");
	$(".Notice").addClass("page_click");
	
	$("td.GoodsQA").click(function(){
		location.href="<%=request.getContextPath()%>/board/boardQA.up";
	});
	$("td.Notice").click(function(){
		location.href="<%=request.getContextPath()%>/board/board.up" ;
	});

});

// Function Declaration
function goModify(){
	var frm = document.noticeModify;
	frm.action = "noticeModifySubmit.up?"; 
	// 자기자신한테 간다. 그냥 목록 갯수만 바꿔줄 뿐
	frm.method = "GET";	// 숨길필요 없이 빨리빨리 이동해야해서 get 사용
	frm.submit();
}
</script>


<div class="container" id="noticeWrite" align="center">
	<img id="boardImg" src="../image/board.png"/>
	<table class="table page_tab" style="margin: 25px 0;">
		<tbody>
			<tr>
				<td class="page_tab1 GoodsQA page_hover">
					<a class="GoodsQA boardA">상품 Q&A</a>
				</td>
				<td class="page_tab1 Notice page_hover">
					<a class="Notice boardA">공지사항</a>
				</td>
			</tr>
		</tbody>
	</table>

	<form name="noticeModify">
		<span id="noticeWriter">작성자:${requestScope.adminId}</span>
		<br><br>
		<table>
			<tbody>
				<tr>
					<td><input type="hidden" class="noticeNo Noticeinput" value="${requestScope.nvo.ctNo}" name="ctNo"/></td>
				</tr>
				<tr>
					<td><input class="noticeTitle Noticeinput" value="${requestScope.nvo.ctTitle}"  type="text" name="noticeTitle"/></td>
				</tr>
				<tr>
					<td><span>&nbsp;</span></td>
				</tr>
				<tr>
					<td><input class="noticeContent Noticeinput" value="${requestScope.nvo.ctContent}"  type="text" name="noticeContent" /></td>
				</tr>
				<tr>
					<td><span>&nbsp;</span></td>
				</tr>
				<!-- <tr>
					<td><input type="file" name="noticeImg" class="noticeImg" /></td>
				</tr> -->
			</tbody>
		</table>
		<br><br>
		<button onClick='goModify();' style="background-color: #196666; color: white; height: 50px; width: 150px; font-size: 25px; font-weight: bold;">작성완료</button>
	</form>

</div>





<jsp:include page="../footer.jsp"/>	