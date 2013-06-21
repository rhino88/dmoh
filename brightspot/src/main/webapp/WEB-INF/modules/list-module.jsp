<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div style="border-top: 1px solid #333; padding:10px;">
<c:out value="${content.name}"/>
<ul>
<c:forEach var="item" items="${content.links}">
<li><cms:a href="${item.url}"><cms:render value="${item.text}" /></cms:a></li>
</c:forEach>
</ul>
</div>