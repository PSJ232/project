<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--    Made by Erik Terwan    -->
<!--   24th of November 2015   -->
<!--        MIT License        -->
<nav role="navigation" id="admin_nav">
	<div id="menuToggle">
	  <!--
	  A fake / hidden checkbox is used as click reciever,
	  so you can use the :checked selector on it.
	  -->
	  <input type="checkbox" />
	  
	  <!--
	  Some spans to act as a hamburger.
	  
	  They are acting like a real hamburger,
	  not that McDonalds stuff.
	  -->
	  <span></span>
	  <span></span>
	  <span></span>
	  
	  <!--
	  Too bad the menu has to be inside of the button
	  but hey, it's pure CSS magic.
	  -->
		<ul id="menu">
			<li><a href="MemberList.ad">회원관리</a></li>
			<li><a href="#">리뷰관리</a></li>
			<li><a href="ItemList.ad">상품관리</a></li>
			<li><a href="#">매출관리</a></li>
			<li><a href="OrderList.ad">주문관리</a></li>
			<li><a href="ClassList.ad">클래스관리</a></li>
			<li><a href="#">문의관리</a></li>
		</ul>
	</div>
</nav>
