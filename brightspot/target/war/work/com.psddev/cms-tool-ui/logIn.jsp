<%@ page import="

com.psddev.cms.db.ToolAuthenticationPolicy,
com.psddev.cms.db.ToolUser,
com.psddev.cms.tool.AuthenticationFilter,
com.psddev.cms.tool.ToolPageContext,

com.psddev.dari.db.Query,
com.psddev.dari.util.AuthenticationException,
com.psddev.dari.util.AuthenticationPolicy,
com.psddev.dari.util.HtmlWriter,
com.psddev.dari.util.JspUtils,
com.psddev.dari.util.ObjectUtils,
com.psddev.dari.util.Settings,

java.net.MalformedURLException,
java.net.URL,
java.util.UUID
" %><%

// --- Logic ---

ToolPageContext wp = new ToolPageContext(pageContext);
AuthenticationException authError = null;
String email = wp.param("email");
ToolUser user = ToolUser.Static.getByTotpToken(wp.param(String.class, "totpToken"));

if (wp.isFormPost()) {
    try {

        if (user != null) {
            if (!user.verifyTotp(wp.param(int.class, "totpCode"))) {
                throw new AuthenticationException("The code you've entered is either invalid or has already been used.");
            }

        } else {
            AuthenticationPolicy authPolicy = AuthenticationPolicy.Static.getInstance(Settings.get(String.class, "cms/tool/authenticationPolicy"));

            if (authPolicy == null) {
                authPolicy = new ToolAuthenticationPolicy();
            }

            user = (ToolUser) authPolicy.authenticate(email, wp.param(String.class, "password"));

            if (user.isTfaEnabled()) {
                String totpToken = UUID.randomUUID().toString();

                user.setTotpToken(totpToken);
                user.save();
                wp.redirect("", "totpToken", totpToken);
                return;
            }
        }

        AuthenticationFilter.Static.logIn(request, response, user);

        try {
            wp.redirect(new URL(JspUtils.getAbsoluteUrl(request, wp.param(AuthenticationFilter.RETURN_PATH_PARAMETER, "/"))).toString());

        } catch (MalformedURLException e) {
            wp.redirect("/");
        }

        return;

    } catch (AuthenticationException error) {
        authError = error;
    }
}

// --- Presentation ---

%><% wp.include("/WEB-INF/header.jsp"); %>

<style type="text/css">
.toolHeader {
    background-color: transparent;
    border-style: none;
}
.toolTitle {
    float: none;
    height: 100px;
    margin: 30px 0 0 0;
    text-align: center;
}
.toolFooter {
    border-style: none;
    text-align: center;
}
.toolFooter .build {
    background-position: top center;
    text-align: center;
}
.widget {
    margin: 0 auto;
    width: 30em;
}
body {
    margin-top: 170px;
}
body.hasToolBroadcast {
    margin-top: 195px;
}
</style>

<div class="widget">
    <h1>Log In</h1>

    <%
    if (wp.param(boolean.class, "forced")) {
        wp.writeStart("div", "class", "message message-warning");
            wp.writeHtml("You've been inactive for too long or logged out from a different page. Please log in again.");
        wp.writeEnd();
    }

    if (authError != null) {
        new HtmlWriter(wp.getWriter()).object(authError);
    }
    %>

    <% if (!Query.from(ToolUser.class).hasMoreThan(0)) { %>
        <div class="message message-info">
            <p>Welcome! You're our first user. Give us your email and
            password and we'll make you an administrator.</p>
        </div>
    <% } %>

    <form action="<%= wp.url("", "forced", null) %>" method="post">
        <% if (user == null) { %>
            <div class="inputContainer">
                <div class="inputLabel">
                    <label for="<%= wp.createId() %>">Email</label>
                </div>
                <div class="inputSmall">
                    <input class="autoFocus" id="<%= wp.getId() %>" name="email" type="text" value="<%= wp.h(email) %>">
                </div>
            </div>

            <div class="inputContainer">
                <div class="inputLabel">
                    <label for="<%= wp.createId() %>">Password</label>
                </div>
                <div class="inputSmall">
                    <input id="<%= wp.getId() %>" name="password" type="password">
                </div>
            </div>

        <% } else { %>
            <div class="inputContainer">
                <div class="inputLabel">
                    <label for="<%= wp.createId() %>">Code</label>
                </div>
                <div class="inputSmall">
                    <input id="<%= wp.getId() %>" name="totpCode" type="text">
                </div>
            </div>
        <% } %>

        <div class="buttons">
            <button class="action action-logIn">Log In</button>
        </div>
    </form>
</div>

<% wp.include("/WEB-INF/footer.jsp"); %>
