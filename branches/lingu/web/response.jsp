<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Oct 20, 2010, 4:51:24 PM
    Author     : Tiago
--%>
<sql:query var="counselorQuery" dataSource="jdbc/lingu">
    SELECT * FROM Subject, Counselor WHERE Counselor.counselor_id = Subject.counselor_idfk AND Subject.subject_id = ? <sql:param value="${param.subject_id}"/>
</sql:query>

    <c:set var="counselorDetails" value="${counselorQuery.rows[0]}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>${counselorDetails.name}</title>
    </head>
    <body>
     <table border="0">
    <thead>
        <tr>
            <th colspan="2">${counselorDetails.name}</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>Description: </strong></td>
            <td><span style="font-size:smaller; font-style:italic;">${counselorDetails.description}</span></td>
        </tr>
        <tr>
            <td><strong>Counselor: </strong></td>
            <td>${counselorDetails.first_name} ${counselorDetails.nick_name} ${counselorDetails.last_name}
                <br>
                <span style="font-size:smaller; font-style:italic;">
                member since: ${counselorDetails.member_since}</span>
            </td>
        </tr>
        <tr>
            <td><strong>Contact Details: </strong></td>
            <td><strong>email: </strong>
                <a href="mailto:${counselorDetails.email}">${counselorDetails.email}</a>
                <br><strong>phone: </strong>${counselorDetails.telephone}
            </td>
        </tr>
    </tbody>
</table>
    </body>
</html>
