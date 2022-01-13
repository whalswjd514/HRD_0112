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
<form name="form" method="post" action="update_courseProcess.jsp">
<h1>교과목 수정 화면</h1>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	
	try{
		String sql="select * from course0112 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		while(rs.next()){
			id=rs.getString(1);
			String name=rs.getString(2);
			String credit=rs.getString(3);
			String lecturer=rs.getString(4);
			String week=rs.getString(5);
			String start_hour=rs.getString(6);
			String end_end=rs.getString(7);
			System.out.println("데이터 조회 성공");
%>
<table border=1 id="tab1">
	<tr>
		<th>교과목 코드</th>
		<td><input type="text" name="id" value="<%=id %>"></td>
	</tr>
	<tr>
		<th>과목명</th>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<th>학점</th>
		<td><input type="text" name="credit" value="<%=credit %>"></td>
	</tr>
	<tr>
		<th>담 당 강 사</th>
		<td>
			<select name="lecturer">
				<option value="">담당강사 선택</option>
				<option value="1" <%if(lecturer.equals("1")){%>selected<%}%>>김교수</option>
				<option value="2" <%if(lecturer.equals("2")){%>selected<%}%>>이교수</option>
				<option value="3" <%if(lecturer.equals("3")){%>selected<%}%>>박교수</option>
				<option value="4" <%if(lecturer.equals("4")){%>selected<%}%>>우교수</option>
				<option value="5" <%if(lecturer.equals("5")){%>selected<%}%>>최교수</option>
				<option value="6" <%if(lecturer.equals("6")){%>selected<%}%>>강교수</option>
				<option value="7" <%if(lecturer.equals("7")){%>selected<%}%>>황교수</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>요일</th>
		<td>
			<input type="radio" name="week" value="1" <%=week.equals("1") ? "checked" : "" %>> 월 
			<input type="radio" name="week" value="2" <%=week.equals("2") ? "checked" : "" %>> 화
			<input type="radio" name="week" value="3" <%=week.equals("3") ? "checked" : "" %>> 수 
			<input type="radio" name="week" value="4" <%=week.equals("4") ? "checked" : "" %>> 목 
			<input type="radio" name="week" value="5" <%=week.equals("5") ? "checked" : "" %>> 금 
			<input type="radio" name="week" value="6" <%=week.equals("6") ? "checked" : "" %>> 토 
		</td>
	</tr>
	<tr>
		<th>시 작</th>
		<td><input type="text" name="start_hour" value="<%=start_hour %>"></td>
	</tr>
	<tr>
		<th>종 료</th>
		<td><input type="text" name="end_end" value="<%=end_end %>"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" id="btn1" onclick="location.href='select_course.jsp'">
			<input type="button" value="수정" id="btn1" onclick="check()">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		cnt=0;
		var week=document.getElementsByName("week");
		for(var i=0;i<week.length;i++){
			if(week[i].checked==true){
				cnt++;
				break;
			}
		}
		
		if(document.form.id.value==""){
			alert("교과목 코드가 입력되지 않았습니다.");
			document.form.id.focus();
		}else if(document.form.name.value==""){
			alert("교과목명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.credit.value==""){
			alert("학점이 입력되지 않았습니다.");
			document.form.credit.focus();
		}else if(document.form.lecturer.value==""){
			alert("담당강사가 입력되지 않았습니다.");
			document.form.lecturer.focus();
		}else if(document.form.credit.value==""){
			alert("학점이 입력되지 않았습니다.");
			document.form.credit.focus();
		}else if(cnt==0){
			alert("요일이 입력되지 않았습니다.");
			document.form.week.focus();
		}else if(document.form.start_hour.value==""){
			alert("시작시간이 입력되지 않았습니다.");
			document.form.start_hour.focus();
		}else if(document.form.end_end.value==""){
			alert("종료시간이 입력되지 않았습니다.");
			document.form.end_end.focus();
		}else{
			document.form.submit();
		}
	}
</script>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>