using System;
using System.Messaging;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Web.Security;

public partial class MasterPageHome : System.Web.UI.MasterPage
{
    ModelsDataContext modelData = new ModelsDataContext();
    private string username;

    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        if (user != null)
        {
            LoginPic.Attributes.Add("border", "2px solid black");
            username = user.UserName;
            Session.Add("username", username);
            //thisUser = modelData.Users.Single(u => u.Username == username);
            UploadAvatarPic(username);
            if (LoginPic.ImageUrl.Contains("default")) {
                LoginPic.Attributes.Remove("border");
            }
        }
    }

    /* This will search the models by genre, tags, artist (program?) */
    protected void SearchBTN_Click(object sender, EventArgs e)
    {
        String terms = ArtistSearchTB.Text;
        Session.Add("SearchTerms", terms);
        Response.Redirect("~/Categories.aspx");
    }

    // Change the avatar pic to the custom picture the user chose
    private void UploadAvatarPic(string username)
    {
        int avatarWidthHeight = 42;
        var query = from user in modelData.Users
                    where user.Username == username
                    select user.AvatarPic;
        if (query.Count() > 0)
        {
            string filename = query.Single();

            LoginPic.Width = avatarWidthHeight;
            LoginPic.Height = avatarWidthHeight;
            LoginPic.ImageUrl = filename;
        }
    }

}
