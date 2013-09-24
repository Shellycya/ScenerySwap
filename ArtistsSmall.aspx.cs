using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArtistsSmall : System.Web.UI.Page
{
    private int pageSize;
    private int artistNum;
    private int itemCount = 0;
    Object commandSource;
    ModelsDataContext modelData = new ModelsDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.LoadComplete += new EventHandler(Page_LoadComplete);

        // Find out the number of artists
        artistNum = (from user in modelData.Users
                     join product in modelData.Products on user.UserID equals product.UserID
                     select user.UserID).Distinct().Count();
        ArtistResultsLBL.Text = artistNum + " Results";

        if (ArtistPageDDL.SelectedValue != "All")
        {
            pageSize = Convert.ToInt32(ArtistPageDDL.SelectedValue);
        }
        else
        {
            pageSize = artistNum;
        }

        ItemsGet("");
    }

    private void ItemsGet(string artist)
    {
        //Array queryList = getSortQuery(SortDDL.SelectedValue);  //gets the query according to what the user selects from the drop down list

        PagedDataSource pagedData = new PagedDataSource();

        //pagedData.DataSource = SqlDataSource1Thumbs.SelectCommand;
        pagedData.DataSource = getSortQuery(artist);
        pagedData.AllowPaging = true;
        pagedData.PageSize = pageSize;

        // set the pagedatasource's current page
        pagedData.CurrentPageIndex = CurrentPage;


        lblCurrentPage.Text = (CurrentPage + 1).ToString() + " of "
                            + pagedData.PageCount.ToString();

        // Disable Prev or Next buttons if necessary
        artistCmdPrev.Enabled = !pagedData.IsFirstPage;
        artistCmdNext.Enabled = !pagedData.IsLastPage;

        ArtistRepeater.DataSource = pagedData;
        ArtistRepeater.DataBind();

    }

    protected Array getSortQuery(string value)
    {
        if (ArtistSortDDL.SelectedValue == "Small")
        {
            EnterArtistLBL.Text = "";
            var query = (from user in modelData.Users
                         join product in modelData.Products on user.UserID equals product.UserID
                         orderby user.Username
                         select new
                         {
                             Username = user.Username,
                             AvatarPic = user.AvatarPic,
                             JoinedDate = user.JoinedDate
                         }).Distinct();
            return query.ToArray();
        }
        else if (ArtistSortDDL.SelectedValue == "Artist")
        {
            // Prevents empty results
            if (ArtistSearchTB.Text == "")
            {
                EnterArtistLBL.Text = "Please enter an artist in the search box.";
            }
            else
            {
                EnterArtistLBL.Text = "";
            }
            var query = (from user in modelData.Users
                         join product in modelData.Products on user.UserID equals product.UserID
                         where user.Username == ArtistSearchTB.Text
                         orderby user.Username
                         select new
                         {
                             Username = user.Username,
                             AvatarPic = user.AvatarPic,
                             JoinedDate = user.JoinedDate
                         }).Distinct();
            return query.ToArray();
        }
        else if (ArtistSortDDL.SelectedValue == "Large")
        {
            Response.Redirect("~/Artists.aspx");
        }
        return null;
    }

    public int CurrentPage
    {
        get
        {
            // look for current page in ViewState
            object o = this.ViewState["_CurrentPage"];
            if (o == null)
                return 0; // default page index of 0
            else
                return (int)o;
        }

        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }

    protected void ArtistPageDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        ArtistSortDDL.SelectedValue = "Small";
        if (ArtistPageDDL.SelectedValue == "All")
        {
            pageSize = artistNum;
        }
        else
        {
            pageSize = Convert.ToInt32(ArtistPageDDL.SelectedValue);
        }
        ItemsGet("");
    }


    protected void artistCmdPrev_Click(object sender, ImageClickEventArgs e)
    {
        // Set viewstate variable to the previous page
        CurrentPage -= 1;

        // Reload control
        ItemsGet("");
    }
    protected void artistCmdNext_Click(object sender, ImageClickEventArgs e)
    {
        // Set viewstate variable to the next page
        CurrentPage += 1;

        // Reload control
        ItemsGet("");
    }
    protected void ArtistRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Panel background = (Panel)e.Item.FindControl("artistSmMin");
        Image artistAvatar = (Image)e.Item.FindControl("artistAvatar");
        Image artistNameBG = (Image)e.Item.FindControl("artistNameBG");
        Image artistDetailsBG = (Image)e.Item.FindControl("artistDetailsBG");
        LinkButton artistNameLBL = (LinkButton)e.Item.FindControl("artistNameLBL");
        Label dateJoinedLBL = (Label)e.Item.FindControl("dateJoinedLBL");
        Label SubmissionLBL = (Label)e.Item.FindControl("SubmissionLBL");
        LinkButton seeAllBTN = (LinkButton)e.Item.FindControl("seeAllBTN");
        Repeater InsideRepeater = (Repeater)e.Item.FindControl("InsideRepeater");

        if (e.CommandName == "ExpandsOrCloses")
        {
            for (int i = 0; i < artistNum; i++)
            {
                Button DetailsCloseBTN = (Button)e.Item.FindControl("button_" + i);
                if (DetailsCloseBTN == null)
                    continue;
                // Expand the artist section if the button says Details otherwise shrink it
                if (DetailsCloseBTN.Text == "Details")
                {
                    // Move the minimal pieces up
                    background.Attributes.Add("style", "margin-bottom:60px;");
                    artistDetailsBG.Visible = true;
                    seeAllBTN.Visible = true;
                    InsideRepeater.Visible = true;
                    DetailsCloseBTN.Text = "Close";
                    DetailsCloseBTN.Visible = false;
                }
                else
                {
                    artistDetailsBG.Visible = false;
                    seeAllBTN.Visible = false;
                    InsideRepeater.Visible = false;
                    DetailsCloseBTN.Text = "Details";
                    DetailsCloseBTN.Visible = true;
                }
            }

        }
        // set commandname for the buttons in artists.aspx, then check for that here
        Object type = e.CommandSource.GetType();
        commandSource = e.CommandSource;
        String buttonText = "";
        if (type.ToString() == "System.Web.UI.WebControls.Button")
        {
            Button clickedButton = (Button)e.CommandSource;
            buttonText = clickedButton.Text;
        }
        else if (type.ToString() == "System.Web.UI.WebControls.LinkButton")
        {
            LinkButton clickedButton = (LinkButton)e.CommandSource;
            buttonText = clickedButton.Text;
        }
        if (buttonText == artistNameLBL.Text || buttonText == seeAllBTN.Text)
        {
            Session.Add("MemberUser", artistNameLBL.Text);
            Response.Redirect("~/Member.aspx");

        }

    }

    protected void InsideRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Redirects to the Preview Page if info is clicked on a picture
        Image picImage = (Image)e.Item.FindControl("InsideArtistImage");
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

    protected void ArtistSearchBTN_Click(object sender, EventArgs e)
    {
        ArtistSortDDL.SelectedValue = "Artist";
        ItemsGet(ArtistSearchTB.Text);
    }

    protected void ArtistRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem == null)
            return;

        var item = e.Item.DataItem;

        var button = (Button)e.Item.FindControl("DetailsCloseBTN");
        button.ID = "button_" + itemCount++;
    }

}