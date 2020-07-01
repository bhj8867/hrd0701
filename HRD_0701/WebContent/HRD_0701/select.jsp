<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청조회</title>
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
			<%@ include file="DBConn.jsp"%>

			<form name=lecture_select method="post">

				<h2>교과목 목록</h2>

				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;
					int cnt = 0;
					String sql = "";

					try {
						sql = "select count(*) from course_tbl";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							cnt = rs.getInt(1);
						}
					} catch (SQLException e) {
						System.out.println("오류" + e.getMessage());
					}
				%>
				<p>
					총 <%=cnt%>개의 교과목이 있습니다.
				</p>

				<table>
					<tr>
						<th>과목코드</th>
						<th>교과명</th>
						<th>학점</th>
						<th>담당강사</th>
						<th>요일</th>
						<th>시작시간</th>
						<th>종료시간</th>
						<th>관리</th>
					</tr>

					<%
						try {
							sql = "select a.id, a.name, a.credit, b.name, a.week, a.start_hour, a.end_hour from course_tbl a, lecture_tbl b where a.lecturer=b.idx order by a.id";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();

							while (rs.next()) {
								String id = rs.getString(1);
								String name = rs.getString(2);//DB에있는 데이터 불러옴
								String credit = rs.getString(3);
								String lecturer = rs.getString(4);
								String week = rs.getString(5);
								String start_hour = rs.getString(6);
								String end_hour = rs.getString(7);
					%>
					<tr>
						<td align=center><%=id%></td>
						<td align=center><%=name%></td>
						<td align=center><%=credit%></td>
						<td align=center><%=lecturer%></td>
						<td align=center><%=week%></td>
						<td align=right><%=start_hour%></td>
						<td align=right><%=end_hour%></td>
						<td align=center>
						<a href="modify.jsp?id=<%=id%>">수정</a>
						<a href="delete.jsp?id=<%=id%>">/삭제</a>
						</td>

						<%
								}
							} catch (SQLException e) {
								System.out.println("오류" + e.getMessage());
							}
						%>
					</tr>
				</table><br><br><br><br><br>
				<input class=button type=button value="작성" onclick="location.href='insert.jsp'"  style="float: right">
			</form>
		</div>
	</section>

	<footer><jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>