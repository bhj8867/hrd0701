<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

String id=request.getParameter("id");//폼에서 입력받은 id(from name =id)
String name=request.getParameter("name");
String credit=request.getParameter("credit");
String lecturer=request.getParameter("lecturer");
String week=request.getParameter("week");
String start_hour=request.getParameter("start_hour");
String end_hour=request.getParameter("end_hour");
//int idx=Integer.parseInt(request.getParameter("id")); 폼에서 넘어오는 데이터는 모두 string으로 넘어 오기때문에 반드시 이렇게 해줘야한다.

//폼에서 입력받은 id idx로 변수설정

try{
		String sql="update course_tbl set id=?,name=?,credit=?,lecturer=?,week=?,start_hour=?,end_hour=? where id="+id ;
		//sql="update personnel set name="+name+",position="+position+",duty="+duty+",dept="+dept+",phone="+phone+" where name="+id;
		//sql="update personnel set name='"+name+"',position='"+position+"',duty='"+duty+"',dept='"+dept+"' where id="+id";
		 //System.out.println(sql);
	 	pstmt=conn.prepareStatement(sql);
	 	pstmt.setString(1,id);//string custno
		pstmt.setString(2,name);
		pstmt.setString(3,credit);
		pstmt.setString(4,lecturer);
		pstmt.setString(5,week);
		pstmt.setString(6,start_hour);
		pstmt.setString(7,end_hour);
		pstmt.executeUpdate();

		%>
		<script>
			self.window.alert("수정되었습니다.");
			location.href="select.jsp";
		</script>
		<%
	}catch(SQLException e){
		out.println("수정실패ㅠㅠ"+e.getMessage());
		%>
		<script>
			self.window.alert("정보를 다시 확인하세요.");
			loacation.href="javascript:history.back(-1)";
		</script>
		<%	
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
