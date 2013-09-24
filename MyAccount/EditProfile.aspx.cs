using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

public partial class MyAccount_Profile : System.Web.UI.Page
{
    private string username;
    private int thumbWidthHeight = 39;
    private int avatarWidthHeight = 42;
    private bool existingUser = false;
    private string defaultAvatar = "~/App_Themes/Green/images/smlDefaultThumb.png";
    private string defaultPath = "~/App_Themes/Green/images/";
    ModelsDataContext modelData = new ModelsDataContext();
    MembershipUser user = Membership.GetUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        username = user.UserName;

        // If there's data in the user database than autofill
        var query = from thisUser in modelData.Users
                    where thisUser.Username == username
                    select thisUser.FName;

        int fnameNum = query.Count();
        if (fnameNum > 0) { autoFillInfo(username); }

        // load a default avatar pic
        if (AvatarPic2.ImageUrl == defaultAvatar)
            pickRandPic();

        // Remove border if its a default pic
        if (AvatarPic2.ImageUrl.Contains("default"))
        {
            AvatarPic2.Attributes.Remove("border");
        }
    }

    // Selects a random avatar pic to use in case the user doesn't select their own.
    private void pickRandPic()
    {
        string[] randomPics = { "avatar_default", "blue_default", "green_default", "orange_default",
                              "pink_default", "red_default", "teal_default", "yellow_default"};
        Random random = new Random();
        AvatarPic2.ImageUrl = defaultPath + randomPics[random.Next(0, 8)] + ".png";
    }

    /*
     * If the user already has made a profile
     * then populate the fields with the info
     * */
    private void autoFillInfo(string username)
    {
        existingUser = true;
        User thisUser = modelData.Users.Single(u => u.Username == username);
        if (thisUser.FName != null) { fnameTB.Text = thisUser.FName; }
        if (thisUser.LName != null) { 
            lnameTB.Text = thisUser.LName;
            FullNameTB.Text = thisUser.FName + " " + thisUser.LName;
        }
        if (thisUser.Email != null) { emailTB.Text = thisUser.Email; retypeEmailTB.Text = thisUser.Email; }
        if (thisUser.LineOfWork != null) { ProfessionTB.Text = thisUser.LineOfWork; }
        if (thisUser.Website != null) { WebsiteTB.Text = thisUser.Website; }
        if (thisUser.Company != null) { CompanyTB.Text = thisUser.Company; }
        if (thisUser.Address != null) { AddressTB.Text = thisUser.Address; }
        if (thisUser.City != null) { CityTB.Text = thisUser.City; }
        if (thisUser.State != null) { StateTB.SelectedValue = thisUser.State; }
        if (thisUser.Zip != null) { ZipTB.Text = thisUser.Zip; }
        if (thisUser.Country != null) { CountryTB.Text = thisUser.Country; }
        if (thisUser.Phone != null) { TelephoneTB.Text = thisUser.Phone; }
        if (thisUser.DisplayEmail != null)
        {
            if (thisUser.DisplayEmail == "yes") { DisplayEmailCB.Checked = true; }
        }
        if (thisUser.SeeMature != null)
        {
            if (thisUser.SeeMature == "yes") { MatureCB.Checked = true; }
        }
        if (thisUser.PaymentMethod != null)
        {
            if (thisUser.SeeMature == "check") 
            { 
                checkRB.Checked = true;
            }
            else if (thisUser.SeeMature == "paypal")
            {
                paypalRB.Checked = true;
            }
        }
        if (AvatarPic2.ImageUrl != null)
        {
            //changeAvatarPic(thisUser.AvatarPic);
            AvatarPic2.Width = thumbWidthHeight;
            AvatarPic2.Height = thumbWidthHeight;
            AvatarPic2.ImageUrl = thisUser.AvatarPic;
            AvatarPic2.Attributes.Add("border", "2px black solid");
        }

    }


    /*
     * Upload a custom avatar picture.
     * */
    protected void UploadBTN_Click(object sender, EventArgs e)
    {
        if (AvatarUpload.HasFile)
        {
            String imgPath = "~/uploads/" + username + "/";
            Directory.CreateDirectory(Server.MapPath(imgPath));
            string ext = getExt(AvatarUpload.FileName);
            String imgPath_file = imgPath + "avatar." + ext;
            Session.Add("avatarPath", imgPath_file);
            AvatarUpload.SaveAs(Server.MapPath(imgPath_file));

            //changeAvatarPic(imgPath_file);

            AvatarPic2.Width = thumbWidthHeight;
            AvatarPic2.Height = thumbWidthHeight;
            AvatarPic2.ImageUrl = imgPath_file;

            //Delete existing avatarpic if in there under a different file extension

        }
        else
        {
            //Print out "no file was chosen" message
        }
    }


    protected string getExt(string fileName)
    {
        string[] names = fileName.Split('.');
        return names[1];
    }


    protected void SaveBTN_Click(object sender, EventArgs e)
    {
        // Check for existing user and update the changed fields
        User myUser;
        if (existingUser)
        {
            myUser = modelData.Users.Single(u => u.Username == username);
        }
        else
        {
            myUser = new User();
        }

        myUser.FName = fnameTB.Text;
        myUser.LName = lnameTB.Text;
        myUser.LineOfWork = ProfessionTB.Text;
        myUser.Website = WebsiteTB.Text;
        //myUser.AvatarPic = (string)Session["avatarPath"];
        myUser.AvatarPic = AvatarPic2.ImageUrl;
        myUser.Address = AddressTB.Text;
        myUser.City = CityTB.Text;
        myUser.State = StateTB.Text;
        myUser.Zip = ZipTB.Text;
        myUser.Country = CountryTB.Text;
        myUser.Phone = TelephoneTB.Text;
        myUser.Company = CompanyTB.Text;
        myUser.Username = username;
        DateTime joined = user.CreationDate;
        myUser.JoinedDate = user.CreationDate.ToLongDateString();
        //myUser.JoinedDate = DateTime.Today.Date.ToShortDateString();

        if (emailTB.Text == retypeEmailTB.Text)
        {
            myUser.Email = emailTB.Text;
        }
        if (DisplayEmailCB.Checked)
        {
            myUser.DisplayEmail = "no";
        }
        else
        {
            myUser.DisplayEmail = "yes";
        }
        if (MatureCB.Checked)
        {
            myUser.SeeMature = "yes";
        }
        else
        {
            myUser.SeeMature = "no";
        }
        if (checkRB.Checked)
        {
            myUser.PaymentMethod = "check";
        }
        if (paypalRB.Checked)
        {
            myUser.PaymentMethod = "PayPal";
        }

        try
       {
           if (!existingUser)
           {
               modelData.Users.InsertOnSubmit(myUser);
           }
           
           modelData.SubmitChanges();
           Response.Redirect("~/Default.aspx");
       }
       catch (Exception ex)
       {
           ErrorMessage.Text = "An error occured adding the profile information." + ex.Message;
       }
        
    }

}