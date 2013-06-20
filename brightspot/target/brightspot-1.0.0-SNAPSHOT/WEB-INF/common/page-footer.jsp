<%@page import="
com.psddev.brightspot.SiteSettings,
com.psddev.dari.db.Query,
com.psddev.dari.util.Settings
"%>
<%
    SiteSettings settings = Query.from(SiteSettings.class).first();
    pageContext.setAttribute("copyrightText", settings.getCopyrightText());
%>
      <hr>

      <footer class="pull-right">
        <p>&copy; ${copyrightText} 2013</p>
      </footer>

    </div> <!-- /container -->
  </body>
</html>
