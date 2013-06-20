<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>
<jsp:include page="/WEB-INF/common/page-header.jsp"/>

    <div class="container">

      <div class="hero-unit">
        <h1><cms:render value="${mainContent.pageHeadline}" /></h1>
        <p><cms:render value="${mainContent.welcomeText}" /></p>
        <p><a href="${mainContent.promoLink.url}" class="btn btn-primary btn-large"><c:out value="${mainContent.promoLink.text}"/> &raquo;</a></p>
      </div>



      <div class="row">
        <c:forEach var="articles" items="${mainContent.promoArticles}">
            <li style="list-style:none;">
                <div class="span4">
		          <h3><cms:render value="${articles.headline}" /></h3>
		          <h5>Written By: <cms:render value="${articles.author.name}" /></h5>
		          <p><cms:render value="${articles.intro}" /></p>
		          <p><cms:a class="btn" href="${articles.permalink}">View details &raquo;</cms:a></p>
		        </div>
            </li>
        </c:forEach>
      </div>
      
<jsp:include page="/WEB-INF/common/page-footer.jsp"/>