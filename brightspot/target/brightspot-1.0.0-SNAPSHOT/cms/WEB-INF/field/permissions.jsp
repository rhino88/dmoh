<%@ page import="

com.psddev.cms.db.Content,
com.psddev.cms.db.Site,
com.psddev.cms.db.Template,
com.psddev.cms.db.Workflow,
com.psddev.cms.tool.Area,
com.psddev.cms.tool.Plugin,
com.psddev.cms.tool.ToolPageContext,
com.psddev.cms.tool.Widget,

com.psddev.dari.db.Application,
com.psddev.dari.db.Database,
com.psddev.dari.db.Modification,
com.psddev.dari.db.ObjectField,
com.psddev.dari.db.ObjectType,
com.psddev.dari.db.Query,
com.psddev.dari.db.State,
com.psddev.dari.util.ObjectUtils,
com.psddev.dari.util.SparseSet,

java.io.IOException,
java.util.ArrayList,
java.util.HashMap,
java.util.HashSet,
java.util.Iterator,
java.util.LinkedHashMap,
java.util.List,
java.util.Map,
java.util.Set
" %><%

// --- Logic ---

ToolPageContext wp = new ToolPageContext(pageContext);

State state = State.getInstance(request.getAttribute("object"));

ObjectField field = (ObjectField) request.getAttribute("field");
String fieldName = field.getInternalName();
String fieldValue = (String) state.getValue(fieldName);
SparseSet permissions = new SparseSet(ObjectUtils.isBlank(fieldValue) ? "+/" : fieldValue);

String inputName = (String) request.getAttribute("inputName");

if ((Boolean) request.getAttribute("isFormPost")) {

    permissions.clear();
    Set<String> denieds = new HashSet<String>();
    for (String permissionId : wp.params(inputName)) {

        if (permissionId == null) {
            permissionId = "";
        }

        String parent = wp.param(inputName + "." + permissionId);
        if ("all".equals(parent)) {
            permissions.add(permissionId);
            permissions.add(permissionId + "/");

        } else if ("some".equals(parent)) {
            permissions.add(permissionId);

        } else if ("no".equals(parent)) {
            if (permissionId.length() == 0) {
                break;
            } else {
                denieds.add(permissionId + "/");
            }

        } else {
            boolean isDenied = false;
            for (String denied : denieds) {
                if (permissionId.startsWith(denied)) {
                    isDenied = true;
                    break;
                }
            }
            if (!isDenied) {
                permissions.add(permissionId);
            }
        }
    }

    state.putValue(fieldName, permissions.toString());
    return;
}

Map<ObjectType, Workflow> workflows = new HashMap<ObjectType, Workflow>();

for (Workflow w : Query.from(Workflow.class).selectAll()) {
    for (ObjectType t : w.getContentTypes()) {
        workflows.put(t, w);
    }
}

