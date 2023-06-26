<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나의 리뷰</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/myreview.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>

		<section class="sec01">
			<c:choose>
				<c:when test="${userChk eq true }"><%@ include file="../../fix/mnb.jsp" %></c:when>
				<c:otherwise><%@ include file="../../fix/mnb2.jsp" %></c:otherwise>
			</c:choose>
		</section>

		<section class="sec02">
			<%@ include file="../../fix/Lmenu.jsp" %>
		
			<div class="main">				
				<c:forEach var="ReviewDTO" items="${list }" >
				
					<a href="<c:url value='/detailPage/reply?content_no=${ReviewDTO.content_no}&review_no=${ReviewDTO.review_no}' />" class="review">
						<div class="post">					  	
						    <div class="Lside">
						      	<img class="poster" src="${ReviewDTO.thumbnail}">
						    </div>
						    <div class="Rside">
						    	<div class="rv-head">
						    		<span class="title">${ReviewDTO.content_nm}</span>
						    		<div class="starating">
						    			<img class="star" src="${path}/resources/images/img/starone.png">
						        		<span class="point">${ReviewDTO.rating}</span>						    		
						    		</div>
						      	</div>
						
								<div class="rv-main">
								  <span>${ReviewDTO.review_content}</span>
								</div>
						    </div>
					  	</div>
				  	</a>			  	
			  	</c:forEach>
			  	
			  	<div class=paging-container>
		    		<div class="paging">
		    			<c:if test="${myReviewCnt == null || myReviewCnt == 0 }">		    			
		    				<div class="title-line" style="text-align: center;">
		    					내가 쓴 리뷰가 없습니다.
		    				</div>
		    			</c:if>
		    			
		    			<c:if test="${myReviewCnt != null || myReviewCnt != 0 }">
		    			<!-- 페이지 번호 배너-->
				        <div class="page-num" style="margin-top: 10px;">
				        	<nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">
				          	<ul class="pagination">				          		
					            <c:if test="${pr.showPrev}">
						            <li class="page-item">
						            	<a class="page-link" href="<c:url value="/mypage/myreview${pr.sc.getList(pr.beginPage-1) }" />">&lt;</a>
					            	</li>
					            </c:if>
					            <c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
					            	<li class="page-item">
					            		<a class="page-link" href="<c:url value="/mypage/myreview${pr.sc.getList(i) }" />">${i }</a>
				            		</li>
				            	</c:forEach>
			            		<c:if test="${pr.showNext}">
			            			<li class="page-item">
			            				<a class="page-link" href="<c:url value="/mypage/myreview${pr.sc.getList(pr.endPage+1) }" />" >&gt;</a>
		            				</li>
            					</c:if>
       						</ul>
   							</nav>
						</div>
						</c:if>  			
		    			
		    		</div>	    	
	    		</div>	    	
			
			</div>
		</section>
	</div>

</body>
</html>