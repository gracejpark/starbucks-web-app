<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
            <a href="javascript:pagingFormSubmit(${navi.startPageGroup-navi.pagePerGroup })">◁◁</a>
            <a href="javascript:pagingFormSubmit(${navi.currentPage-1 })">◀</a>
            <c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
                <c:choose>
                    <c:when test="${counter == navi.currentPage }">
                        <a href="javascript:pagingFormSubmit(${counter })"><b>${counter }</b></a>                
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:pagingFormSubmit(${counter })">${counter }</a>    
                    </c:otherwise>
                </c:choose>
                
            </c:forEach>        
            <a href="javascript:pagingFormSubmit(${navi.currentPage+1 })">▶</a>
            <a href="javascript:pagingFormSubmit(${navi.startPageGroup+navi.pagePerGroup })">▷▷</a>
        </div>    
    <br>
    
    <form action="boardList" method="get" id="pagingForm">
        <input type="hidden" name="page" id="page"> 
            <select name="search"  >
            <option value="id">아이디</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
            </select>
            
            <input type="text" name="searchText" value="${searchText }">
        <input type="button" value="검색" onclick="pagingFormSubmit(1)">
    </form>
 
        
        function pagingFormSubmit(currentPage)
        {
            var form = document.getElementById("pagingForm");
            var page = document.getElementById("page");
        
            
            page.value = currentPage;
            
            form.submit();
        }

</body>
</html>