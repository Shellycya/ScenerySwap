using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateUserWizard1.Visible = false;
        if (Page.IsPostBack)
        {
            CreateUserWizard1.Visible = true;
        }
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        string myUser;

        MembershipUser user = Membership.GetUser();
        myUser = user.UserName;

        Roles.AddUserToRole(myUser, "Users");
        Response.Redirect("~/MyAccount/EditProfile.aspx");
    }

    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        CreateUserWizard1.Visible = true;
        Login1.Visible = false;
        HyperLink1.Visible = false;
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        
    }
}