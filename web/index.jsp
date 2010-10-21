<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Oct 20, 2010, 4:47:06 PM
    Author     : Tiago
--%>
<sql:query var="subjects" dataSource="jdbc/lingu">
    SELECT subject_id, name FROM Subject
</sql:query>

<table border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${subjects.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${subjects.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
<body>
    <h2>Welcome to <strong>IFPWAFCAD</strong>, the International Former
        Professional Wrestlers' Association for Counseling and Development!
    </h2>

    <table border="0">
        <thead>
            <tr>
                <th>IFPWAFCAD offers expert counseling in a wide range of fields.</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>To view the contact details of an IFPWAFCAD certified former
                    professional wrestler in your area, select a subject below:</td>
            </tr>
            <tr>
                <td>
   <form action="response.jsp">
    <strong>Select a subject:</strong>
    <select name="subject_id">
       <c:forEach var="row" items="${subjects.rows}">
            <option value="${row.subject_id}">${row.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="submit" name="submit" />
</form>
                </td>
            </tr>
        </tbody>
    </table>
</body>

</html>
