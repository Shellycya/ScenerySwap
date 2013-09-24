using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Featured : System.Web.UI.Page
{
    string[] artists = { "Shellycya", "Darlene", "DaSkooz", "GrandpaPaul" };
    ModelsDataContext modelData = new ModelsDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        loadArtists();
        getInitial(artists[0]);
        loadDefaultInfo();
        String test = "";
        
        // Test code here
    }

    /*
     * Load the info from the query into the hidden fields so the javascript hover.js can use it.
     * */
    private void loadDefaultInfo()
    {
        for (int i = 0; i < artists.Length; i++)
        {
            var query = (from user in modelData.Users
                     join product in modelData.Products on user.UserID equals product.UserID
                     join pic in modelData.Pictures on product.ProductID equals pic.ProductID
                     join genre in modelData.Genres on product.GenreID equals genre.GenreID
                     where user.Username == artists[i] && pic.PrimaryPic == "yes"
                     orderby product.PublishedDate descending
                     select new
                     {
                         mainPic = pic.ImagePath,
                         price = product.Price,
                         name = product.FileName,
                         artist = user.Username,
                         genre = genre.ShortName,
                         model = product.Name
                     }).Take(3).ToArray();
            
            // Load the info so the most recent model is on the left
            if (i == 0)
            {
                if (query.Length == 1)
                {
                    HiddenModel11.Text = query[0].model;
                    HiddenURL11.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre11.Text = query[0].genre;
                }
                if (query.Length == 2)
                {
                    HiddenModel11.Text = query[0].model;
                    HiddenURL11.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre11.Text = query[0].genre;
                
                    HiddenModel12.Text = query[1].model;
                    HiddenURL12.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre12.Text = query[1].genre;
                }
                if (query.Length >= 3)
                {
                    HiddenModel11.Text = query[0].model;
                    HiddenURL11.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre11.Text = query[0].genre;

                    HiddenModel12.Text = query[1].model;
                    HiddenURL12.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre12.Text = query[1].genre;

                    HiddenModel13.Text = query[2].model;
                    HiddenURL13.Text = query[2].mainPic.Substring(2, query[2].mainPic.Length - 2);
                    HiddenGenre13.Text = query[2].genre;
                }

            }
            if (i == 1)
            {
                if (query.Length == 1)
                {
                    HiddenModel21.Text = query[0].model;
                    HiddenURL21.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre21.Text = query[0].genre;
                }
                if (query.Length == 2)
                {
                    HiddenModel21.Text = query[0].model;
                    HiddenURL21.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre21.Text = query[0].genre;

                    HiddenModel22.Text = query[1].model;
                    HiddenURL22.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre22.Text = query[1].genre;
                }
                if (query.Length >= 3)
                {
                    HiddenModel21.Text = query[0].model;
                    HiddenURL21.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre21.Text = query[0].genre;

                    HiddenModel22.Text = query[1].model;
                    HiddenURL22.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre22.Text = query[1].genre;

                    HiddenModel23.Text = query[2].model;
                    HiddenURL23.Text = query[2].mainPic.Substring(2, query[2].mainPic.Length - 2);
                    HiddenGenre23.Text = query[2].genre;
                } 
            }
            if (i == 2)
            {
                if (query.Length == 1)
                {
                    HiddenModel31.Text = query[0].model;
                    HiddenURL31.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre31.Text = query[0].genre;
                }
                if (query.Length == 2)
                {
                    HiddenModel31.Text = query[0].model;
                    HiddenURL31.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre31.Text = query[0].genre;

                    HiddenModel32.Text = query[1].model;
                    HiddenURL32.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre32.Text = query[1].genre;
                }
                if (query.Length >= 3)
                {
                    HiddenModel31.Text = query[0].model;
                    HiddenURL31.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre31.Text = query[0].genre;

                    HiddenModel32.Text = query[1].model;
                    HiddenURL32.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre32.Text = query[1].genre;

                    HiddenModel33.Text = query[2].model;
                    HiddenURL33.Text = query[2].mainPic.Substring(2, query[2].mainPic.Length - 2);
                    HiddenGenre33.Text = query[2].genre;
                }
            }
            if (i == 3)
            {
                if (query.Length == 1)
                {
                    HiddenModel41.Text = query[0].model;
                    HiddenURL41.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre41.Text = query[0].genre;
                }
                if (query.Length == 2)
                {
                    HiddenModel41.Text = query[0].model;
                    HiddenURL41.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre41.Text = query[0].genre;

                    HiddenModel42.Text = query[1].model;
                    HiddenURL42.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre42.Text = query[1].genre;
                }
                if (query.Length >= 3)
                {
                    HiddenModel41.Text = query[0].model;
                    HiddenURL41.Text = query[0].mainPic.Substring(2, query[0].mainPic.Length - 2);
                    HiddenGenre41.Text = query[0].genre;

                    HiddenModel42.Text = query[1].model;
                    HiddenURL42.Text = query[1].mainPic.Substring(2, query[1].mainPic.Length - 2);
                    HiddenGenre42.Text = query[1].genre;

                    HiddenModel43.Text = query[2].model;
                    HiddenURL43.Text = query[2].mainPic.Substring(2, query[2].mainPic.Length - 2);
                    HiddenGenre43.Text = query[2].genre;
                }  
            }
        }
    }

    private void getInitial(string artistName)
    {
        var query = (from user in modelData.Users
                     join product in modelData.Products on user.UserID equals product.UserID
                     join pic in modelData.Pictures on product.ProductID equals pic.ProductID
                     join genre in modelData.Genres on product.GenreID equals genre.GenreID
                     where user.Username == artistName && pic.PrimaryPic == "yes"
                     orderby product.PublishedDate descending
                     select new
                     {
                         mainPic = pic.ImagePath,
                         price = product.Price,
                         name = product.FileName,
                         artist = user.Username,
                         genre = genre.ShortName,
                         model = product.Name
                     }).Take(3).ToArray();

        featuredModelLink.Text = query[0].model;
        FloatModel.Text = query[0].model;
        featuredArtistLink.Text = query[0].artist;
        FloatArtist.Text = query[0].artist;
        FeaturedIMG.ImageUrl = query[0].mainPic;
        FloatSection.Text = query[0].genre;
    }

    private void loadArtists()
    {
        String avatarPic = "";
        FeatArtistLBL1.Text = artists[0];
        FeatArtistLBL2.Text = artists[1];
        FeatArtistLBL3.Text = artists[2];
        FeatArtistLBL4.Text = artists[3];
        for (int i = 0; i < artists.Length; i++)
        {
            var query = from user in modelData.Users
                         where user.Username == artists[i]
                         select new 
                         { 
                             avatar = user.AvatarPic 
                         } ;
            avatarPic = Convert.ToString(query.ToList().ElementAt(0).avatar);
            if (i == 0) { 
                AvatarImage1.ImageUrl = avatarPic;
                FeatRepeater1.DataSource = getModels(artists[i]);
                FeatRepeater1.DataBind();
            }
            if (i == 1) { 
                AvatarImage2.ImageUrl = avatarPic;
                FeatRepeater2.DataSource = getModels(artists[i]);
                FeatRepeater2.DataBind();
            }
            if (i == 2) { 
                AvatarImage3.ImageUrl = avatarPic;
                FeatRepeater3.DataSource = getModels(artists[i]);
                FeatRepeater3.DataBind();
            }
            if (i == 3) { 
                AvatarImage4.ImageUrl = avatarPic;
                FeatRepeater4.DataSource = getModels(artists[i]);
                FeatRepeater4.DataBind();
            }
        }
    }

    private Object getModels(string artistName)
    {
        string[] modelPics = new string[3];
        var query = (from user in modelData.Users
                     join product in modelData.Products on user.UserID equals product.UserID
                     join pic in modelData.Pictures on product.ProductID equals pic.ProductID
                     where user.Username == artistName && pic.PrimaryPic == "yes"
                     orderby product.PublishedDate descending
                     select new
                     {
                         mainPic = pic.ImagePath,
                         price = product.Price,
                         name = product.FileName
                     }).Take(3).ToArray();

        return query;
    }

    protected void ArtistSearchBTN_Click(object sender, EventArgs e)
    {
        
    }
    protected void ProfileLink1_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[0]);
        Response.Redirect("~/Member.aspx");
    }
    protected void ProfileLink2_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[1]);
        Response.Redirect("~/Member.aspx");
    }
    protected void ProfileLink3_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[2]);
        Response.Redirect("~/Member.aspx");
    }
    protected void ProfileLink4_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[3]);
        Response.Redirect("~/Member.aspx");
    }

    protected void SeeBTN1_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[0]);
        Response.Redirect("~/Member.aspx");
    }
    protected void SeeBTN2_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[1]);
        Response.Redirect("~/Member.aspx");
    }
    protected void SeeBTN3_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[2]);
        Response.Redirect("~/Member.aspx");
    }
    protected void SeeBTN4_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", artists[3]);
        Response.Redirect("~/Member.aspx");
    }

    protected void FeatRepeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem == null)
            return;

        var item = e.Item.DataItem;

        Image image = (Image)e.Item.FindControl("InsideArtistImage");
        String id = image.ClientID;

        if (id.Contains("FeatRepeater1_InsideArtistImage_0")) { image.Attributes.Add("onMouseOver", "hover11()"); }
        else if (id.Contains("FeatRepeater1_InsideArtistImage_1")) { image.Attributes.Add("onMouseOver", "hover12()"); }
        else if (id.Contains("FeatRepeater1_InsideArtistImage_2")) { image.Attributes.Add("onMouseOver", "hover13()"); }
        
    }
    protected void FeatRepeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem == null)
            return;

        var item = e.Item.DataItem;

        Image image = (Image)e.Item.FindControl("InsideArtistImage");
        String id = image.ClientID;

        if (id.Contains("FeatRepeater2_InsideArtistImage_0")) { image.Attributes.Add("onMouseOver", "hover21()"); }
        else if (id.Contains("FeatRepeater2_InsideArtistImage_1")) { image.Attributes.Add("onMouseOver", "hover22()"); }
        else if (id.Contains("FeatRepeater2_InsideArtistImage_2")) { image.Attributes.Add("onMouseOver", "hover23()"); }
    }
    protected void FeatRepeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem == null)
            return;

        var item = e.Item.DataItem;

        Image image = (Image)e.Item.FindControl("InsideArtistImage");
        String id = image.ClientID;

        if (id.Contains("FeatRepeater3_InsideArtistImage_0")) { image.Attributes.Add("onMouseOver", "hover31()"); }
        else if (id.Contains("FeatRepeater3_InsideArtistImage_1")) { image.Attributes.Add("onMouseOver", "hover32()"); }
        else if (id.Contains("FeatRepeater3_InsideArtistImage_2")) { image.Attributes.Add("onMouseOver", "hover33()"); }
    }
    protected void FeatRepeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.DataItem == null)
            return;

        var item = e.Item.DataItem;

        Image image = (Image)e.Item.FindControl("InsideArtistImage");
        String id = image.ClientID;

        if (id.Contains("FeatRepeater4_InsideArtistImage_0")) { image.Attributes.Add("onMouseOver", "hover41()"); }
        else if (id.Contains("FeatRepeater4_InsideArtistImage_1")) { image.Attributes.Add("onMouseOver", "hover42()"); }
        else if (id.Contains("FeatRepeater4_InsideArtistImage_2")) { image.Attributes.Add("onMouseOver", "hover43()"); }
    }
    protected void FloatArtistBTN_Click(object sender, EventArgs e)
    {
        String hiddenArtist = Request.Form["HiddenArtist"];
        // Use the original artist for the first time the page is loaded.
        if (hiddenArtist == "")
        {
            hiddenArtist = FloatArtist.Text;
        }
        Session.Add("MemberUser", hiddenArtist);
        Response.Redirect("~/Member.aspx");
    }
    protected void FloatModelBTN_Click(object sender, EventArgs e)
    {
        String hiddenModel = Request.Form["HiddenModel"];
        // Use the original model for the first time the page is loaded.
        if (hiddenModel == "")
        {
            hiddenModel = FloatModel.Text;
        }
        var query = from product in modelData.Products
                    where product.Name == hiddenModel
                    select new
                    {
                        pID = product.ProductID
                    };

        int pID = query.ToList().ElementAt(0).pID;

        Session.Add("ProductID", Convert.ToString(pID));
        Response.Redirect("~/Preview.aspx");
    }
    protected void FloatSectionBTN_Click(object sender, EventArgs e)
    {
        String hiddenSection = Request.Form["HiddenGenre"];
        // Use the original section for the first time the page is loaded.
        if (hiddenSection == "")
        {
            hiddenSection = FloatSection.Text;
        }
        Session.Add("Category", hiddenSection);
        Session.Add("ModelType", "");
        Response.Redirect("~/Categories.aspx");
    }
}

