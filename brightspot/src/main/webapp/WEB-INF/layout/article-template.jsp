<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>
<%@page import="
    com.psddev.brightspot.Article,
    com.psddev.brightspot.Author,
    com.psddev.dari.db.Query,
    java.util.List
"%>

  <style type="text/css">
    .relatedContent {
      list-style:none;
      font-size: 12px;
      margin-left:-10px;
    }
  </style>

<jsp:include page="/WEB-INF/common/page-header.jsp"/>

    <div class="container">
      <div class="row">
        <div class="span6">
            <h1><cms:render value="${mainContent.headline}"/></h1>
            <cms:render value="${mainContent}"></cms:render>
             <div class="span3">
          <h2>Right Rail</h2>
          <p>Right Rail content</p>
          <%  List<Article> articles = Query.from(Article.class).selectAll();
              pageContext.setAttribute("articles", articles);
          %>
          <ul>
            <c:forEach var="item" items="${articles}">
            <li><cms:a href="${item}"><cms:render value="${item.headline}" /></cms:a></li>
            </c:forEach>
          </ul>
          <c:choose>
            <c:when test="${!empty mainContent.rightRailModules}">
                <cms:render value="${mainContent.rightRailModules}" />
            </c:when>    
              <c:otherwise>
                <cms:render value="${template.rightRailModules}" />
            </c:otherwise>
          </c:choose>
            

         </div>
      </div>

<jsp:include page="/WEB-INF/common/page-footer.jsp"/>