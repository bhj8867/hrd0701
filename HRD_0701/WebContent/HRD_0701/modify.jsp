<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목수정</title>
<link type="text/css" rel="stylesheet" href="st.css">

<script type="text/javascript">
function check(){
	if(document.modifyform.id.value==""){
		alert("과목 코드를 입력하시오.");
		document.modifyform.id.focus();
	}else
		document.modifyform.submit();
	
}
</script>

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
<%@include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

//http://localhost:8090/HRD_0701/HRD_0701/update.jsp?id=10001(이것이 숫자라서 int로 변환한 뒤 들고 와야하나?)
int id=Integer.parseInt(request.getParameter("id"));
String name="";
String credit="";
String lecturer="";
String week="";
String start_hour="";
String end_hour="";

try{
	String sql="select id,name,credit,lecturer,week,start_hour,end_hour from course_tbl where id="+id;
	/* 순서도 중요 */
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		id=rs.getInt(1);
		name=rs.getString(2);
		credit=rs.getString(3);
		lecturer=rs.getString(4);
		System.out.println(lecturer);
		
		/* if(lecturer.equals("김교수")){
			lecturer="1";
		}else if(lecturer.equals("이교수")){
			lecturer="2";
		}else if(lecturer.equals("박교수")){
			lecturer="3";
		}else if(lecturer.equals("우교수")){
			lecturer="4";
		}else if(lecturer.equals("최교수")){
			lecturer="5";
		}else if(lecturer.equals("강교수")){
			lecturer="6";
		}else if(lecturer.equals("황교수")){
			lecturer="7";
		}  */
		
		week=rs.getString(5);
		start_hour=rs.getString(6);
		end_hour=rs.getString(7);
		
		System.out.println("di : "+id);
		}
	}catch(SQLException e){
		System.out.println("테이블 호출 실패 "+e.getMessage());
		
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>


<form name=modifyform method="post" action="modify_process.jsp">
<h2>교과목 수정 화면</h2>

<table>
<tr>
<th>과목코드</th>
<td><input type=text name=id size=30 value="<%=id%>"></td>
</tr>

<tr>
<th>과목명</th>
<td><input type=text name=name size=30 value="<%=name %>"></td>
</tr>

<tr>
<th>학점</th>
<td><input type=text name=credit size=30 value="<%=credit %>"></td>
</tr>

<tr>
<th>담당강사</th>
<td>
<select name="lecturer" >
<option value="1" <%if(lecturer.equals("김교수")){%>selected<%}%>>김교수</option>
<option value="2" <%if(lecturer.equals("이교수")){%>selected<%}%>>이교수</option>
<option value="3" <%if(lecturer.equals("박교수")){%>selected<%}%>>박교수</option>
<option value="4" <%if(lecturer.equals("우교수")){%>selected<%}%>>우교수</option>
<option value="5" <%if(lecturer.equals("최교수")){%>selected<%}%>>최교수</option>
<option value="6" <%if(lecturer.equals("강교수")){%>selected<%}%>>강교수</option>
<option value="7" <%if(lecturer.equals("황교수")){%>selected<%}%>>황교수</option>
</select>
</td>
</tr>



<tr>
<th>요일</th>
<td>
<select name="week" >
<option value="1" <%if(week.equals("1")){%>selected<%}%>>월요일</option>
<option value="2" <%if(week.equals("2")){%>selected<%}%>>회요일</option>
<option value="3" <%if(week.equals("3")){%>selected<%}%>>수요일</option>
<option value="4" <%if(week.equals("4")){%>selected<%}%>>목요일</option>
<option value="5" <%if(week.equals("5")){%>selected<%}%>>금요일</option>
<option value="6" <%if(week.equals("6")){%>selected<%}%>>토요일</option>
</select>
</td>
</tr>


<tr>
<th>시작시간</th>
<td><input type=text name=start_hour size=30 value="<%=start_hour %>"></td>
</tr>

<tr>
<th>종료시간</th>
<td><input type=text name=end_hour size=30 value="<%=end_hour%>"></td>
</tr>

<tr align=center><td colspan=2>
<input type=button value="수정" onClick="javascript:check()">
<input type=button value="취소" onclick="location.href='index.jsp'">
</td></tr>


</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>