wp.writeStart("div", "class", "inputSmall permissions");
    wp.writeStart("div", "class", "permissionsSection");
        writeParent(wp, permissions, "Sites", "site");

        wp.writeStart("ul");
            wp.writeStart("li");
                writeChild(wp, permissions, "Global", "site/global");
            wp.writeEnd();

            for (Site site : Site.findAll()) {
                wp.writeStart("li");
                    writeChild(wp, permissions, site, site.getPermissionId());
                wp.writeEnd();
            }
        wp.writeEnd();
    wp.writeEnd();

    wp.writeStart("div", "class", "permissionsSection");
        writeParent(wp, permissions, "Areas", "area");

        wp.writeStart("ul");
            for (Area top : wp.getCmsTool().findTopAreas()) {
                if (top.hasChildren()) {
                    wp.writeStart("li");
                        writeParent(wp, permissions, top, top.getPermissionId());

                        wp.writeStart("ul");
                            for (Area child : top.findChildren()) {
                                wp.writeStart("li");
                                    writeChild(wp, permissions, child, child.getPermissionId());
                                wp.writeEnd();
                            }
                        wp.writeEnd();
                    wp.writeEnd();

                } else {
                    wp.writeStart("li");
                        writeChild(wp, permissions, top, top.getPermissionId());
                    wp.writeEnd();
                }
            }
        wp.writeEnd();
    wp.writeEnd();

    wp.writeStart("div", "class", "permissionsSection");
        writeParent(wp, permissions, "Widgets", "widget");

        wp.writeStart("ul");
            for (Widget widget : wp.getCmsTool().findPlugins(Widget.class)) {
                wp.writeStart("li");
                    writeChild(wp, permissions, widget, widget.getPermissionId());
                wp.writeEnd();
            }
        wp.writeEnd();
    wp.writeEnd();

    wp.writeStart("div", "class", "permissionsType");
        writeParent(wp, permissions, "Types", "type");

        List<ObjectType> mainTypes = Template.Static.findUsedTypes(wp.getSite());
        List<ObjectType> internalTypes = new ArrayList<ObjectType>();
        List<ObjectType> typesList = Query.
                from(ObjectType.class).
                sortAscending("name").
                selectAll();

        mainTypes.retainAll(typesList);
        typesList.removeAll(mainTypes);

        for (Iterator<ObjectType> i = typesList.iterator(); i.hasNext(); ) {
            ObjectType t = i.next();
            String name = t.getInternalName();
            Set<String> groups = t.getGroups();

            if (!t.isConcrete() ||
                    name.startsWith("com.psddev.cms.db.") ||
                    name.startsWith("com.psddev.cms.tool.") ||
                    groups.contains(Modification.class.getName()) ||
                    groups.contains(Application.class.getName()) ||
                    groups.contains(Plugin.class.getName()) ||
                    !groups.contains(Content.SEARCHABLE_GROUP)) {
                i.remove();

                wp.writeTag("input",
                        "type", "hidden",
                        "name", inputName,
                        "value", "type/" + t.getId().toString());

                wp.writeTag("input",
                        "type", "hidden",
                        "name", inputName,
                        "value", "type/" + t.getId().toString() + "/");
            }
        }

        Map<String, List<ObjectType>> typeGroups = new LinkedHashMap<String, List<ObjectType>>();

        typeGroups.put("Main Content Types", mainTypes);
        typeGroups.put("Misc Content Types", typesList);

        for (Map.Entry<String, List<ObjectType>> entry : typeGroups.entrySet()) {
            wp.writeStart("h2").writeHtml(entry.getKey()).writeEnd();

            wp.writeStart("ul");
                for (ObjectType type : entry.getValue()) {
                    String typePermissionId = "type/" + type.getId().toString();

                    wp.writeStart("li");
                        writeParent(wp, permissions, type, typePermissionId);

                        wp.writeTag("input",
                                "type", "hidden",
                                "name", inputName,
                                "value", typePermissionId + "/field");

                        wp.writeTag("input",
                                "type", "hidden",
                                "name", inputName,
                                "value", typePermissionId + "/field/");

                        wp.writeStart("ul");
                            wp.writeStart("li");
                                writeChild(wp, permissions, "Read", typePermissionId + "/read");
                            wp.writeEnd();

                            wp.writeStart("li");
                                writeChild(wp, permissions, "Write", typePermissionId + "/write");
                            wp.writeEnd();

                            wp.writeStart("li");
                                writeChild(wp, permissions, "Publish", typePermissionId + "/publish");
                            wp.writeEnd();

                            Workflow workflow = workflows.get(type);

                            if (workflow != null) {
                                for (String transition : workflow.getTransitions().keySet()) {
                                    wp.writeStart("li");
                                        writeChild(wp, permissions, "Workflow: " + transition, typePermissionId + "/" + transition);
                                    wp.writeEnd();
                                }
                            }

                            /*<li>writeParent(wp, permissions, "All Fields", fieldPermissionIdPrefix);
                                <ul>
                                    for (ObjectField typeField : type.getFields()) {
                                        String fieldPermissionId = fieldPermissionIdPrefix + "/" + typeField.getInternalName();
                                        <li>
                                        writeParent(wp, permissions, typeField, fieldPermissionId);
                                            <ul>
                                                <li> writeChild(wp, permissions, "Read", fieldPermissionId + "/read");
                                                <li> writeChild(wp, permissions, "Write", fieldPermissionId + "/write");
                                            </ul>
                                        </li>
                                    }
                                </ul>
                            </li>*/
                        wp.writeEnd();
                    wp.writeEnd();
                }
            wp.writeEnd();
        }
    wp.writeEnd();
wp.writeEnd();
%><%!

private static void writeLabel(ToolPageContext wp, Object object) throws IOException {

    if (object instanceof String) {
        wp.write(wp.h(object));

    } else if (object instanceof ObjectField) {
        wp.write(wp.h(((ObjectField) object).getLabel()));

    } else {
        wp.write(wp.objectLabel(object));
    }
}

private static void writeParent(ToolPageContext wp, Set<String> permissions, Object object, String permissionId) throws IOException {
    String inputName = (String) wp.getRequest().getAttribute("inputName");
    boolean hasSelf = permissions.contains(permissionId);
    boolean hasChildren = permissions.contains(permissionId + "/");

    wp.writeTag("input",
            "type", "hidden",
            "name", inputName,
            "value", permissionId);

    wp.writeStart("select",
            "id", wp.createId(),
            "name", inputName + "." + permissionId);
        wp.writeStart("option",
                "selected", hasSelf && hasChildren ? "selected" : null,
                "value", "all");
            wp.writeHtml("All ");
            writeLabel(wp, object);
        wp.writeEnd();

        wp.writeStart("option",
                "selected", hasSelf && !hasChildren ? "selected" : null,
                "value", "some");
            wp.writeHtml("Some ");
            writeLabel(wp, object);
        wp.writeEnd();

        wp.writeStart("option",
                "selected", !hasSelf && !hasChildren ? "selected" : null,
                "value", "no");
            wp.writeHtml("No ");
            writeLabel(wp, object);
        wp.writeEnd();
    wp.writeEnd();
}

private static void writeChild(ToolPageContext wp, Set<String> permissions, Object object, String permissionId) throws IOException {

    wp.write("<input");
    if (permissions.contains(permissionId)) {
        wp.write(" checked");
    }
    wp.write(" id=\"");
    wp.write(wp.createId());
    wp.write("\" name=\"");
    wp.write(wp.h(wp.getRequest().getAttribute("inputName")));
    wp.write("\" type=\"checkbox\" value=\"");
    wp.write(wp.h(permissionId));

    wp.write("\"> <label for=\"");
    wp.write(wp.getId());
    wp.write("\">");
    writeLabel(wp, object);
    wp.write("</label>");
}
%>
