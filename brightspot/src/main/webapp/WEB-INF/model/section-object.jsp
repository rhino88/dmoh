<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<h1><c:out value="${content.title}"/></h1>
<cms:render value="${content.body}"/>