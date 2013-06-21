<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<%@page import="
com.psddev.brightspot.Article,
com.psddev.brightspot.Author,
com.psddev.dari.db.Query,
java.util.List;
"%>

<c:set var="imageSize" value="articleCrop" scope="request" />

<h3>Written by: <c:out value="${content.author.name}"/></h3>
<cms:img src="${content.image}" /></br></br>
<cms:render value="${content.body}" />
<hr>

<% 
	Object o = request.getAttribute("mainContent");
	if (o instanceof Article) {
	Article a = (Article) o;
	Author au = a.getAuthor();
	List<Article> articles = Query.from(Article.class).
	where("author = ?", au).selectAll();
	pageContext.setAttribute("articles", articles);

	}
%>

<h4>More Articles by <c:out value="${content.author.name}"/>:</h4>

<ul>
  <c:forEach var="item" items="${articles}">
	<li><cms:a href="${item}"><cms:render value="${item.headline}" /></cms:a></li>
  </c:forEach>
</ul>
</div>
