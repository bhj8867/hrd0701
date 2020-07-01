<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<link type="text/css" rel="stylesheet" href="st.css">

</head>
<body>
<header>
<jsp:include page="header.jsp" />
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">
<h2>수강신청 도우미 시스템</h2>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강신청 도우미 시스템을 작성한다.</h3>
<ul>
<li>수강신청 데이터베이스를 구축한다.</li>
<li>수강신청 테이블에 샘플데이터를 SQL문을 사용하여 데이터를 추가생성한다.</li>
<li>주어진 화면디자인을 이용하여 화면을 디자인한다.</li>
<li>업무요건에 따라 프로그램을 작성한다.</li>
</ul>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>