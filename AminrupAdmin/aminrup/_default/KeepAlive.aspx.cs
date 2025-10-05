using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AminrupAdmin.aminrup._default
{
    public partial class KeepAlive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This keeps the session alive simply by being requested
            Response.ContentType = "application/json";
            Response.Write("{\"alive\": true, \"serverTime\": \"" + DateTime.Now.ToString("o") + "\"}");
            Response.End();

            //// Optional: check session or auth; return appropriate status
            //var result = new
            //{
            //    alive = Session != null && Session["UserName"] != null,
            //    serverTime = DateTime.UtcNow.ToString("o"),
            //    absoluteExpiry = (Session["AbsoluteExpiryUtc"] != null) ? ((DateTime)Session["AbsoluteExpiryUtc"]).ToString("o") : null
            //};

            //Response.ContentType = "application/json";
            //var js = new JavaScriptSerializer();
            //Response.Write(js.Serialize(result));
            //Response.End();
        }
    }
}