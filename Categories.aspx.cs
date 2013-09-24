using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Categories : System.Web.UI.Page
{
    private string modelType;
    private string category;
    private string[] terms;
    private string searchterms;
    private int defaultPageSize = 24;
    private int pageSize;
    ModelsDataContext modelData = new ModelsDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            modelType = (string)Session["ModelType"];
            category = (string)Session["Category"];
            searchterms = (string)Session["SearchTerms"];
            String prevPage = (string)Session["PrevPage"];
            if (prevPage == "Default")
            {
                Session.Remove("SearchTerms");
                searchterms = null;
            }
            if (searchterms != null) terms = searchterms.Split(' ');

            int resultNum = getResultNum();

            //Headers
            CategoryLBL.Text = modelType + " - " + category;
            if (resultNum == 0)
            {
                hidePageSort();
                ResultsLBL.Text = getResultNum() + " Results";
            }
            else if (resultNum == 1)
                ResultsLBL.Text = getResultNum() + " Result";
            else
                ResultsLBL.Text = getResultNum() + " Results";

            if (searchterms != null)
            {
                SetArtistSearchDataSource();
                pageSize = Convert.ToInt32(PageDDL.SelectedValue);
            }
            else
            {
                SetArtistDataSource();
                HiddenCategory.Value = category;
            }

            pageSize = Convert.ToInt32(PageDDL.SelectedValue);
            setContainerSize(pageSize, getResultNum());
            ItemsGet();
        //}
    }

    private void setContainerSize(int pageSize, int resultNum)
    {
        if (pageSize <= 5 || resultNum <= 5) ProductContainer.Style.Add("height", "400px");
    }

    private void hidePageSort()
    {
        //Show no results and hide filter header
        NoResultsLBL.Text = "No Results Found";
        BarIMG.Visible = false;
        SortbyLBL.Visible = false;
        SortDDL.Visible = false;
        ItemsLBL.Visible = false;
        PageDDL.Visible = false;
        cmdPrev.Visible = false;
        cmdNext.Visible = false;
        lblCurrentPage.Visible = false;
    }

    private void viewPageSort()
    {
        NoResultsLBL.Text = "";
        BarIMG.Visible = true;
        SortbyLBL.Visible = true;
        SortDDL.Visible = true;
        ItemsLBL.Visible = true;
        PageDDL.Visible = true;
        cmdPrev.Visible = true;
        cmdNext.Visible = true;
        lblCurrentPage.Visible = true;
    }

    private void SetArtistSearchDataSource()
    {
        var overallQuery = (from u in modelData.Users
                            where u.Username == ""
                            select new
                            {
                                Username = u.Username,
                                AvatarPic = u.AvatarPic
                            }).Distinct();

        foreach (var item in terms)
        {
            // Search category
            var categoryQuery = (from genre in modelData.Genres
                                 join product in modelData.Products on genre.GenreID equals product.GenreID
                                 join u in modelData.Users on product.UserID equals u.UserID
                                 where genre.LongName == item
                                 select new
                                 {
                                     Username = u.Username,
                                     AvatarPic = u.AvatarPic
                                 }).Distinct();
            if (categoryQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(categoryQuery);
            }

            // Search artist
            var artistQuery = (from u in modelData.Users
                                 where u.Username == item
                                 select new
                                 {
                                     Username = u.Username,
                                     AvatarPic = u.AvatarPic
                                 }).Distinct();
            if (artistQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(artistQuery);
            }

            // Search tags
            var tagQuery = (from t in modelData.Tags
                                 join product in modelData.Products on t.ProductID equals product.ProductID
                                 join u in modelData.Users on product.UserID equals u.UserID
                                 where t.TagName.Contains(item)
                                 select new
                                 {
                                     Username = u.Username,
                                     AvatarPic = u.AvatarPic
                                 }).Distinct();
            if (tagQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(tagQuery);
            }

            // Search Program 
            var programQuery = (from p in modelData.Products
                                join u in modelData.Users on p.UserID equals u.UserID
                                where p.OrigProgram.Contains(item)
                                select new
                                {
                                    Username = u.Username,
                                    AvatarPic = u.AvatarPic
                                }).Distinct();
            if (programQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(programQuery);
            }
        }
        GridView1.DataSource = overallQuery;
        GridView1.DataBind();
    }

    private void SetArtistDataSource()
    {
        string type = getModelType();

        if (type != "")
        {
            var query = (from u in modelData.Users
                         join product in modelData.Products on u.UserID equals product.UserID
                         join genre in modelData.Genres on product.GenreID equals genre.GenreID
                         where product.MediaType == type && genre.LongName == category
                         select new
                         {
                             Username = u.Username,
                             AvatarPic = u.AvatarPic
                         }).Distinct();
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        else
        {
            var query = (from u in modelData.Users
                         join product in modelData.Products on u.UserID equals product.UserID
                         join genre in modelData.Genres on product.GenreID equals genre.GenreID
                         where genre.LongName == category
                         select new
                         {
                             Username = u.Username,
                             AvatarPic = u.AvatarPic
                         }).Distinct();
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }

    protected string getModelType()
    {
        string type = "";
        if (modelType == "High Resolution Models")
        {
            type = "Hi Res";
            HiddenModelType.Value = type;
        }
        else if (modelType == "Game Models")
        {
            type = "Game";
            HiddenModelType.Value = type;
        }
        else
        {
            HiddenModelType.Value = type;
        }
        return type;

    }

    protected int getResultNum()
    {
        string type = getModelType();

        if (type != "")
        {
            var query = from product in modelData.Products
                        join genre in modelData.Genres on
                            product.GenreID equals genre.GenreID
                        where product.MediaType == type && genre.LongName == category
                        select product.UserID;
            return query.Count();
        }
        else
        {
            var query = from product in modelData.Products
                    join genre in modelData.Genres on
                        product.GenreID equals genre.GenreID
                    where genre.LongName == category
                    select product.UserID;
            return query.Count();
        }
    }

    protected void ItemsGet()
    {
        Array queryList;
        if (searchterms != null)
        {
            queryList = getSearchQuery(SortDDL.SelectedValue);

            if (queryList.Length == 1)
                ResultsLBL.Text = queryList.Length + " Result";
            else
                ResultsLBL.Text = queryList.Length + " Results";
            CategoryLBL.Text = "Search - " + searchterms;
            NoResultsLBL.Text = "";

            if (queryList.Length == 0)
            {
                //Show no results and hide filter header
                hidePageSort();
            }
            else 
            {
                viewPageSort();
            }
        }
        else
        {
            queryList = getSortQuery(SortDDL.SelectedValue);  //gets the query according to what the user selects from the drop down list
        }

        PagedDataSource pagedData = new PagedDataSource();
        //pagedData.DataSource = SqlDataSource1Thumbs.SelectCommand;
        pagedData.DataSource = queryList;
        pagedData.AllowPaging = true;
        pagedData.PageSize = pageSize;

        // set the pagedatasource's current page
        pagedData.CurrentPageIndex = CurrentPage;


        lblCurrentPage.Text = (CurrentPage + 1).ToString() + " of "
                            + pagedData.PageCount.ToString();

        // Disable Prev or Next buttons if necessary
        cmdPrev.Enabled = !pagedData.IsFirstPage;
        cmdNext.Enabled = !pagedData.IsLastPage;

        ThumbRepeater.DataSource = pagedData;
        ThumbRepeater.DataBind();

        
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

    protected void cmdPrev_Click(object sender, System.EventArgs e)
    {
        // Set viewstate variable to the previous page
        CurrentPage -= 1;

        // Reload control
        ItemsGet();
    }

    protected void cmdNext_Click(object sender, System.EventArgs e)
    {
        // Set viewstate variable to the next page
        CurrentPage += 1;

        // Reload control
        ItemsGet();
    }

    protected void PageDDL_change(object sender, System.EventArgs e)
    {
        CurrentPage = 0;
        pageSize = Convert.ToInt32(PageDDL.SelectedValue);

        // Reload control
        ItemsGet();
        //Response.Redirect("~/Categories.aspx");
    }

    protected Array getSortQuery(string sortType)
    {
        string type = getModelType();
        
        if (sortType == "Price")
        {
            if (type != "")
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where product.MediaType == type && genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.Price ascending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
            else
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.Price ascending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
        }
        else if (sortType == "Price High")
        {
            if (type != "")
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where product.MediaType == type && genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.Price descending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
            else
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.Price descending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
        }
        else if (sortType == "Newest")
        {
            if (type != "")
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where product.MediaType == type && genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.PublishedDate descending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
            else
            {
                var query = from picture in modelData.Pictures
                            join product in modelData.Products on picture.ProductID equals product.ProductID
                            join genre in modelData.Genres on product.GenreID equals genre.GenreID
                            where genre.LongName == category && picture.PrimaryPic == "yes"
                            orderby product.PublishedDate descending
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price
                            };
                return query.ToArray();
            }
        }
        return null;
    }

    protected Array getSearchQuery(string sortType)
    {
        // Get unions of all the search terms.
        var overallQuery = (from u in modelData.Users
                            join product in modelData.Products on u.UserID equals product.UserID
                            join picture in modelData.Pictures on product.ProductID equals picture.ProductID
                            where u.Username == ""
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price,
                                PubDate = product.PublishedDate
                            }).Distinct();

        foreach (var item in terms)
        {
            // Search category
            var categoryQuery = (from genre in modelData.Genres
                                 join product in modelData.Products on genre.GenreID equals product.GenreID
                                 join picture in modelData.Pictures on product.ProductID equals picture.ProductID
                                 where genre.LongName == item && picture.PrimaryPic == "yes"
                                 select new
                                 {
                                     ImagePath = picture.ImagePath,
                                     Price = product.Price,
                                     PubDate = product.PublishedDate
                                 }).Distinct();
            if (categoryQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(categoryQuery);
            }

            // Search artist
            var artistQuery = (from u in modelData.Users
                               join product in modelData.Products on u.UserID equals product.UserID
                               join picture in modelData.Pictures on product.ProductID equals picture.ProductID
                               where u.Username == item && picture.PrimaryPic == "yes"
                               select new
                               {
                                   ImagePath = picture.ImagePath,
                                   Price = product.Price,
                                   PubDate = product.PublishedDate
                               }).Distinct();
            if (artistQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(artistQuery);
            }

            // Search tags
            var tagQuery = (from t in modelData.Tags
                            join product in modelData.Products on t.ProductID equals product.ProductID
                            join picture in modelData.Pictures on product.ProductID equals picture.ProductID
                            where t.TagName.Contains(item) && picture.PrimaryPic == "yes"
                            select new
                            {
                                ImagePath = picture.ImagePath,
                                Price = product.Price,
                                PubDate = product.PublishedDate
                            }).Distinct();
            if (tagQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(tagQuery);
            }

            // Search Program 
            var programQuery = (from p in modelData.Products
                                join picture in modelData.Pictures on p.ProductID equals picture.ProductID
                                where p.OrigProgram.Contains(item) && picture.PrimaryPic == "yes"
                                select new
                                {
                                    ImagePath = picture.ImagePath,
                                    Price = p.Price,
                                    PubDate = p.PublishedDate
                                }).Distinct();
            if (programQuery.Count() > 0)
            {
                overallQuery = overallQuery.Union(programQuery);
            }
        }
        // Get the results according to the sort drop down list
        if (sortType == "Price")
        {
            var query = from q in overallQuery
                        orderby q.Price ascending
                        select new
                        {
                            ImagePath = q.ImagePath,
                            Price = q.Price
                        };
            return query.ToArray();
        }
        else if (sortType == "Price High")
        {
            var query = from q in overallQuery
                        orderby q.Price descending
                        select new
                        {
                            ImagePath = q.ImagePath,
                            Price = q.Price
                        };
            return query.ToArray();
        }
        else if (sortType == "Newest")
        {
            var query = from q in overallQuery
                        orderby q.PubDate descending
                        select new
                        {
                            ImagePath = q.ImagePath,
                            Price = q.Price
                        };
            return query.ToArray();
        }
        return null;
    }


    //Gets the product ID from the box where the link is clicked
    protected void R1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Image picImage = (Image)e.Item.FindControl("PicImage");
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

