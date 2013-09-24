using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Member : System.Web.UI.Page
{
    ModelsDataContext modelData = new ModelsDataContext();
    String member;
    private int avatarWidthHeight = 42;

    protected void Page_Load(object sender, EventArgs e)
    {
        member = (string)Session["MemberUser"];
        //member = MemberName.Text;  //get rid of this and use the above line

        loadMemberInfo(member);
    }

    /*
     * Loads all the information we need
     * about the selected member.
     * */
    private void loadMemberInfo(string member)
    {
        // need email, profession, website
        var query = from user in modelData.Users
                    where user.Username == member
                    select new
                    {
                        mail = user.Email,
                        prof = user.LineOfWork,
                        web = user.Website,
                        avatar = user.AvatarPic,
                        userN = user.Username,
                        display = user.DisplayEmail
                    };
        MemberName.Text = Convert.ToString(query.ToList().ElementAt(0).userN);
        MemberProfession.Text = Convert.ToString(query.ToList().ElementAt(0).prof);
        MemberWebsite.Text = Convert.ToString(query.ToList().ElementAt(0).web);
        MemberWebsite.NavigateUrl = Convert.ToString(query.ToList().ElementAt(0).web);
        AvatarPic2.Width = avatarWidthHeight;
        AvatarPic2.Height = avatarWidthHeight;
        AvatarPic2.ImageUrl = Convert.ToString(query.ToList().ElementAt(0).avatar);
        SubmittedByLBL.Text = "Art submitted by " + member;
        string display = Convert.ToString(query.ToList().ElementAt(0).display);
        if (display == "yes")
        {
            MemberEmail.Text = Convert.ToString(query.ToList().ElementAt(0).mail);
        }
        else
        {
            MemberEmail.Text = "private";
        }
    }

    /*
     * Lets you click on the picture to see its details in the preview page.
     * */
    protected void MemberRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Image picImage = (Image)e.Item.FindControl("MemImage");
        string imagePath = picImage.ImageUrl;

        var query = from picture in modelData.Pictures
                    join product in modelData.Products on picture.ProductID equals product.ProductID
                    where picture.ImagePath == imagePath
                    select new
                    {
                        pID = product.ProductID
                    };

        string prodID = Convert.ToString(query.ToList().ElementAt(0).pID);

        Session.Add("ProductID", prodID);
        Session.Add("PrevPage", "Categories");
        Response.Redirect("~/Preview.aspx");
    }


}