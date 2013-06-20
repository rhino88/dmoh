<html>
<head> 
<%@page import="
com.psddev.brightspot.SiteSettings,
com.psddev.dari.db.Query,
com.psddev.dari.util.Settings
"%>
    <title>${seo.title}</title>

<%
    SiteSettings settings = Query.from(SiteSettings.class).first();
    pageContext.setAttribute("globalNavigation", settings.getGlobalNavigation());
%>
  <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <script src="/static/js/jquery-1.9.0.min.js" type="text/javascript"></script> 
  <script src="/static/js/jquery.tools.min.js" type="text/javascript"></script> 

  <style type="text/css">
    body {
      padding-top: 60px;
      padding-bottom: 40px;
    }
  </style>
</head>

  <body>

  <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="/" />${globalNavigation}</a>
        </div>
      </div>
    </div>