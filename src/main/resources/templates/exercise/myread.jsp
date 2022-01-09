<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">상세페이지</h1>
	
	    <form method="post" action="/exercise/remove?emNo=${emNo}">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th  scope="col">번호</th>
                        <th  scope="col">운동 이름</th>
                        <th  scope="col">운동 강도</th>
                        <th  scope="col">소모 칼로리(5분)</th>
                    </tr>
                    </thead>
                    <tbody>

						<tr>
							<th scope="row"><c:out value="${dto.ENo}"/></th>
							<td><c:out value="${dto.EName}" /></td>
							<td><c:out value="${dto.EStr}"/></td>
							<td><c:out value="${dto.EKcal}" /></td>
						</tr>
				</tbody>
                </table>
                <a href="/exercise/mylist?pageNum=${pageRequestDTO.pageNum }" class="btn btn-secondary">
            	<span class="text">목록</span>
       	  		</a>
                <a class="btn btn-danger removeBtn">
	        	<span class="text">삭제</span>
	        	</a>
                </form> 
            </div>
  </div>       
   
<script>
 $(document).ready(function(){
	 
	var form = $("form");
	$(".removeBtn").on("click",function(e){
		e.preventDefault();
	if(confirm("삭제하시겠습니까? ")){
		form.submit();
		}
		});
});
 
 
</script>
            

<%@ include file="../include/footer.jsp"%>
