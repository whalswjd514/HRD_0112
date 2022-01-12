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
<h1>학사정보 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>학과</th>
		<th>학년</th>
		<th>주소</th>
		<th>연락처</th>
		<th>취미</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from stud0112";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String studno=rs.getString(1);
			String name=rs.getString(2);
			String dept=rs.getString(3);
			String position=rs.getString(4);
			String address=rs.getString(5);
			String phone=rs.getString(6);
			String hobby=rs.getString(7);
			System.out.println("테이블 읽기 성공");
%>
	<tr>
		<td><%=studno %></td>
		<td><%=name %></td>
		<td><%=dept %></td>
		<td><%=position %></td>
		<td><%=address %></td>
		<td><%=phone %></td>
		<td><%=hobby %></td>
		<td><a href="update_student.jsp?studno=<%=studno %>">수정</a> / 
			<a href="delete_student.jsp?studno=<%=studno %>">삭제</a>
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 읽기 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='insert_student.jsp'">학사정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>