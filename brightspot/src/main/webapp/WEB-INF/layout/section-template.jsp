<!-- FULL WIDTH GRID ONE -->

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


              <cms:layout class="layout">
                  <cms:render area="content">
                    <cms:render value="${mainContent}"/>
                  </cms:render>
              <cms:render area="right"><h3>Right Rail</h3>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum euismod erat vel dui mattis, non congue eros mollis. Cras facilisis nisl vel fringilla consequat. Curabitur sit amet iaculis quam. Aenean in consequat quam. Donec sit amet laoreet tellus. Suspendisse iaculis nulla id nisi dapibus tincidunt. In consectetur metus vitae ligula lobortis laoreet. Cras tristique in libero quis tempus. Sed condimentum in nisi nec interdum. Sed sodales nibh non ante ornare, sit amet aliquet lorem mattis. Morbi ullamcorper venenatis magna nec commodo. Aenean semper viverra semper. Integer eget bibendum erat. Vestibulum pharetra justo nec blandit faucibus.

              </cms:render>
              </cms:layout>


<jsp:include page="/WEB-INF/common/page-footer.jsp"/>