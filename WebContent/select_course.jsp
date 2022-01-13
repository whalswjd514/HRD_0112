<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>교과목 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th>과목코드</th>
		<th>과목명</th>
		<th>학점</th>
		<th>담당강사</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	 try{
		 String sql="select * from course0112 order by id asc";
		 pstmt=conn.prepareStatement(sql);
		 rs=pstmt.executeQuery();
		 while(rs.next()){
			 String id=rs.getString(1);
			 String name=rs.getString(2);
			 String credit=rs.getString(3);
			 String lecturer=rs.getString(4);
			 String week=rs.getString(5);
			 String start_hour=rs.getString(6);
			 String end_end=rs.getString(7);
			 System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=credit %></td>
		<td><%=lecturer %></td>
		<td><%=week %></td>
		<td><%=start_hour %></td>
		<td><%=end_end %></td>
		<td><a href="update_course.jsp?id=<%=id %>">수정</a> / 
			<a href="delete_course.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<%
			 }
	 }catch(SQLException e){
		 System.out.println("테이블 조회 실패");
		 e.printStackTrace();
	 }
%>
</table>
<div class="btn_group" align=center width="20px">
	<button type="button" onclick="location.href='insert_course.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>