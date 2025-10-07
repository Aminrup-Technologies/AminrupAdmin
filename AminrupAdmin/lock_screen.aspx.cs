using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AminrupAdmin
{
    public partial class lock_screen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If your sign-in stores the locked user's email in session prior to redirecting to lock-screen:
                if (Session["LockedUserEmail"] != null)
                {
                    //txtEmail.Text = Session["LockedUserEmail"].ToString();
                    txtEmail.Text = "";
                }

                // If your final pages use localization or custom scripts that set body classes, replicate them here (optional)
            }
        }

        protected void btnUnlock_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            //string password = txtPassword.Text; // If you added password

            if (string.IsNullOrEmpty(email))
            {
                ShowError("Please enter email.");
                return;
            }

            // ---------- AUTH CHECK ----------
            // Replace the following with your real ADO.NET / LINQ code that matches your sign-in logic.
            // Secure approach: verify email+password (hash), set FormsAuthentication cookie, restore session.

            bool unlocked = false;

            // Quick inline example (NOT secure production): compare with session-stored values
            if (Session["LockedUserEmail"] != null &&
                string.Equals(email, Session["LockedUserEmail"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                // If you used a password: verify it here (hash compare) - this example assumes no password
                unlocked = true;
            }
            //else
            //{
            //    unlocked = true;
            //}

            // Example ADO.NET (pseudo) - adapt to your DB schema and connection management
            /*
            using (var con = new System.Data.SqlClient.SqlConnection(yourConnString))
            {
                var cmd = new System.Data.SqlClient.SqlCommand("SELECT PasswordHash FROM Users WHERE Email=@e AND IsActive=1", con);
                cmd.Parameters.AddWithValue("@e", email);
                con.Open();
                var dbHash = cmd.ExecuteScalar() as string;
                if (dbHash != null && VerifyHash(password, dbHash)) unlocked = true;
            }
            */

            if (unlocked)
            {
                // Set authentication (FormsAuth or session) to mirror your final sign-in flow
                // If you use FormsAuthentication:
                // FormsAuthentication.SetAuthCookie(email, false);

                Session["IsAuthenticated"] = true;
                Session["CurrentUserEmail"] = email;
                Session.Remove("LockedUserEmail");

                string returnUrl = Session["ReturnUrl"] as string;
                if (!string.IsNullOrEmpty(returnUrl))
                    Response.Redirect(returnUrl, false);
                else
                    Response.Redirect("index.aspx", false);
            }
            else
            {
                ShowError("Unlock failed. Provide correct credentials.");
            }
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
            lblError.Visible = true;
            string script = $"showPNotify('Error','{HttpUtility.JavaScriptStringEncode(message)}','error');";
            ScriptManager.RegisterStartupScript(this, GetType(), "showPNotify", script, true);
        }

    }
}