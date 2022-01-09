<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>

	
	<!-- Topbar Search -->
		<form action="/journal/list" method="GET" id="searchForm"
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }/>
			
			<div class="input-group">
				<input type="text" class="form-control bg-light border- small" name="keyword" value="${pageRequestDTO.keyword }"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary searchBtn" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>

	<hr>

	<c:forEach var="dto" items="${list}">
		<div class="card" style="margin: 0 auto; width: 50%;">
		<div class="d-flex justify-content-between align-items-center"><b>&nbsp;${dto.MName }</b><small><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.JDate}" /></small></div><hr class="my-1">
			<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
				<img src="/image/show?imagePath=${dto.imageDTO.imagePath }" height="450px">
			<hr>
			</c:if>
			<div class="card-body">
				<p class="card-text">${dto.JContent }</p>
			</div>
			<hr>
			
			<!-- 좋아요 -->

			
				<div class="heart">
					<input type="hidden" class="mEmail" value="${loginUser}"/>
	                <input type="hidden" class="heartJno" name="jNo" value="${dto.JNo}"/>
	                <input type="hidden" class="heartval" value="${dto.likeCount}"/>
	                <c:choose>
	                	<c:when test="${dto.likeCount>0}">
						<a class="btn heartbtn" data-jno="${dto.JNo}">
	           			<img class="heartimg" src="/resources/imgs/heart1.svg" width="30px"></a>${dto.LCnt}
	           			</c:when>
	           			<c:otherwise>
	           			<a class="btn heartbtn" data-jno="${dto.JNo}">
	           			<img class="heartimg" src="/resources/imgs/heart2.svg" width="30px"></a>${dto.LCnt}
	           			</c:otherwise>
	           		
	           		</c:choose>
	           		<hr>
				</div>
			
			<!-- 댓글 -->
				<div class="reply">
			     <div class="row height d-flex justify-content-center align-items-center">
			        <div class="col-md-12">
			            <div class="replycard">
			                <!-- <div class="p-3"> -->
			                    <b class="mx-3">댓글</b>
			                    <input type="hidden" name="mEmail" value="${dto.MEmail }"/>
			                    <input type="hidden" id="reJno" name="jNo" value="${dto.JNo }"/>
			        <!--         </div> -->
			                
			                
			                <div class="mt-3 d-flex flex-row align-items-center p-3 form-color"> <textarea type="text" id="reContent" class="form-control" placeholder="댓글을 입력해보세요..."></textarea>
			                &nbsp;<input type="button" class="btn btn-primary replybtn" value="등록"></input></div>
			                
	     				
			                <div class="mt-2">
							<c:forEach var="reply" items="${dto.replyList}">
			                    <div class="d-flex flex-row p-3"> 
			                        <div class="w-100 commentHome">
			                            <div class="d-flex justify-content-between align-items-center">
			                                <div class="d-flex flex-row align-items-center">
			                                 <b>${reply.MName}</b>
			                                </div> <small>${reply.reDate }</small>
			                            </div>
			                            <p data-comment-check="0">${reply.reContent}</p>
				                        <div class="input-group replyModify" data-reno="${reply.reNo }">
						  					<textarea rows="1" class="form-control">${reply.reContent}</textarea>
						  					<span><input type="button" class="btn btn-primary replyModifybtn" value="등록"></input></span>
										</div>
			                            <c:forEach var="comment" items="${reply.commentList}">
			                            	<div class="mt-1 commentContent" style="font-size: small;">&nbsp;└ ${comment.MName} : ${comment.reContent}
			                            		<div class="input-group commentModify" data-reno="${comment.reNo }">
								  					<textarea rows="1" class="form-control">${comment.reContent}</textarea>
								  					<span><input type="button" class="btn btn-primary commentModifybtn" value="등록"></input></span>
												</div>
			                            		<span>
			                            		<c:if test="${loginUser eq comment.MEmail}">
												&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;" class="commentmodify" data-commentcheck="1" data-reno="${comment.reNo }"><small>수정</small></a>
			                            		&nbsp;&nbsp;&nbsp;<span><a style="cursor: pointer;" class="commentdel" data-commentcheck="1" data-reno="${comment.reNo }"><small>삭제</small></a></span>
			                            		</c:if>	
			                            		</span>
												<div class="mt-1" style="display: inline-block; float: right; font-size: x-small;">
	
												${comment.reDate}
												</div>
											</div>
			                            </c:forEach>
			                            	<div>
			                            		<div class="input-group commentTxt" data-reno="${reply.reNo}">
				                            	<textarea rows="1" class="form-control"></textarea>&nbsp;
				                            	<span><input type="button" class="btn btn-primary commentinsertbtn" value="등록" data-reno="${reply.reNo}"></input></span>
				                            	</div>
			                            		<div class="d-flex flex-row user-feed"><a style="cursor: pointer;" class="commentinsert" data-comment-check="0" data-reno="${reply.reNo }"><small>답글작성</small></a>
			                            		<c:if test="${loginUser eq reply.MEmail}">
			                            		&nbsp;&nbsp;&nbsp;<span class="replymodify"><a style="cursor: pointer;" class="replymodifybtn" data-commentcheck="0" data-reno="${reply.reNo }"><small>수정</small></a></span>
			                            		&nbsp;&nbsp;&nbsp;<span><a style="cursor: pointer;" class="commentdel" data-commentcheck="0" data-reno="${reply.reNo }"><small>삭제</small></a></span>
			                            		</c:if>	
			                            		
			                            		</div>
			                            	</div>
			                        </div>
			                    </div>
							</c:forEach>
			                </div>
			                
			            </div>
			        </div>
			     </div>
				</div>
		</div>
		<br>
	</c:forEach>
	
	
	<nav>
		  <ul class="pagination">
		    <li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
		      <a class="page-link" href="/journal/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}" tabindex="-1" aria-disabled="true">Prev</a>
		    </li>
		    
		    <c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
		    	<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
		    		<a class="page-link" href="/journal/list?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
		    			<c:out value="${page}"/>
		    		</a>
		    	</li>
		    </c:forEach>
		   
		    <li class="page-item ${pageResultDTO.next ? "":'disabled' }">
		      <a class="page-link" href="/journal/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
		    </li>
		  </ul>
		</nav>

