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
            <h1>ARTICLE HEADLINE GOES HERE</h1>
            Lorem ipsum dolor sit amet, duo probo audire interesset in, no nam justo labores volutpat, ad quo veniam repudiare. Ex vel autem appareat probatus. Te his odio dissentiunt, ne ius probo dicam. Fuisset splendide id vim.

            Eum mazim essent alterum ea, atqui tation timeam nec ne. Mel ut alia mandamus sadipscing, albucius legendos no nam. Ne mutat possim omnesque mea. Vim ex affert putent dissentiet. Vis ex apeirian posidonium. Graece putant ea mea, te usu probo posse bonorum.

            Sit at commodo nominavi fabellas, vis cu sonet vulputate eloquentiam. In suas dissentiet eam. Natum homero impetus sed in, etiam interesset ad ius. Eos id delenit dolorem, ne nam natum reprehendunt, usu rebum erroribus adolescens no. Id commodo fierent intellegam vel.

            Eirmod oblique legimus nec ex, ut mei sale feugiat consequat, aliquando constituam vim et. At eum maiestatis interpretaris, possim laboramus in sea. Utinam apeirian legendos duo an, malis ubique libris at has, semper feugait vel in. Sea id dicta nullam, eum at eligendi periculis theophrastus. Eu eum legere adversarium, qui tritani nostrum persecuti in. Meliore invenire disputando id qui, dicat delicata sit eu.

            Nam an apeirian oportere recteque, sonet elitr consectetuer ne his, euismod denique propriae sit ei. An porro definitionem sea, postea posidonium deterruisset has ei. Cum ea solet mandamus, has dictas copiosae laboramus ne. Cum te tacimates platonem.
          <div class="span3">
            <h2>Right Rail</h2>
            <p>List of ALL articles on the site</p>
            <ul>
              <li>Article 1</li>
              <li>Article 2</li>
              <li>Article 3</li>
            </ul>
        </div>
      </div>

<jsp:include page="/WEB-INF/common/page-footer.jsp"/>