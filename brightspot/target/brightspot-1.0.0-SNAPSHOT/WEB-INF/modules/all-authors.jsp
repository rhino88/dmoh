<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<%@page import="com.psddev.brightspot.Article, com.psddev.brightspot.Author, com.psddev.dari.db.Query, java.util.List;
"%>

<jsp:include page="/WEB-INF/common/page-header.jsp"/>

    <div class="container">
       <div class="row">
          <div class="span3">
            <div class="sidebar-nav">
                <ul class="nav">
                <li class="nav-header">Menu</li>

            </div><!--/.well -->
          </div><!--/span-->


        <div class="span6">
            <h3>All Authors:</h3>
			<cms:img src="${content.image}" />
			</br></br>

			<%  List<Author> authors = Query.from(Author.class).selectAll();
				pageContext.setAttribute("authors", authors);
			%>
			<ul>
			  <c:forEach var="item" items="${authors}">
				<li style="list-style:none;"><cms:img src="${item.profileImage}"/></br>
					<cms:render value="${item.name}" /></li>
			  </c:forEach>
			</ul>

        </div><!--/span-->
</div>
<jsp:include page="/WEB-INF/common/page-footer.jsp"/>