</div>

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<div class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Result</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>${msg }</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){

	
	
	
	$(".replybtn").on("click", function(e) {
		
		
		
		var mEmail = '${loginUser}'; //회원 아이디
		var reContent = $.trim($(this).closest(".replycard").find("#reContent").val()); //댓글 내용
		//var oriNo = $("#reJno").val();
		var oriNo = $(this).closest(".replycard").find("#reJno").val();
		var result= "";
		
		if(reContent=="" || reContent==null){
			alert("댓글을 입력해주세요!");
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "/reply/replyinsert",
			data : {reContent : reContent,
					oriNo : oriNo,
					mEmail : mEmail,
					reDiv : "JRN"},
			dataType : "json",
			success :
				function(data){
				result= data;
				if(result==0){
					//alert("댓글을 입력해주세요!");
				} else if(result==1){
					//alert("등록되었습니다");
					
				}
				location.reload(); //새로고침
				},
				error : function(){
					console.log("ajax 댓글 실패");
				}
		});
	});
	
	
	$(".commentinsertbtn").on("click", function(e) {
		
		var mEmail = '${loginUser}';
		var oriNo = $(this).closest(".replycard").find("#reJno").val();
		var commentTxt = $.trim($(this).closest("div").find("textarea").val());
		var targetreNo = $(this).data('reno');
		var result= "";
		
		if(commentTxt == null || commentTxt ==""){
			alert("댓글을 입력해주세요!");
			return false;
		}
		
		//console.log(targetreNo);
		//console.log(commentTxt);
		
		$.ajax({
			type : "POST",
			url : "/reply/commentinsert",
			data : {reContent : commentTxt,
					oriNo : oriNo,
					mEmail : mEmail,
					reDiv : "JRN",
					reGroup : targetreNo},
			dataType : "json",
			success :
				function(data){
				result= data;
				if(commentTxt=="" || commentTxt==null){
					//alert("댓글을 입력해주세요!");
				} else if(result==1){
					//alert("대댓글성공");
					
				}
				location.reload();
				},
				error : function(){
					console.log("ajax 대댓글 실패");
				}
		});
	});
	
	
	

$(".commentTxt").hide();
$(".replyModify").hide();
$(".commentModify").hide();




	
	$(".commentinsert").on("click", function(e) {
			
				$(this).parent().parent().parent().find(".commentTxt").toggle();
					
		});
	
	
	
	
	$(".commentdel").on("click", function(e) {
	
		var reNo = $(this).data('reno');
		var commentCheck = $(this).data('commentcheck');
		
		
		$.ajax({
			type : "POST",
			url : "/reply/replyDelete",
			data : {reNo : reNo,
					commentCheck : commentCheck},
			dataType : "json",
			success :
				function(data){
				var data = data;
				console.log(data);
				if(data >= 1){
					alert("삭제되었습니다.")

					
				}else{
					alert("본인이 작성한 댓글만 삭제 할 수 있습니다.")

				}
				location.reload();
				
			}
			
		});
		
		
	});
	
	$(".replymodifybtn").on("click", function(e){
		$(this).parent().parent().parent().parent().find(".replyModify").toggle();
	});
	
	$(".commentmodify").on("click", function(e){
		$(this).parent().parent().find(".commentModify").toggle();
	});

	
	
	$(".replyModifybtn").on("click", function(e) {
		
		var reNo = $(this).parent().parent().data('reno');
		var reContent = $(this).closest(".commentHome").find("textarea").val();
		
		//console.log(reNo);
		//console.log(reContent);
		
		
		$.ajax({
			type : "POST",
			url : "/reply/replyModify",
			data : {reContent : reContent,
					reNo : reNo},
			dataType : "json",
			async:false
		});
			
		location.reload();
		
	});
	
	
	$(".commentModifybtn").on("click", function(e) {
			
			var reNo = $(this).parent().parent().data('reno');
			var reContent = $(this).parent().parent().find("textarea").val();
			
			console.log(reNo);
			console.log(reContent);
			
			
			$.ajax({
				type : "POST",
				url : "/reply/replyModify",
				data : {reContent : reContent,
						reNo : reNo},
				dataType : "json",
				async:false
			});
				
			location.reload();
			
		});
	
	
	
	$(".heartbtn").on("click", function(e) {
			
			var target = $(this);
			var targetJno = $(this).data('jno');
			console.log("targetJno>>",targetJno);
			var heartval = $(".heartval").val;
			var mEmail = '${loginUser}';
			var result = "";
	
			
			$.ajax({
				type : "POST",
				url : "/likeyou/insertLike",
				data : {jNo : targetJno,
						mEmail : mEmail},
				dataType : "json",
				success :
					function(data){
					var data = data;
					//console.log(typeof data);
					if(data >= 1){
						$(".heartimg").prop("src", "/resources/imgs/heart2.svg");
	
						
					}else{
						$(".heartimg").prop("src", "/resources/imgs/heart1.svg");
	
					}
					location.reload();
					
				}
				
			});
			
		});


	var searchForm = $("#searchForm");
	var msg = '${msg}';
	console.log("msg>>",msg);

	$("#searchForm button").on("click",function(e){

		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();		
		});

	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
	
});


</script>




<%@ include file="../include/footer.jsp"%>
