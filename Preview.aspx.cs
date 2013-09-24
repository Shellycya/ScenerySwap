using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.Security;
using System.Collections;

public partial class Preview : System.Web.UI.Page
{
    ModelsDataContext modelData = new ModelsDataContext();
    private Model selectedModel;
    int defaultImgWidth = 113;
    int defaultImgHeight = 111;
    int defaultSmlThumb = 70;
    int productID;

    // Product IDs of related products
    private int moreFrom1ID;
    private int moreFrom2ID;
    private int moreFrom3ID;
    private int moreFrom4ID;
    private int moreFrom5ID;
    private int related1ID;
    private int related2ID;
    private int related3ID;
    private int related4ID;
    private int related5ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        productID = Convert.ToInt32(Session["ProductID"]);
        //string productID = "4";

        var query1 = from user in modelData.Users 
                     join product in modelData.Products on user.UserID equals product.UserID 
                     join picture in modelData.Pictures on product.ProductID equals picture.ProductID
                     where product.ProductID == Convert.ToInt32(productID)
                     select new
                     {
                         uName = user.Username,
                         oProgram = product.OrigProgram,
                         prodPrice = product.Price,
                         gReady = product.GameReady,
                         pubDate = product.PublishedDate,
                         prodName = product.Name,
                         path = picture.ImagePath,
                         types = product.Extension
                     };
        
        var query2 = from g in modelData.Genres
                     join product in modelData.Products on g.GenreID equals product.GenreID
                     join t in modelData.Tags on product.ProductID equals t.ProductID
                     where product.ProductID == Convert.ToInt32(productID)
                     select new
                     {
                         gName = g.LongName,
                         tagGroup = t.TagName
                     };

        //values from the database
        string username = query1.ToList().ElementAt(0).uName;
        string genre = query2.ToList().ElementAt(0).gName;
        string origProgram = query1.ToList().ElementAt(0).oProgram;
        decimal decPrice = query1.ToList().ElementAt(0).prodPrice;
        string price = Convert.ToString(query1.ToList().ElementAt(0).prodPrice);
        string gameReady = query1.ToList().ElementAt(0).gReady;
        DateTime publishedDate = Convert.ToDateTime(query1.ToList().ElementAt(0).pubDate);
        string modelName = query1.ToList().ElementAt(0).prodName;

        string prevPage = (string)Session["PrevPage"];
       
        string fullImagePath = query1.ToList().ElementAt(0).path;
        string imagePath = fullImagePath.Substring(0, fullImagePath.LastIndexOf('/')+1); 
        string tags = "";
        string extTypes = query1.ToList().ElementAt(0).types;
        for (int i = 0; i < query2.Count(); i++) {
            tags += query2.ToList().ElementAt(i).tagGroup + " ";
        }


        selectedModel = getSelectedModel(productID, publishedDate, "Stand Alone License", decPrice, modelName, extTypes, username, fullImagePath, 1);

        //Populate the labels
        GenreLBL.Text = genre;
        GenreLBL2.Text = genre;
        ProgramLink.Text = origProgram;
        UserLink.Text = username;
        ModelPriceLBL.Text = "$" + price;
        TagsLBL.Text = tags;
        HiddenProductID.Value = Convert.ToString(productID);
        MoreFromLNK.Text = username;
        if (gameReady == "yes")
            ModelTypeLBL.Text = "Game Models -";
        else
            ModelTypeLBL.Text = "High Resolution Models -";
        

