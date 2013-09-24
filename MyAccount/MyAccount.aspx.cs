using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyAccount_MyAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PublishedRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        LinkButton artistNameLBL = (LinkButton)e.Item.FindControl("AccountArtist");
        HiddenField prodID = (HiddenField)e.Item.FindControl("HiddenProduct");

        if (e.CommandName == "ArtistName")
        {
            Session.Add("MemberUser", artistNameLBL.Text);
            Response.Redirect("~/Member.aspx");
        }
        if (e.CommandName == "ModelName")
        {
            Session.Add("ProductID", prodID.Value);
            Session.Add("PrevPage", "Categories");
            Response.Redirect("~/Preview.aspx");
        }
    }

    protected void SeeAllBTN_Click(object sender, EventArgs e)
    {
        if (SeeAllBTN.Text == "See All..")
        {
            PublishedDataSource1.SelectCommand = "SELECT DISTINCT [User].Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate,Product.ProductID FROM [User]" + 
                "INNER JOIN Product ON [User].UserID = Product.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID WHERE (Picture.PrimaryPic = N'yes')" + 
                "AND ([User].Username = @UserName) ORDER BY [User].Username";
            PublishedDataSource1.Select(DataSourceSelectArguments.Empty);
            PublishedDataSource1.DataBind();
            SeeAllBTN.Text = "See Less..";
        }
        else
        {
            PublishedDataSource1.SelectCommand = "SELECT DISTINCT TOP 3 [User].Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate,Product.ProductID FROM [User] INNER JOIN Product ON [User].UserID = Product.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID WHERE (Picture.PrimaryPic = N'yes') AND ([User].Username = @UserName) ORDER BY [User].Username";
            PublishedDataSource1.Select(DataSourceSelectArguments.Empty);
            PublishedDataSource1.DataBind();
            SeeAllBTN.Text = "See All..";
        }
    }
    protected void SeeAllBTN2_Click(object sender, EventArgs e)
    {
        if (SeeAllBTN2.Text == "See All..")
        {
            PurchasedDataSource1.SelectCommand = "SELECT DISTINCT User_1.Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate, Product.ProductID FROM (SELECT LineItem.ProductID FROM LineItem INNER JOIN Invoice ON LineItem.InvoiceNum = Invoice.InvoiceNum INNER JOIN [User] ON Invoice.UserID = [User].UserID WHERE ([User].Username = @UserName)) AS b INNER JOIN Product ON b.ProductID = Product.ProductID INNER JOIN [User] AS User_1 ON Product.UserID = User_1.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID WHERE (Picture.PrimaryPic = N'yes') ORDER BY User_1.Username";
            PurchasedDataSource1.Select(DataSourceSelectArguments.Empty);
            PurchasedDataSource1.DataBind();
            SeeAllBTN2.Text = "See Less..";
        }
        else
        {
            PurchasedDataSource1.SelectCommand = "SELECT DISTINCT TOP 3 User_1.Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate, Product.ProductID FROM (SELECT LineItem.ProductID FROM LineItem INNER JOIN Invoice ON LineItem.InvoiceNum = Invoice.InvoiceNum INNER JOIN [User] ON Invoice.UserID = [User].UserID WHERE ([User].Username = @UserName)) AS b INNER JOIN Product ON b.ProductID = Product.ProductID INNER JOIN [User] AS User_1 ON Product.UserID = User_1.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID WHERE (Picture.PrimaryPic = N'yes') ORDER BY User_1.Username";
            PurchasedDataSource1.Select(DataSourceSelectArguments.Empty);
            PurchasedDataSource1.DataBind();
            SeeAllBTN2.Text = "See All..";
        }
    }
    protected void PurchasedRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        LinkButton artistNameLBL = (LinkButton)e.Item.FindControl("AccountArtist");
        HiddenField prodID = (HiddenField)e.Item.FindControl("HiddenProduct");

        if (e.CommandName == "ArtistName")
        {
            Session.Add("MemberUser", artistNameLBL.Text);
            Response.Redirect("~/Member.aspx");
        }
        if (e.CommandName == "ModelName")
        {
            Session.Add("ProductID", prodID.Value);
            Session.Add("PrevPage", "Categories");
            Response.Redirect("~/Preview.aspx");
        }
    }
}