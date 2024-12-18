<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/test.css" />

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>



<style>
@media screen and (max-width: 1300px) {
  .user-menu {
    display: none;
  }
}
.login{
	padding-right : 10px;
} 
</style>

	<header class="header">   
	   <div class="fixedMenu">
	        <div class="logo"><a href="/"><img id="header_logo" src="/resources/logo/expert_connection_logo_h_05.png" width="170px" height="45px"></a></div>
	        <nav class="nav">
	            <ul class="recommend">
	               <li><a href="#">전문가 추천</a></li>
	               <li><a href="#">전문가 검색</a></li>
	               <li><a href="#">커뮤니티</a>
	               		<ul class="sub-menu">
	               			<li><a href="#">사용자 게시판</a></li>
                            <li><a href="#">전문가 게시판</a></li>
                            <li><a href="#">전문가 노하우</a></li>
                            <li><a href="#">그룹 레슨</a></li>
	               		</ul>
	               </li>
	               <li><a href="#">카테고리</a></li>
	            </ul>
	        </nav>
	        <ul class="member-menu">
	            <c:choose>
	            <c:when test="${empty sessionScope.loginMember}">
	                    <li><a href="/member/loginFrm.exco" class="login">로그인</a></li>
	                    <li><a href="/member/joinFrm">회원가입</a></li>
	            </c:when>
	            <c:otherwise>
	                    <li>채팅</li> <span> | </span>
	                    <li>알림</li> <span> | </span>
	                    <li>마이페이지</li> <span> | </span>
	                    <li>로그아웃</li>
	            </c:otherwise>
	            </c:choose>
	        </ul>
	    </div>
	</header>
   
   <script>
   //자주사용하는 함수 header에 선언 -> 다른 jsp에서 script에 작성하지 않아도 됨
   function msg(title, text, icon) {
      swal({
         title : title,
         text : text,
         icon : icon
      });
   }
   </script>