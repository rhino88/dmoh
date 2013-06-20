<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

			<ul>
			  <c:forEach var="item" items="${content.navItems}">
				<li style="list-style:none;"><cms:a href="${item.link.url}"><cms:render value="${item.name}" /></cms:a></li>
			  </c:forEach>
			</ul>