        // Any necessary loading methods
        hideImages();
        populateThumbs(imagePath);
        loadDescription();
        loadPicsFromSameUser();
        loadRelatedPics();
        disableButtons(prevPage);
    }

    protected void populateThumbs(string imgPath)
    {

        //string imgPath = (string)Session["imgPath"];
        //string imgPath = "~/uploads/Shellycya/Clown Fish/";
        //string[] files = Directory.GetFiles(Server.MapPath(imgPath));
        List<string> files = new List<string>(Directory.GetFiles(Server.MapPath(imgPath)));
        int picCount = 0;
        for (int i = 0; i < files.Count; i++)
        {
            string newPath = files.ElementAt(i);
            // Ignore thumbs.db files
            if (!newPath.Contains(".db"))
            {
                int start = newPath.LastIndexOf('\\') + 1;
                int end = files[i].Length - start;
                string fileName = newPath.Substring(start, end);
                newPath = imgPath + fileName;
                if (picCount == 0) { resizeThumbs(Thumbnail1, Background1, newPath); }
                if (picCount == 1) { resizeThumbs(Thumbnail2, Background2, newPath); }
                if (picCount == 2) { resizeThumbs(Thumbnail3, Background3, newPath); }
                if (picCount == 3) { resizeThumbs(Thumbnail4, Background4, newPath); }
                if (picCount == 4) { resizeThumbs(Thumbnail5, Background5, newPath); }
                if (picCount == 5) { resizeThumbs(Thumbnail6, Background6, newPath); }
                if (picCount == 6) { resizeThumbs(Thumbnail7, Background7, newPath); }
                if (picCount == 7) { resizeThumbs(Thumbnail8, Background8, newPath); }
                if (picCount == 8) { resizeThumbs(Thumbnail9, Background9, newPath); }
                if (picCount == 9) { resizeThumbs(Thumbnail10, Background10, newPath); }
                if (picCount == 10) { resizeThumbs(Thumbnail11, Background11, newPath); }
                if (picCount == 11) { resizeThumbs(Thumbnail12, Background12, newPath); }
                if (picCount == 12) { resizeThumbs(Thumbnail13, Background13, newPath); }
                if (picCount == 13) { resizeThumbs(Thumbnail14, Background14, newPath); }
                if (picCount == 14) { resizeThumbs(Thumbnail15, Background15, newPath); }
                picCount++;
            }
        }
    }

    // Resizes the images to the default image size
    protected void resizeThumbs(HyperLink img, Image back, string url)
    {
        img.NavigateUrl = url;
        img.Visible = true;
        back.Visible = true;

        //Resize image
        HtmlImage newimg = new HtmlImage();
        newimg.Src = url;
        newimg.Width = defaultImgWidth;
        newimg.Height = defaultImgHeight;
        img.Controls.Add(newimg);
    }

    protected void hideImages()
    {
        Thumbnail1.Visible = false;                 
        Thumbnail2.Visible = false;
        Thumbnail3.Visible = false;
        Thumbnail4.Visible = false;
        Thumbnail5.Visible = false;
        Thumbnail6.Visible = false;
        Thumbnail7.Visible = false;
        Thumbnail8.Visible = false;
        Thumbnail9.Visible = false;
        Thumbnail10.Visible = false;
        Thumbnail11.Visible = false;
        Thumbnail12.Visible = false;
        Thumbnail13.Visible = false;
        Thumbnail14.Visible = false;
        Thumbnail15.Visible = false;

        Background1.Visible = false;
        Background2.Visible = false;
        Background3.Visible = false;
        Background4.Visible = false;
        Background5.Visible = false;
        Background6.Visible = false;
        Background7.Visible = false;
        Background8.Visible = false;
        Background9.Visible = false;
        Background10.Visible = false;
        Background11.Visible = false;
        Background12.Visible = false;
        Background13.Visible = false;
        Background14.Visible = false;
        Background15.Visible = false;

        MoreFromIMG1.Visible = false;
        MoreFromIMG2.Visible = false;
        MoreFromIMG3.Visible = false;
        MoreFromIMG4.Visible = false;
        MoreFromIMG5.Visible = false;
        RelatedIMG1.Visible = false;
        RelatedIMG2.Visible = false;
        RelatedIMG3.Visible = false;
        RelatedIMG4.Visible = false;
        RelatedIMG5.Visible = false;

        PriceLBL1.Visible = false;
        PriceLBL2.Visible = false;
        PriceLBL3.Visible = false;
        PriceLBL4.Visible = false;
        PriceLBL5.Visible = false;
        RPriceLBL1.Visible = false;
        RPriceLBL2.Visible = false;
        RPriceLBL3.Visible = false;
        RPriceLBL4.Visible = false;
        RPriceLBL5.Visible = false;
    }

    protected void loadDescription()
    {
        int hiddenID = Convert.ToInt32(HiddenProductID.Value);

        var query = from product in modelData.Products
                    where product.ProductID == hiddenID
                    select product.Description;
        string desc = query.Single();
        PreviewMTB.Text = desc;
    }

    protected void loadPicsFromSameUser()
    {
        var query = from picture in modelData.Pictures
                    join product in modelData.Products on picture.ProductID equals product.ProductID   
                    join user in modelData.Users on product.UserID equals user.UserID
                    where user.Username == MoreFromLNK.Text && picture.PrimaryPic == "yes"
                    orderby product.PublishedDate descending
                    select new
                    {
                        myPic = picture.Pic,
                        picName = picture.PictureName,
                        price = product.Price,
                        path = picture.ImagePath,
                        prodID = product.ProductID
                    };
        
        for (int i = 0; i < query.Count(); i++)
        {
            //System.Data.Linq.Binary picBytes = query.ToList().ElementAt(i).myPic;
            string name = query.ToList().ElementAt(i).picName;
            decimal price = query.ToList().ElementAt(i).price;
            string imgPath = query.ToList().ElementAt(i).path;
            int prodID = query.ToList().ElementAt(i).prodID;

            if (i == 0) { resizeThumbs(MoreFromIMG1, imgPath, PriceLBL1); PriceLBL1.Text = "$" + price.ToString(); moreFrom1ID = prodID; }
            if (i == 1) { resizeThumbs(MoreFromIMG2, imgPath, PriceLBL2); PriceLBL2.Text = "$" + price.ToString(); moreFrom2ID = prodID; }
            if (i == 2) { resizeThumbs(MoreFromIMG3, imgPath, PriceLBL3); PriceLBL3.Text = "$" + price.ToString(); moreFrom3ID = prodID; }
            if (i == 3) { resizeThumbs(MoreFromIMG4, imgPath, PriceLBL4); PriceLBL4.Text = "$" + price.ToString(); moreFrom4ID = prodID; }
            if (i == 4) { resizeThumbs(MoreFromIMG5, imgPath, PriceLBL5); PriceLBL5.Text = "$" + price.ToString(); moreFrom5ID = prodID; }
        }
        
    }

    protected void loadRelatedPics()
    {
        var query = from picture in modelData.Pictures
                    join product in modelData.Products on picture.ProductID equals product.ProductID
                    join thisGenre in modelData.Genres on product.GenreID equals thisGenre.GenreID
                    where thisGenre.LongName == GenreLBL.Text && picture.PrimaryPic == "yes" && product.ProductID != Convert.ToInt32(productID)
                    orderby product.PublishedDate descending
                    select new
                    {
                        myPic = picture.Pic,
                        price = product.Price,
                        path = picture.ImagePath,
                        prodID = product.ProductID
                    };

        for (int i = 0; i < query.Count(); i++)
        {
            decimal price = query.ToList().ElementAt(i).price;
            string imgPath = query.ToList().ElementAt(i).path;
            int prodID = query.ToList().ElementAt(i).prodID;

            if (i == 0) { resizeThumbs(RelatedIMG1, imgPath, RPriceLBL1); RPriceLBL1.Text = "$" + price.ToString(); related1ID = prodID; }
            if (i == 1) { resizeThumbs(RelatedIMG2, imgPath, RPriceLBL2); RPriceLBL2.Text = "$" + price.ToString(); related2ID = prodID; }
            if (i == 2) { resizeThumbs(RelatedIMG3, imgPath, RPriceLBL3); RPriceLBL3.Text = "$" + price.ToString(); related3ID = prodID; }
            if (i == 3) { resizeThumbs(RelatedIMG4, imgPath, RPriceLBL4); RPriceLBL4.Text = "$" + price.ToString(); related4ID = prodID; }
            if (i == 4) { resizeThumbs(RelatedIMG5, imgPath, RPriceLBL5); RPriceLBL5.Text = "$" + price.ToString(); related5ID = prodID; }
        }
    }

    protected void resizeThumbs(Image img, string url, Label lbl)
    {
        img.ImageUrl = url;
        img.Width = defaultSmlThumb;
        img.Height = defaultSmlThumb;
        img.Visible = true;
        lbl.Visible = true;
    }




    protected void PublishBTN_Click(object sender, EventArgs e)
    {
        // Confirm product published to the database
        modelData = new ModelsDataContext();
        Product thisProduct = modelData.Products.Single(p => p.ProductID == Convert.ToInt32(HiddenProductID.Value));

        thisProduct.Published = "No";
        try
        {
            //modelData.SubmitChanges();
            Response.Redirect("~/MyAccount/Upload.aspx");
        }
        catch (Exception ex)
        {
            ErrorMessage.Text = "An exception occured publishing the order.<br />" + ex.Message;
        }

        /*var query = from product in modelData.Products
                    where product.ProductID == Convert.ToInt32(HiddenProductID.Value)
                    select product;

        thisProduct.Published = query.ToList().ElementAt(0).Published;
        // thisProduct = (Product)query;
        thisProduct.Published = "yes";

        try
        {
            modelData.Products.InsertOnSubmit(thisProduct);
            modelData.SubmitChanges();
        }
        catch (Exception ex)
        {
            ErrorMessage.Text = "An exception occured publishing the order." + ex.Message;
        }*/
        
    }

    // Disables and hides buttons depending on the page it came from
    protected void disableButtons(string prevPage)
    {
        if (prevPage == "Upload")
        {
            CartBTN.Enabled = false;
        }
        else
        {
            EditBTN.Visible = false;
            PublishBTN.Visible = false;
        }
    }

    private Model getSelectedModel(int productID, DateTime date, string pType, decimal price, 
                                   string modelName, string ext, string username, string imgPath, int quantity)
    {
        Model m = new Model();
        m.ProductID = productID;
        m.Date = date;
        m.PriceType = pType;
        m.Price = price;
        m.Name = modelName;
        m.Extension = ext;
        m.UserName = username;
        m.ImgPath = imgPath;
        m.Quantity = quantity;

        return m;
    }



    private void AddToCart(Model model)
    {
        ArrayList cart = this.GetCart();
        ArrayList modelCart = this.GetModelCart();
        DateTime date = model.Date;
        String dateString = date.ToString("MMMM") + " " + date.Day + ", " + date.Year;
        string formatPrice = "$" + String.Format("{0:0.00}", model.Price);
        decimal subtotal = 0;
        
        cart.Add(new { productID = model.ProductID, date = dateString, license = model.PriceType, name = model.Name,
                       exts = model.Extension, username = model.UserName, price = formatPrice, imgPath = model.ImgPath, quantity = 1});

        modelCart.Add(model);

        if (Session["Subtotal"] == null)
        {
            Session.Add("Subtotal", model.Price);
        }
        else
        {
            subtotal = (decimal)Session["Subtotal"];
            subtotal += model.Price;
            Session.Add("Subtotal", subtotal);
        }
       
    }

    private ArrayList GetModelCart()
    {
        if (Session["ModelCart"] == null)
            Session.Add("ModelCart", new ArrayList());
        return (ArrayList)Session["ModelCart"];
    }

    private ArrayList GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new ArrayList());
        return (ArrayList)Session["Cart"];
    }

    protected void CartBTN_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CartItem item = new CartItem();
            item.Model = selectedModel;
            item.Quantity = 1;
            //this.AddToCart(item);
            this.AddToCart(selectedModel);
            Response.Redirect("~/MyAccount/Cart.aspx");
        }
    }

    protected void MoreFromIMG1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(moreFrom1ID)); 
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void MoreFromIMG2_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(moreFrom2ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void MoreFromIMG3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(moreFrom3ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void MoreFromIMG4_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(moreFrom4ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void MoreFromIMG5_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(moreFrom5ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void RelatedIMG1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(related1ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void RelatedIMG2_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(related2ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void RelatedIMG3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(related3ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void RelatedIMG4_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(related4ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void RelatedIMG5_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ProductID", Convert.ToString(related5ID));
        Session.Add("PrevPage", "Preview");
        Response.Redirect("~/Preview.aspx");
    }
    protected void MoreFromLNK_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", MoreFromLNK.Text);
        Response.Redirect("~/Member.aspx");
    }
    protected void UserLink_Click(object sender, EventArgs e)
    {
        Session.Add("MemberUser", UserLink.Text);
        Response.Redirect("~/Member.aspx");
    }
}