using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;

public partial class Management_Submissions : System.Web.UI.Page
{
    ModelsDataContext modelData = new ModelsDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Hide the popup panels
        ConfirmPanel.Visible = false;
        ApprovedPanel.Visible = false;
        DeniedPanel.Visible = false;
    }


    /* Changes the text if the item has been approved */
    protected void ArtistRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void ArtistRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        HiddenField hiddenProdID = (HiddenField)e.Item.FindControl("HiddenProductID");
        LinkButton artistNameLBL = (LinkButton)e.Item.FindControl("artistNameLBL");
        Label subLBL = (Label)e.Item.FindControl("SubmissionLBL");
        Button approveRemoveBTN = (Button)e.Item.FindControl("ApproveSubBTN");
        Product myModel;
        if (e.CommandName == "View")
        {
            Session.Add("ProductID", hiddenProdID.Value);
            Response.Redirect("~/Preview.aspx");
        }
        else if (e.CommandName == "Approve")
        {
            Label SubmissionLBL = (Label)e.Item.FindControl("SubmissionLBL");
            ConfirmPanel.Visible = true;
            featuredModelLink.Text = artistNameLBL.Text;
            featuredArtistLink.Text = SubmissionLBL.Text;
        }
        else if (e.CommandName == "Download")
        {
            string modelPath = "~/uploads/" + subLBL.Text + "/" + artistNameLBL.Text;
            FileInfo fileInfo = new FileInfo(Server.MapPath(modelPath + ".zip"));
            downloadFile(fileInfo);
        }
        else if (e.CommandName == "Remove")
        {
            myModel = modelData.Products.Single(m => m.ProductID == Convert.ToInt32(hiddenProdID.Value));
            myModel.UnderReview = "No";
            try
            {
                modelData.SubmitChanges();
                Response.Redirect("~/Management/Submissions.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine("An exception occured adding the order." + ex.Message);
            }
        }
    }
    protected void YesBTN_Click(object sender, EventArgs e)
    {
        Product myModel;

        var query = from model in modelData.Products
                    join user in modelData.Users on model.UserID equals user.UserID
                    where model.Name == featuredModelLink.Text && user.Username == featuredArtistLink.Text
                    select model.ProductID;
        int prodID = query.Single();

        myModel = modelData.Products.Single(m => m.ProductID == prodID);
        myModel.Published = "Yes";
        myModel.PublishedDate = DateTime.Now;

        try
        {
            modelData.SubmitChanges();
        }
        catch (Exception ex)
        {
            Console.WriteLine("An exception occured adding the order." + ex.Message);
        }

        ApprovedPanel.Visible = true;
        ConfirmPanel.Visible = false;
        ApprovedModel.Text = featuredModelLink.Text;
        ApprovedArtist.Text = featuredArtistLink.Text;
    }

    /************************************************************
     * Emails the model submitter reasons why their model was declined.
     * **********************************************************/
    protected void EmailBTN_Click(object sender, EventArgs e)
    {
        String username = "info@sceneryswap.com";   // change to sceneryswap one
        String password = "forever11";               // change to sceneryswap one
        String host = "smtpout.secureserver.net";
        int port = 80;
        //string host = "smtp.gmail.com";             // change to sceneryswap one
        //int port = 587;                             // change to sceneryswap one
        
        // Get the email of the user
        //String toEmail = "Shellycya@msn.com";
        var query = from user in modelData.Users
                    where user.Username == featuredArtistLink.Text
                    select user.Email;
        string toEmail = query.Single();

        String header = "<span style='font-size: 1.2em;'><b style='color: #0070C0;'>" + DeniedModel.Text + "</b> by <b style='color: #E36C41;'>" + 
            DeniedArtist.Text + "</b></span><br/><br/>";
        header += "Did not meet the quality guidelines for the following reasons.<br/><br/>";
        String textBody = ReasonsTB.Text;
        textBody = textBody.Replace("\r", "<br />");
        textBody = "<div style='padding-left: 20px; font-size: small; font-weight: bold;'>" + textBody + "</div>";

        String signature = "<span style='color: #E36C41; font-family: Arial; font-size: 1.9em;'>Scenery Swap</span><br />";
        signature += "<b style='color: #808080;'>Your source for buying and selling 3D Art</b><br /><br />";
        signature += "<a href='http://www.sceneryswap.com'>http://www.sceneryswap.com</a><br />";
        signature += "<a href='mailto:info@sceneryswap.com'>info@sceneryswap.com</a> ";

        using (MailMessage message = new MailMessage())
        {
            message.From = new MailAddress(username);
            message.To.Add(new MailAddress(toEmail));
            message.CC.Add(new MailAddress("Shannon1242@hotmail.com"));
            message.Subject = "ScenerySwap model verification";
            message.IsBodyHtml = true;
            message.Body = "<html><body>" + header + textBody + "<br /><br />";
            message.Body += Body1.Text + "<a href='http://www.sceneryswap.com'>" + Body2.Text + "</a>"
                + Body3.Text + Body4.Text + Body5.Text + "<a href='http://www.sceneryswap.com'>" 
                + Body6.Text + "</a>" + Body7.Text + "<a href='mailto:info@sceneryswap.com'>info@sceneryswap.com</a> " 
                + Body8.Text + "<hr />"
                + signature + "</body></html>";
            SmtpClient client = new SmtpClient();
            client.Host = host;
            client.Port = port;
            //client.EnableSsl = true;
            client.Credentials = new NetworkCredential(username, password);
            client.Send(message);
        
        }


    }
    protected void NoBTN_Click(object sender, EventArgs e)
    {
        DeniedPanel.Visible = true;
        DeniedModel.Text = featuredModelLink.Text;
        Body4.Text = featuredModelLink.Text;
        DeniedArtist.Text = featuredArtistLink.Text;
    }

    protected void downloadFile(FileInfo fileInfo)
    {
        // Clear spaces from file name
        String filename = fileInfo.Name.Replace(' ', '_');
        Response.ClearContent();
        Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
        Response.AddHeader("Content-Length", fileInfo.Length.ToString());
        Response.ContentType = "application/zip";
        Response.Flush();
        Response.TransmitFile(fileInfo.FullName);

        //Response.End();
    }

    protected void ArtistRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label subLBL = (Label)e.Item.FindControl("DateSubmittedLBL");
        Button approveRemoveBTN = (Button)e.Item.FindControl("ApproveSubBTN");
        LinkButton modelName = (LinkButton)e.Item.FindControl("artistNameLBL");
        Label artistName = (Label)e.Item.FindControl("SubmissionLBL");

        var query = from model in modelData.Products
                    where model.Name == modelName.Text
                    select new
                    {
                        pub = model.Published,
                        pubdate = model.PublishedDate
                    };
        if (query.Count() > 0)
        {
            string published = Convert.ToString(query.ToList().ElementAt(0).pub);
            DateTime publishedDate = Convert.ToDateTime(query.ToList().ElementAt(0).pubdate);

            if (published == "Yes")
            {
                subLBL.Text = "Published " + Model.formatString(publishedDate);
                approveRemoveBTN.Text = "Remove From List";
                approveRemoveBTN.CommandName = "Remove";
            }
        }
    }
}