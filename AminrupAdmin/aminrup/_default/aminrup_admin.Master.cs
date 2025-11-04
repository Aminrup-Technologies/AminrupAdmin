using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AminrupAdmin.aminrup._default
{
    public partial class aminrup_admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RenderMenu();
            }
        }

        private void RenderMenu()
        {
            // Use test data (same GetTestMenuNodes() implementation)
            var nodes = GetTestMenuNodes();
            nodes = FilterByRole(nodes, GetCurrentUserRoleId());

            // build tree and HTML (use the exact BuildNodeHtml / IsActiveNode methods)
            var lookup = nodes.ToLookup(n => n.ParentId);
            Func<int?, List<MenuNode>> build = null;
            build = parentId => lookup[parentId]
                .OrderBy(n => n.SortOrder)
                .Select(n => { n.Children = build(n.MenuId); return n; }).ToList();

            var tree = build(null);
            var sb = new StringBuilder();
            sb.AppendLine("<div class=\"pcoded-navigatio-lavel\">Navigation</div>");
            sb.AppendLine("<ul class=\"pcoded-item pcoded-left-item\">");

            foreach (var top in tree)
                sb.Append(BuildNodeHtml(top, Request.Url.AbsolutePath));

            sb.AppendLine("</ul>");
            ltrSideMenu.Text = sb.ToString();
        }

        private int GetCurrentUserRoleId()
        {
            // Example options (choose what matches your app):
            // 1) stored in session after login:
            if (Session["RoleId"] != null) return Convert.ToInt32(Session["RoleId"]);

            // 2) from custom principal/identity:
            // var roleClaim = ((ClaimsPrincipal)User).Claims.FirstOrDefault(c => c.Type=="role");
            // if (roleClaim != null) return int.Parse(roleClaim.Value);

            // fallback: return a test role
            return 1;
        }

        // Recursive HTML builder matching Adminity classes
        private string BuildNodeHtml_OLD(MenuNode node, string currentUrl)
        {
            var sb = new StringBuilder();
            bool hasChildren = node.Children != null && node.Children.Count > 0;
            bool isActive = IsActiveNode(node, currentUrl);
            string liClass = (hasChildren ? "pcoded-hasmenu " : "") + (isActive ? "active" : "") + (isActive && hasChildren ? " pcoded-trigger" : "");

            sb.AppendFormat("<li class=\"{0}\">", liClass.Trim());
            sb.AppendLine();
            sb.AppendFormat("  <a href=\"{0}\">", string.IsNullOrEmpty(node.Url) ? "javascript:void(0)" : node.Url);
            sb.AppendLine();

            if (!string.IsNullOrEmpty(node.IconClass))
                sb.AppendFormat("    <span class=\"pcoded-micon\"><i class=\"{0}\"></i></span>", HttpUtility.HtmlEncode(node.IconClass));
            else
                sb.Append("    <span class=\"pcoded-micon\"><i class=\"feather icon-circle\"></i></span>");

            sb.AppendFormat("    <span class=\"pcoded-mtext\">{0}</span>", HttpUtility.HtmlEncode(node.Title));

            if (!string.IsNullOrEmpty(node.BadgeText))
                sb.AppendFormat("    <span class=\"pcoded-badge label {0}\">{1}</span>", HttpUtility.HtmlEncode(node.BadgeClass ?? "label-info"), HttpUtility.HtmlEncode(node.BadgeText));

            sb.AppendLine("  </a>");

            if (hasChildren)
            {
                sb.AppendLine("  <ul class=\"pcoded-submenu\">");
                foreach (var child in node.Children)
                {
                    sb.Append(BuildNodeHtml(child, currentUrl));
                }
                sb.AppendLine("  </ul>");
            }

            sb.AppendLine("</li>");
            return sb.ToString();
        }

        private string BuildNodeHtml(MenuNode node, string currentUrl)
        {
            var sb = new StringBuilder();
            bool hasChildren = node.Children != null && node.Children.Count > 0;
            bool isActive = IsActiveNode(node, currentUrl);
            string liClass = (hasChildren ? "pcoded-hasmenu " : "") + (isActive ? "active" : "") + (isActive && hasChildren ? " pcoded-trigger" : "");

            sb.AppendFormat("<li class=\"{0}\">", liClass.Trim());
            sb.AppendLine();

            // ✅ Replaced lines begin here
            string href = GetHrefForRender(node.Url);
            sb.AppendFormat("  <a href=\"{0}\">", href);
            // ✅ Replaced lines end here

            if (!string.IsNullOrEmpty(node.IconClass))
                sb.AppendFormat("    <span class=\"pcoded-micon\"><i class=\"{0}\"></i></span>", HttpUtility.HtmlEncode(node.IconClass));
            else
                sb.Append("    <span class=\"pcoded-micon\"><i class=\"feather icon-circle\"></i></span>");

            sb.AppendFormat("    <span class=\"pcoded-mtext\">{0}</span>", HttpUtility.HtmlEncode(node.Title));

            if (!string.IsNullOrEmpty(node.BadgeText))
                sb.AppendFormat("    <span class=\"pcoded-badge label {0}\">{1}</span>", HttpUtility.HtmlEncode(node.BadgeClass ?? "label-info"), HttpUtility.HtmlEncode(node.BadgeText));

            sb.AppendLine("  </a>");

            if (hasChildren)
            {
                sb.AppendLine("  <ul class=\"pcoded-submenu\">");
                foreach (var child in node.Children)
                {
                    sb.Append(BuildNodeHtml(child, currentUrl));
                }
                sb.AppendLine("  </ul>");
            }

            sb.AppendLine("</li>");
            return sb.ToString();
        }


        private bool IsVirtualAppPath(string url)
        {
            if (string.IsNullOrWhiteSpace(url)) return false;
            url = url.Trim();

            // treat anchors, javascript pseudo-URLs, and external urls as NOT virtual app paths
            if (url.StartsWith("javascript:", StringComparison.OrdinalIgnoreCase)) return false;
            if (url.StartsWith("#")) return false;
            if (url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                url.StartsWith("https://", StringComparison.OrdinalIgnoreCase)) return false;

            // paths like /foo, ~/foo, ~/ are ok
            return url.StartsWith("/") || url.StartsWith("~");
        }

        private string NormalizeForComparison(string url)
        {
            if (string.IsNullOrWhiteSpace(url)) return null;
            url = url.Trim();

            if (!IsVirtualAppPath(url))
                return null; // signal that url is not a comparable app path

            // This is safe because we only call ToAbsolute for valid virtual paths
            try
            {
                return VirtualPathUtility.ToAbsolute(url).TrimEnd('/').ToLowerInvariant();
            }
            catch
            {
                return null;
            }
        }

        private bool IsActiveNode(MenuNode node, string currentUrl)
        {
            if (!string.IsNullOrEmpty(node.Url))
            {
                var menuNormalized = NormalizeForComparison(node.Url);
                if (!string.IsNullOrEmpty(menuNormalized))
                {
                    var cur = currentUrl?.TrimEnd('/').ToLowerInvariant();
                    if (!string.IsNullOrEmpty(cur) && menuNormalized == cur)
                        return true;
                }
                // if menuNormalized is null => the menu is external/javascript — cannot be active by path
            }

            if (node.Children != null)
                return node.Children.Any(c => IsActiveNode(c, currentUrl));

            return false;
        }

        private string GetHrefForRender(string url)
        {
            if (string.IsNullOrWhiteSpace(url))
                return "javascript:void(0);";

            url = url.Trim();

            // If URL is an external link, preserve it
            if (url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                url.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
                return url;

            // If it's a fragment anchor, keep it
            if (url.StartsWith("#")) return url;

            // If it's javascript pseudo-URL keep as-is
            if (url.StartsWith("javascript:", StringComparison.OrdinalIgnoreCase)) return url;

            // Otherwise treat as virtual path (make absolute)
            try
            {
                return VirtualPathUtility.ToAbsolute(url);
            }
            catch
            {
                // fallback if something odd is stored in DB
                return "javascript:void(0);";
            }
        }


        private bool IsActiveNode_OLD(MenuNode node, string currentUrl)
        {
            if (!string.IsNullOrEmpty(node.Url))
            {
                var u = VirtualPathUtility.ToAbsolute(node.Url).TrimEnd('/').ToLowerInvariant();
                var cur = currentUrl.TrimEnd('/').ToLowerInvariant();
                if (u.Equals(cur, StringComparison.OrdinalIgnoreCase))
                    return true;
            }

            if (node.Children != null)
                return node.Children.Any(c => IsActiveNode(c, currentUrl));

            return false;
        }

        // ----- Test data helpers -----
        private List<MenuNode> GetTestMenuNodes()
        {
            // Create an in-memory list simulating DB rows. MenuId must be unique ints.
            var list = new List<MenuNode>
            {
                // Top-level Dashboard (group)
                new MenuNode { MenuId = 1, ParentId = null, Title = "Dashboard", Url = "javascript:void(0)", IconClass = "feather icon-home", SortOrder = 1, Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 2, ParentId = 1, Title = "Supervisor", Url = "/aminrup/_default/index-1.htm", SortOrder = 1, IconClass = "feather icon-user", Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 3, ParentId = 1, Title = "Incharge", Url = "/aminrup/_default/dashboard-crm.htm", SortOrder = 2, IconClass = "feather icon-user-check", Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 4, ParentId = 1, Title = "Safety", Url = "/aminrup/_default/dashboard-analytics.htm", SortOrder = 3, IconClass = "feather icon-shield", BadgeText = "NEW", BadgeClass = "label-info", Roles = new List<int>{1} },

                // Permit Jobs group
                new MenuNode { MenuId = 10, ParentId = null, Title = "Permit Jobs", Url = "javascript:void(0)", IconClass = "feather icon-clipboard", SortOrder = 10, Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 11, ParentId = 10, Title = "Add Jobs", Url = "/aminrup/permit/add-job.htm", SortOrder = 1, IconClass = "feather icon-plus-square", Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 12, ParentId = 10, Title = "Manage Jobs", Url = "/aminrup/permit/manage-job.htm", SortOrder = 2, IconClass = "feather icon-list", Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 13, ParentId = 10, Title = "Approve Jobs", Url = "/aminrup/permit/approve-job.htm", SortOrder = 3, IconClass = "feather icon-check-circle", Roles = new List<int>{1,2} },

                // Job Approvals group
                new MenuNode { MenuId = 20, ParentId = null, Title = "Job Approvals", Url = "javascript:void(0)", IconClass = "feather icon-check-square", SortOrder = 20, Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 21, ParentId = 20, Title = "Approve Jobs", Url = "/aminrup/approvals/approve-job.htm", SortOrder = 1, IconClass = "feather icon-check", Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 22, ParentId = 20, Title = "Manage Jobs", Url = "/aminrup/approvals/manage-job.htm", SortOrder = 2, IconClass = "feather icon-edit-2", Roles = new List<int>{1,2} },

                // Memo & Bills group (Daily memo nested)
                new MenuNode { MenuId = 30, ParentId = null, Title = "Memo & Bills", Url = "javascript:void(0)", IconClass = "feather icon-file-text", SortOrder = 30, Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 31, ParentId = 30, Title = "Daily Memo", Url = "javascript:void(0)", SortOrder = 1, IconClass = "feather icon-calendar", Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 32, ParentId = 31, Title = "Alert", Url = "/aminrup/alert.htm", SortOrder = 1, IconClass = "feather icon-alert-circle", Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 33, ParentId = 31, Title = "Button Examples", Url = "/aminrup/button.htm", SortOrder = 2, IconClass = "feather icon-command", Roles = new List<int>{1,2,3} },

                // CSMS (deeper nested example)
                new MenuNode { MenuId = 40, ParentId = null, Title = "CSMS", Url = "javascript:void(0)", IconClass = "feather icon-award", SortOrder = 40, Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 41, ParentId = 40, Title = "Notifications", Url = "javascript:void(0)", SortOrder = 1, IconClass = "feather icon-bell", Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 42, ParentId = 41, Title = "PNOTIFY", Url = "/aminrup/notify.htm", SortOrder = 1, IconClass = "feather icon-bell", Roles = new List<int>{1,2} },

                new MenuNode { MenuId = 100, ParentId = null, Title = "Data Mastering", Url = "javascript:void(0)", IconClass = "feather icon-sliders", SortOrder = 0, Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 101, ParentId = 100, Title = "Organization Data", Url = "/aminrup/master/organization-data.htm", IconClass = "feather icon-briefcase", SortOrder = 1, Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 102, ParentId = 100, Title = "Employee Data", Url = "/aminrup/master/employee-data.htm", IconClass = "feather icon-users", SortOrder = 2, Roles = new List<int>{1,2,3} },
                new MenuNode { MenuId = 103, ParentId = 100, Title = "Work-Orders", Url = "/aminrup/master/workorder-data.htm", IconClass = "feather icon-file-text", SortOrder = 3, Roles = new List<int>{1,2} },
                new MenuNode { MenuId = 104, ParentId = 100, Title = "Work-Sites", Url = "/aminrup/master/work-sites.htm", IconClass = "feather icon-map-pin", SortOrder = 4, Roles = new List<int>{1,2,3} }
            };


            return list;
        }

        private List<MenuNode> FilterByRole(List<MenuNode> nodes, int roleId)
        {
            // Simple role-based visibility: keep nodes which include the role in their Roles list.
            // Note: we include parent nodes if any child is visible to keep hierarchy intact.
            var dict = nodes.ToDictionary(n => n.MenuId);
            var allowed = new HashSet<int>(nodes.Where(n => n.Roles != null && n.Roles.Contains(roleId)).Select(n => n.MenuId));

            // also mark parents if any child allowed
            bool added;
            do
            {
                added = false;
                foreach (var n in nodes)
                {
                    if (!allowed.Contains(n.MenuId) && n.ParentId.HasValue && allowed.Contains(n.MenuId))
                    {
                        // no-op
                    }
                    if (n.ParentId.HasValue && allowed.Contains(n.MenuId) && !allowed.Contains(n.ParentId.Value))
                    {
                        allowed.Add(n.ParentId.Value);
                        added = true;
                    }
                }
            } while (added);

            return nodes.Where(n => allowed.Contains(n.MenuId)).ToList();
        }

        // ----- Data model used for rendering -----
        private class MenuNode
        {
            public int MenuId { get; set; }
            public int? ParentId { get; set; }
            public string Title { get; set; }
            public string Url { get; set; }
            public string IconClass { get; set; }
            public string BadgeText { get; set; }
            public string BadgeClass { get; set; }
            public int SortOrder { get; set; }
            public List<int> Roles { get; set; } = new List<int>(); // role ids that can see this item
            public List<MenuNode> Children { get; set; } = new List<MenuNode>();
        }

    }
}