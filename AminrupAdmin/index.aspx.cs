using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AminrupAdmin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // after validating credentials
            //Session["UserName"] = "Testing";
            //Session["LoginUtc"] = DateTime.UtcNow;
            //Session["AbsoluteExpiryUtc"] = DateTime.UtcNow.AddHours(8); // absolute session limit, change as required

        }
    }
}