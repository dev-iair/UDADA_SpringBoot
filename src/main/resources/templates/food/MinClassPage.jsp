<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<style type="text/css">
				.linkHolder{
					float:left;
					width:400px;
				}
				
				.common{
					margin:30px;
				}
				.secHolder{
					float:left;
					width:440px;
					margin-left:20px;
					margin-top:60px;
				
				}
			</style> 

<div class="container-fluid">

	<h1 class="h3 mb-4 text-gray-800">
		 식품 상세분류 탐색
	</h1>

	<div class="centerInnerContent">
	
		<div id="content" class="mem">
	
			
		<div class="row">
		<div class="col-lg-12">
			<div class="card mb-4 py-3">		
			<table class="generic">
			
				<tbody>
				
					<tr valign="top">
					
						<td class="leftCell">
						
							<div class="leftCellContent">
							
								<div class="linkHolder">
								
								 	<table class="greybox">
									
										<tbody>
										
											<tr>
											
												<td class="content">
												
													<h2>소분류</h2>
													<br>
													
													<c:forEach var="dto" items="${Minlist}">
														
														<table class="common">
														
															<tbody>
														
																<tr>
																	<a href="#" data-f-minclass="${dto.FMinclass}" class="search_FoodDetail"><b><c:out value="${dto.FMinclass}"></c:out></b></a>
																</tr>		
														
															</tbody>
															
														</table>
														
													</c:forEach>
												
												</td>
											
											</tr>
										
										</tbody>
									
									</table>
								
								</div>
								
								<div class="secHolder">
								
									

								</div>
							
							</div>
						
						</td>
					
					</tr>
				
				</tbody>
				
			</table>
		
		</div>
	
	</div>

</div>
		</div>
		</div>
		</div>
	</div>


<!-- /.container-fluid -->
<!-- End of Main Content -->

<script>

$(document).ready(function(){

	$(".search_FoodDetail").on("click", function(){
		
		$(".secHolder").empty();
		var fMinclass = $(this).data("fMinclass");
		var str = "";	

		$.ajax({
				
			url:"/food/foodname",
			type:"GET",
			data: {fMinclass:fMinclass},
			astnc:false,
			dataType:"json",
				
			success:function(data){
				console.log(data);
					
				$.each(data, function (index, list){
					str += "<h4>"+
						   "<a href='/food/FoodInfo?fNo="+list.fno+"'>"+list.fname+"</a>"+
					       "</h4>"; 
					       
					       /*"<div class=food_links>" + 
					       "	<a href='/food/FoodInfo?fNo=" + list.fno + "'> <b>" + list.fname + "</b></a>" + 
					       "</div>";
					       
					       "<div class=col-xl-3 col-md-6 mb-4>" + 
					       "	<div class=card border-left-success shadow h-100 py-0>" + 
					       "		<div class=card-body>" +
					       "			<div class=row no-gutters align-items-center>" + 
					       "				<div class=col mt-2>" + 
					       "					<div class=text-xs font-weight-bold text-success text-uppercase mb-1>" +
					       "						<a href='food/FoodInfo?fNo=" + list.fno + "'><b>" + list.fname + "</b></a>";
					       "					</div>" +
					       "				</div>" +
					       "			</div>" +
					       "		</div>" +
					       "	</div>" +
					       "</div>";
							*/"";
				});
					
				$(".secHolder").append(str);		
					
			},
			error:function(xhr,status,errorThrown){
					
				console.log("xhr >>",xhr);
					
			}
			
		});
		
	});
});	
</script>
        
<%@ include file="../include/footer.jsp"%>
