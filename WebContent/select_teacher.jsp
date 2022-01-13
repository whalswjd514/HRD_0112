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
<h1>강사 리스트</h1>
<table border=1 id="tab2">
	<tr>
		<th>깅사코드</th>
		<th>강사명</th>
		<th>전공</th>
		<th>세부전공</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from lecturer0112";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String idx=rs.getString(1);
			String name=rs.getString(2);
			String major=rs.getString(3);
			String field=rs.getString(4);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=idx %></td>
		<td><%=name %></td>
		<td><%=major %></td>
		<td><%=field %></td>
		<td><a href="update_teacher.jsp?idx=<%=idx %>">수정</a> / 
			<a href="delete_teacher.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
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
<div class="btn_group" align=center onclick="location.href='insert_teacher.jsp'">
	<button type="button">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>