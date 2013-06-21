<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div class="homepage-container">
	<h3><c:out value="${content.name}"/></h3>
	<p><cms:render value="${content.welcomeText}"/></p>
</div>