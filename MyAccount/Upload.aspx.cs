using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Transactions;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Zip;

public partial class Upload : System.Web.UI.Page
{
    int defaultImgWidth = 113;
    int defaultImgHeight = 111;
    string tempURL = "~/App_Themes/Green/images/tempThumbnail.png";
    private ArrayList textureNails = new ArrayList();
    ModelsDataContext modelData = new ModelsDataContext();
    private string username;
    private int maxThumbnails = 50;
    private int productID = 0;
    Product myModel = new Product();
    User thisUser;


    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        username = user.UserName;
        try
        {
            thisUser = modelData.Users.Single(u => u.Username == username);
        }
        catch
        {
            Response.Redirect("~/Myaccount/EditProfile.aspx");
        }

        if (!IsPostBack)
        {
            ArrayList addedModels = new ArrayList();
            ArrayList thumbnails = new ArrayList();
            ArrayList textureNails = new ArrayList();
            Session["myAddedThumbs"] = thumbnails;
            Session["myAddedTextures"] = textureNails;
            Session["myAddedModels"] = addedModels;
            Session["shift"] = 1;
            Session["primaryPic"] = "";
        }
    }


    protected void UploadBTN_Click(object sender, EventArgs e)
    {
        if (ThumbUpload.HasFile) {
            if (MNameTB.Text == "")
            {
                NoNameLBL2.Text = "You must provide a model name first.";
            }
            else
            {
                foreach (HttpPostedFile uploadFile in ThumbUpload.PostedFiles)
                {
                    bool exists = false;
                    // Get image extension
                    string ext = getExt(uploadFile.FileName);

                    //Change 50 to the max number of thumbnails we'll take
                    for (int i = 0; i < maxThumbnails; i++)
                    {
                        string sessionName = "image" + i;
                        string sessImgName = "imageName" + i;
                        string sessImgExt = "imageExt" + i;
                        if (Session[sessionName] != null)
                            continue;
                        Session.Add(sessionName, Path.GetFileName(uploadFile.FileName));
                        Session.Add(sessImgName, Path.GetFileName(uploadFile.FileName));
                        Session.Add(sessImgExt, ext);
                        break;
                    }

                    NoNameLBL2.Text = "";
                    String imgPath = "~/uploads/" + username + "/" + MNameTB.Text + "/thumbs/";
                    Session.Add("imgPath", imgPath);
                    Directory.CreateDirectory(Server.MapPath(imgPath));
                    String imgPath_file = imgPath + Path.GetFileName(uploadFile.FileName);
                    if (File.Exists(Server.MapPath(imgPath_file))) exists = true;
                    uploadFile.SaveAs(Server.MapPath(imgPath_file));
                    // Only add it as a thumbnail if it doesn't already exist
                    if (!exists) placeInRow(imgPath_file);
                }

                // If primaryPic doesn't exist then make the image on the far left primary pic
                if ((string)Session["primaryPic"] == "" && tempThumbIMG1.ImageUrl != tempURL)
                {
                    tempThumbIMG1.Style.Add("border", "yellow solid 2px");
                    Session["primaryPic"] = tempThumbIMG1.ImageUrl;
                }
                
            }

        }
        else {
            //Print out "no file was chosen" message
        }
    }

    protected void  TextureBtn_Click(object sender, EventArgs e)
    {
        if (TextureUpload.HasFile)
        {
            if (MNameTB.Text == "")
            {
                NoNameLBL.Text = "You must provide a model name first.";
            }
            else
            {
                bool exists = false;
                foreach (HttpPostedFile uploadFile in TextureUpload.PostedFiles)
                {
                    NoNameLBL.Text = "";
                    String imgPath = "~/uploads/" + username + "/" + MNameTB.Text + "/";
                    //Session.Add("texturePath", imgPath);
                    Directory.CreateDirectory(Server.MapPath(imgPath));
                    String imgPath_file = imgPath + Path.GetFileName(uploadFile.FileName);
                    if (File.Exists(Server.MapPath(imgPath_file))) exists = true;
                    uploadFile.SaveAs(Server.MapPath(imgPath_file));
                    if (!exists) placeInTextureRow(imgPath_file);
                }

            }

        }
        else
        {
            //Print out "no file was chosen" message
        }
    }

    protected void ModelBtn_Click(object sender, EventArgs e)
    {
        //Session.Add("ProductID", currProductID);

        // Get values out of form
        if (ModelUpload.HasFile)
        {
            ArrayList addedModels = new ArrayList();
            foreach (HttpPostedFile uploadFile in ModelUpload.PostedFiles)
            {
                if (Path.GetExtension(uploadFile.FileName) != ".exe" && Path.GetExtension(uploadFile.FileName) != ".msi")
                {
                    string fileName = Path.GetFileName(uploadFile.FileName);
                    // Add models to the session
                    addedModels = (ArrayList)Session["myAddedModels"];
                    addedModels.Add(fileName);
                    myModel.FileName = fileName;
                    //myModel.ArtFile = uploadFile.FileBytes;
                    //myModel.Size = (decimal)(uploadFile.FileContent.Length * .001);  //gets the size in KB format
                    myModel.Extension = getExt(fileName);
                    myModel.Program = ModelTB.Text;
                    PrevBTN.Enabled = true;
                    // Add model to folder
                    String imgPath = "~/uploads/" + username + "/" + MNameTB.Text + "/";
                    Directory.CreateDirectory(Server.MapPath(imgPath));
                    String imgPath_file = imgPath + fileName;
                    uploadFile.SaveAs(Server.MapPath(imgPath_file));
                }
            }
            ModelRepeater.DataSource = addedModels;
            ModelRepeater.DataBind();
            Session["myAddedModels"] = addedModels;
        }
        else
        {
            ErrorMessage.Text = "You need to upload a model.";
            return;
        }
    }


    // Resizes the images to the default image size
    protected void resizeThumbs(ImageButton img)
    {
        img.Width = Convert.ToInt32(defaultImgWidth);
        img.Height = Convert.ToInt32(defaultImgHeight);
    }

    //Put into image array
    protected void placeInRow(String url)
    {
        string filename = url.Substring(url.LastIndexOf('/') + 1, url.Length - url.LastIndexOf('/') - 1);

        // If the image is an unreadable format like .tga use a default image
        if (url.Contains(".tga"))
        {
            url = "~/App_Themes/Green/images/unreadableImage.png";
        }
        //shuffle each image to the right and resize just the newest one
        tempThumbIMG6.ImageUrl = tempThumbIMG5.ImageUrl;
        tempThumbIMG6.ToolTip = tempThumbIMG5.ToolTip;
        resizeThumbs(tempThumbIMG6);
        tempThumbIMG5.ImageUrl = tempThumbIMG4.ImageUrl;
        tempThumbIMG5.ToolTip = tempThumbIMG4.ToolTip;
        resizeThumbs(tempThumbIMG5);
        tempThumbIMG4.ImageUrl = tempThumbIMG3.ImageUrl;
        tempThumbIMG4.ToolTip = tempThumbIMG3.ToolTip;
        resizeThumbs(tempThumbIMG4);
        tempThumbIMG3.ImageUrl = tempThumbIMG2.ImageUrl;
        tempThumbIMG3.ToolTip = tempThumbIMG2.ToolTip;
        resizeThumbs(tempThumbIMG3);
        tempThumbIMG2.ImageUrl = tempThumbIMG1.ImageUrl;
        tempThumbIMG2.ToolTip = tempThumbIMG1.ToolTip;
        resizeThumbs(tempThumbIMG2);
        tempThumbIMG1.ImageUrl = url;
        tempThumbIMG1.ToolTip = filename;
        //thumbNails.Add(tempThumbIMG1);
        resizeThumbs(tempThumbIMG1);

        ((ArrayList)Session["myAddedThumbs"]).Add((tempThumbIMG1.ImageUrl));
        var thumbNails = Session["myAddedThumbs"];
        int count = ((ArrayList)Session["myAddedThumbs"]).Count;

        // Enable left arrow
        if (count > 6)
        {
            leftArrowThumb.Visible = true;
        }
    }

    //Put into image array
    protected void placeInTextureRow(String url)
    {
        string filename = url.Substring(url.LastIndexOf('/') + 1, url.Length - url.LastIndexOf('/') - 1);

        // If the image is an unreadable format like .tga use a default image
        if (url.Contains(".tga"))
        {
            url = "~/App_Themes/Green/images/unreadableImage.png";
        }
        
        //shuffle each image to the right and resize just the newest one
        tempTextureIMG6.ImageUrl = tempTextureIMG5.ImageUrl;
        tempTextureIMG6.ToolTip = tempTextureIMG5.ToolTip;
        resizeThumbs(tempTextureIMG6);
        tempTextureIMG5.ImageUrl = tempTextureIMG4.ImageUrl;
        tempTextureIMG5.ToolTip = tempTextureIMG4.ToolTip;
        resizeThumbs(tempTextureIMG5);
        tempTextureIMG4.ImageUrl = tempTextureIMG3.ImageUrl;
        tempTextureIMG4.ToolTip = tempTextureIMG3.ToolTip;
        resizeThumbs(tempTextureIMG4);
        tempTextureIMG3.ImageUrl = tempTextureIMG2.ImageUrl;
        tempTextureIMG3.ToolTip = tempTextureIMG2.ToolTip;
        resizeThumbs(tempTextureIMG3);
        tempTextureIMG2.ImageUrl = tempTextureIMG1.ImageUrl;
        tempTextureIMG2.ToolTip = tempTextureIMG1.ToolTip;
        resizeThumbs(tempTextureIMG2);
        tempTextureIMG1.ImageUrl = url;
        tempTextureIMG1.ToolTip = filename;
        textureNails.Add(tempTextureIMG1);
        resizeThumbs(tempTextureIMG1);

        ((ArrayList)Session["myAddedTextures"]).Add((tempTextureIMG1.ImageUrl));
        var thumbNails = Session["myAddedTextures"];
        int count = ((ArrayList)Session["myAddedTextures"]).Count;

        // Enable left arrow
        if (count > 6)
        {
            leftArrowTexture.Visible = true;
        }

    }

    protected void PreviewBTN_Click(object sender, EventArgs e)
    {
        // If the model has the name name as one already submitted
        // by the user then exit
        if (modelNameExists())
        {
            string modelExists = "There is already a model named " + MNameTB.Text + " associated with user " + username + ".";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + modelExists + "');", true);
            return;
        }

        // Write model to the database
        myModel.UserID = thisUser.UserID;
        myModel.Name = MNameTB.Text;
        myModel.GenreID = Convert.ToInt32(GenreDDL.SelectedValue);
        myModel.Price = Math.Round(Convert.ToDecimal(PriceTB.Text), 2);
        if (Price2TB.Text != "")
            myModel.Price_Commercial = Math.Round(Convert.ToDecimal(Price2TB.Text), 2);
        myModel.Description = DescTB.Text;
        myModel.Geometry = GeometryRBL.SelectedValue;
        myModel.Textures = TexturesRBL.SelectedValue;
        myModel.Materials = MaterialsRBL.SelectedValue;
        myModel.Rigged = RiggedRBL.SelectedValue;
        myModel.Animated = AnimatedRBL.SelectedValue;
        myModel.GameReady = GameReadyRBL.SelectedValue;
        myModel.Mature = MatureRBL.SelectedValue;
        myModel.Polygons = Convert.ToInt32(PolygonTB.Text);
        myModel.Vertices = Convert.ToInt32(VerticesTB.Text);
        myModel.OrigProgram = ModelTB.Text;
        myModel.PublishedDate = DateTime.Now;
        myModel.SubmittedDate = DateTime.Now;
        myModel.MediaType = GameReadyRBL.SelectedValue;
        myModel.UnderReview = "Yes";

        //Add tags to the session to retrieve later
        string[] theseTags = TagTB.Text.Split(' ', ',');
        List<string> tagList = theseTags.ToList();
        tagList.RemoveAll(item => item == "");

        //Session.Add("tags", tagList);
        Session.Add("genre", GenreDDL.SelectedItem.Text);
        Session.Add("origProgram", ModelTB.Text);
        Session.Add("price", PriceTB.Text);
        Session.Add("gameReady", AnimatedRBL.SelectedValue);

        try
        {
            using (TransactionScope ts = new TransactionScope())
            {
                // write everything to the database
                modelData.Products.InsertOnSubmit(myModel);
                modelData.SubmitChanges();
                //Set up next section for adding models
                setProductID();


                // Write tags to the database
                for (int i = 0; i < tagList.Count; i++)
                {
                    Tag writeTag = new Tag();
                    string thisTag = tagList.ElementAt(i);
                    writeTag.TagName = thisTag;
                    writeTag.ProductID = productID;
                    modelData.Tags.InsertOnSubmit(writeTag);
                }
                modelData.SubmitChanges();

                // Write images to the database
                ArrayList thumbList = (ArrayList)Session["myAddedThumbs"];
                for (int i = 0; i < thumbList.Count; i++)
                {
                    Picture writePics = new Picture();
                    string currURL = (String)thumbList[i];
                    string filename = Path.GetFileName(currURL);
                    writePics.PictureName = filename.Substring(0, filename.IndexOf('.'));
                    writePics.ImagePath = currURL;
                    writePics.Extension = Path.GetExtension(currURL);
                    writePics.ProductID = productID;
                    if (currURL == (String)Session["primaryPic"]) {
                        writePics.PrimaryPic = "yes";
                    }
                    else
                    {
                        writePics.PrimaryPic = "no";
                    }
                    Session.Remove("image" + (i - 1));
                    modelData.Pictures.InsertOnSubmit(writePics);
                }
                modelData.SubmitChanges();
                
                ts.Complete();
            }
        }
        catch (Exception ex)
        {
            ErrorMessage.Text = "An exception occured adding the order." + ex.Message;
            return;
        }

        // Zip up the folder
        String modelPath = "~/uploads/" + username + "/" + MNameTB.Text + "";
        CreateZip(Server.MapPath(modelPath), null, Server.MapPath(modelPath));

        Session.Add("ProductID", productID);
        Session.Add("PrevPage", "Upload");
        Session.Remove("imgPath");
        Response.Redirect("~/Preview.aspx");
    }

    /********************************************************
     * Deletes a directory and all of the files inside of it
     * *****************************************************/
    private void DeleteDirectory(string target_dir)
    {
        string[] files = Directory.GetFiles(target_dir);
        string[] dirs = Directory.GetDirectories(target_dir);

        foreach (string file in files)
        {
            File.SetAttributes(file, FileAttributes.Normal);
            File.Delete(file);
        }

        foreach (string dir in dirs)
        {
            DeleteDirectory(dir);
        }

        Directory.Delete(target_dir, false);

    }

    /*
     * Returns the file extension when provided with the filename.
     * */
    protected string getExt(string fileName)
    {
        string[] names = fileName.Split('.');
        return names[1];
    }

    /*
     * Gets the productID from the product name and the username.
     * */
    private void setProductID()
    {
        var query = from product in modelData.Products
                    join user in modelData.Users on product.UserID equals user.UserID
                    where product.Name == MNameTB.Text && user.Username == username
                    select product.ProductID;
        productID = query.Single();
        Session.Add("ProdID", productID);
    }

    /*
     * Checks to see if there is already a model with the same name assoicated
     * with the user.
     * */
    private bool modelNameExists()
    {
        int count = (from product in modelData.Products
                    join user in modelData.Users on product.UserID equals user.UserID
                    where product.Name == MNameTB.Text && user.Username == username
                    select product.ProductID).Count();
        if (count > 0) {
            return true;
        }
        return false;
    }

    // Compresses the files in the nominated folder, and creates a zip file on disk named as outPathname.
    //
    public void CreateZip(string outPathname, string password, string folderName)
    {
        try
        {
            outPathname = outPathname + ".zip";
            FileStream fsOut = File.Create(outPathname);
            ZipOutputStream zipStream = new ZipOutputStream(fsOut);


            zipStream.SetLevel(3); //0-9, 9 being the highest level of compression

            zipStream.Password = password;  // optional. Null is the same as not setting. Required if using AES.

            // This setting will strip the leading part of the folder path in the entries, to
            // make the entries relative to the starting folder.
            // To include the full path for each entry up to the drive root, assign folderOffset = 0.
            int folderOffset = folderName.Length + (folderName.EndsWith("\\") ? 0 : 1);

            CompressFolder(folderName, zipStream, folderOffset);

            zipStream.IsStreamOwner = true; // Makes the Close also Close the underlying stream
            zipStream.Close();
        }
        catch (Exception ex)
        {
            ErrorMessage.Text = "An exception occured adding the order." + ex.Message;
        }
    }

    // Recurses down the folder structure
    //
    private void CompressFolder(string path, ZipOutputStream zipStream, int folderOffset)
    {

        string[] files = Directory.GetFiles(path);

        foreach (string filename in files)
        {

            FileInfo fi = new FileInfo(filename);

            string entryName = filename.Substring(folderOffset); // Makes the name in zip based on the folder
            entryName = ZipEntry.CleanName(entryName); // Removes drive from name and fixes slash direction
            ZipEntry newEntry = new ZipEntry(entryName);
            newEntry.DateTime = fi.LastWriteTime; // Note the zip format stores 2 second granularity

            // Specifying the AESKeySize triggers AES encryption. Allowable values are 0 (off), 128 or 256.
            // A password on the ZipOutputStream is required if using AES.
            //   newEntry.AESKeySize = 256;

            // To permit the zip to be unpacked by built-in extractor in WinXP and Server2003, WinZip 8, Java, and other older code,
            // you need to do one of the following: Specify UseZip64.Off, or set the Size.
            // If the file may be bigger than 4GB, or you do not need WinXP built-in compatibility, you do not need either,
            // but the zip will be in Zip64 format which not all utilities can understand.
            //   zipStream.UseZip64 = UseZip64.Off;
            newEntry.Size = fi.Length;

            zipStream.PutNextEntry(newEntry);

            // Zip the file in buffered chunks
            // the "using" will close the stream even if an exception occurs
            byte[] buffer = new byte[4096];
            using (FileStream streamReader = File.OpenRead(filename))
            {
                StreamUtils.Copy(streamReader, zipStream, buffer);
            }
            zipStream.CloseEntry();
        }
        string[] folders = Directory.GetDirectories(path);
        foreach (string folder in folders)
        {
            CompressFolder(folder, zipStream, folderOffset);
        }
    }


    protected void ModelRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label model = (Label)e.Item.FindControl("ModelName");

        // Remove the model file from the Session and the upload Directory
        ArrayList addedModels = (ArrayList)Session["myAddedModels"];
        addedModels.Remove(model.Text);
        Session["myAddedModels"] = addedModels;
        ModelRepeater.DataSource = addedModels;
        ModelRepeater.DataBind();

        string path = "~/uploads/" + username + "/" + MNameTB.Text + "/" + model.Text;
        if (File.Exists(Server.MapPath(path))) {
            File.Delete(Server.MapPath(path));
        }
    }

    private void deleteAndShift(int index, ImageButton imageToDelete)
    {
        ArrayList thumbNails = (ArrayList)Session["myAddedThumbs"];
        ArrayList textureNails = (ArrayList)Session["myAddedTextures"];
        ArrayList nails;
        List<ImageButton> picArray = new List<ImageButton>();
        int shift = (int)Session["shift"];

        if (imageToDelete.ID.Contains("Thumb"))
        {
            nails = thumbNails;
        }
        else
        {
            nails = textureNails;
        }
        // Delete pic from upload folder
        if (File.Exists(Server.MapPath(imageToDelete.ImageUrl)))
        {
            File.Delete(Server.MapPath(imageToDelete.ImageUrl));
            //Delete it from the thumbnail list
            foreach (var item in nails)
            {
                if ((string)item == imageToDelete.ImageUrl)
                {
                    nails.Remove(item);
                    if (nails.Count <= 6)
                    {
                        if (imageToDelete.ID.Contains("Thumb"))
                        {
                            leftArrowThumb.Visible = false;
                        }
                        else
                        {
                            leftArrowTexture.Visible = false;
                        }
                    }
                    break;
                }
            }
        }

        // Shift remaining pictures over

        //shuffle each image to the left and resize just the newest one
        ImageButton pic1;
        ImageButton pic2;
        ImageButton pic3;
        ImageButton pic4;
        ImageButton pic5;
        ImageButton pic6;

        if (imageToDelete.ID.Contains("Thumb")) {
            pic1 = tempThumbIMG1;
            pic2 = tempThumbIMG2;
            pic3 = tempThumbIMG3;
            pic4 = tempThumbIMG4;
            pic5 = tempThumbIMG5;
            pic6 = tempThumbIMG6;
        } else {
            pic1 = tempTextureIMG1;
            pic2 = tempTextureIMG2;
            pic3 = tempTextureIMG3;
            pic4 = tempTextureIMG4;
            pic5 = tempTextureIMG5;
            pic6 = tempTextureIMG6;
        }
        picArray.Add(pic1);
        picArray.Add(pic2);
        picArray.Add(pic3);
        picArray.Add(pic4);
        picArray.Add(pic5);
        picArray.Add(pic6);

        if (index == 1)
        {
            if (pic1.ImageUrl == (string)Session["primaryPic"])
            {
                /*if (pic2.ImageUrl != tempURL)
                    makeMainPic(pic2);
                else
                {
                    pic1.Style.Remove("border");
                    Session["primaryPic"] = "";
                }*/
            }
            pic1.ImageUrl = pic2.ImageUrl;
            pic1.ToolTip = pic2.ToolTip;
            resizeThumbs(pic1);
        }
        if (index <= 2)
        {
            //if (imageToDelete.ImageUrl == (string)Session["primaryPic"]) makeMainPic(pic1);
            pic2.ImageUrl = pic3.ImageUrl;
            pic2.ToolTip = pic3.ToolTip;
            resizeThumbs(pic2);
        }
        if (index <= 3)
        {
            //if (imageToDelete.ImageUrl == (string)Session["primaryPic"]) makeMainPic(pic2);
            pic3.ImageUrl = pic4.ImageUrl;
            pic3.ToolTip = pic4.ToolTip;
            resizeThumbs(pic3);
        }
        if (index <= 4)
        {
            //if (imageToDelete.ImageUrl == (string)Session["primaryPic"]) makeMainPic(pic3);
            pic4.ImageUrl = pic5.ImageUrl;
            pic4.ToolTip = pic5.ToolTip;
            resizeThumbs(pic4);
        }
        if (index <= 5)
        {
            //if (imageToDelete.ImageUrl == (string)Session["primaryPic"]) makeMainPic(pic4);
            pic5.ImageUrl = pic6.ImageUrl;
            pic5.ToolTip = pic6.ToolTip;
            resizeThumbs(pic5);
        }
        // pull these in from a list when it exists
        if (nails.Count - (5 + shift) < 0)
        {
            //if (imageToDelete.ImageUrl == (string)Session["primaryPic"]) makeMainPic(pic5);
            pic6.ImageUrl = tempURL;
            pic6.ToolTip = "";
            resizeThumbs(pic6);
            if (nails.Count <= 1)
            {
                if (imageToDelete.ID.Contains("Thumb"))
                {
                    rightArrowThumb.Visible = false;
                }
                else
                {
                    rightArrowTexture.Visible = false;
                }
            }
        }
        else
        {
            // Get index of item in pic6
            int index6 = nails.IndexOf(pic6.ImageUrl);
            if (index6 > 0)
            {
                pic6.ImageUrl = (string)nails[index6 - 1];
                pic6.ToolTip = Path.GetFileName((string)nails[index6 - 1]);
                resizeThumbs(pic6);
            }
            else
            {
                pic6.ImageUrl = tempURL;
                pic6.ToolTip = "";
                resizeThumbs(pic6);
            }
        }
        // Adjust the primary pic as needed
        bool found = false;
        foreach (var item in picArray)
        {
            if (item.ImageUrl == (string)Session["primaryPic"])
            {
                makeMainPic(item);
                found = true;
            }
        }
        if (!found)
        {
            if (pic1.ImageUrl != tempURL && textureNails.Count <= 6)
            {
                makeMainPic(pic1);
            }
            else
            {
                pic1.Style.Remove("border");
                Session["primaryPic"] = "";
            }
        }
        if (imageToDelete.ID.Contains("Thumb"))
        {
            Session["myAddedThumbs"] = nails;
        }
        else
        {
            Session["myAddedTextures"] = nails;
        }
    }

    private void shiftPics(string direction, string imageType)
    {
        ArrayList thumbNails = (ArrayList)Session["myAddedThumbs"];
        ArrayList textureNails = (ArrayList)Session["myAddedTextures"];
        List<ImageButton> picArray = new List<ImageButton>();
        ArrayList nails;
        if (imageType == "thumbs")
        {
            nails = thumbNails;
        }
        else
        {
            nails = textureNails;
        }
        int count = nails.Count;
        int shift = (int)Session["shift"];
        ImageButton pic1;
        ImageButton pic2;
        ImageButton pic3;
        ImageButton pic4;
        ImageButton pic5;
        ImageButton pic6;

        if (imageType == "thumbs")
        {
            pic1 = tempThumbIMG1;
            pic2 = tempThumbIMG2;
            pic3 = tempThumbIMG3;
            pic4 = tempThumbIMG4;
            pic5 = tempThumbIMG5;
            pic6 = tempThumbIMG6;
        }
        else
        {
            pic1 = tempTextureIMG1;
            pic2 = tempTextureIMG2;
            pic3 = tempTextureIMG3;
            pic4 = tempTextureIMG4;
            pic5 = tempTextureIMG5;
            pic6 = tempTextureIMG6;
        }
        picArray.Add(pic1);
        picArray.Add(pic2);
        picArray.Add(pic3);
        picArray.Add(pic4);
        picArray.Add(pic5);
        picArray.Add(pic6);

        if (direction == "left")
        {
            pic1.ImageUrl = pic2.ImageUrl;
            pic1.ToolTip = pic2.ToolTip;
            resizeThumbs(pic1);
            pic2.ImageUrl = pic3.ImageUrl;
            pic2.ToolTip = pic3.ToolTip;
            resizeThumbs(pic2);
            pic3.ImageUrl = pic4.ImageUrl;
            pic3.ToolTip = pic4.ToolTip;
            resizeThumbs(pic3);
            pic4.ImageUrl = pic5.ImageUrl;
            pic4.ToolTip = pic5.ToolTip;
            resizeThumbs(pic4);
            pic5.ImageUrl = pic6.ImageUrl;
            pic5.ToolTip = pic6.ToolTip;
            resizeThumbs(pic5);
            if (count - (6 + shift) <= (count-1))
            {
                pic6.ImageUrl = (string)nails[count - (6 + shift)];
                pic6.ToolTip = Path.GetFileName(pic6.ImageUrl);
                resizeThumbs(pic6);
            }
            else
            {
                pic6.ImageUrl = tempURL;
                pic6.ToolTip = "";
                resizeThumbs(pic6);
            }
            shift++;
            if (count - (6 + shift) < 0 )
            {
                if (imageType == "thumbs")
                {
                    leftArrowThumb.Visible = false;
                }
                else
                {
                    leftArrowTexture.Visible = false;
                }
            }
            if (imageType == "thumbs")
            {
                rightArrowThumb.Visible = true;
            }
            else
            {
                rightArrowTexture.Visible = true;
            }
        }
        else if (direction == "right")
        {
            if (pic1.ImageUrl == (string)nails[nails.Count - 1])
            {
                if (imageType == "thumbs")
                {
                    leftArrowThumb.Visible = false;
                }
                else
                {
                    leftArrowTexture.Visible = false;
                }
            }
            pic6.ImageUrl = pic5.ImageUrl;
            pic6.ToolTip = pic5.ToolTip;
            resizeThumbs(pic6);
            pic5.ImageUrl = pic4.ImageUrl;
            pic5.ToolTip = pic4.ToolTip;
            resizeThumbs(pic5);
            pic4.ImageUrl = pic3.ImageUrl;
            pic4.ToolTip = pic3.ToolTip;
            resizeThumbs(pic4);
            pic3.ImageUrl = pic2.ImageUrl;
            pic3.ToolTip = pic2.ToolTip;
            resizeThumbs(pic3);
            pic2.ImageUrl = pic1.ImageUrl;
            pic2.ToolTip = pic1.ToolTip;
            resizeThumbs(pic2);
            pic1.ImageUrl = (string)nails[count - (shift - 1)];
            pic1.ToolTip = Path.GetFileName(pic1.ImageUrl);
            resizeThumbs(pic1);
            shift--;
            if (count - (shift - 1) >= count)
            {
                if (imageType == "thumbs")
                {
                    rightArrowThumb.Visible = false;
                }
                else
                {
                    rightArrowTexture.Visible = false;
                }
            }
            if (imageType == "thumbs")
            {
                leftArrowThumb.Visible = true;
            }
            else
            {
                leftArrowTexture.Visible = true;
            }
        }
        // Adjust Primary Pic
        bool found = false;
        foreach (var item in picArray)
        {
            if (item.ImageUrl == (string)Session["primaryPic"])
            {
                makeMainPic(item);
                found = true;
            }
        }
        if (!found)
        {
            pic1.Style.Remove("border");
            pic6.Style.Remove("border");
        }

        Session["shift"] = shift;
    }

    protected void thumbDelete1_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(1, tempThumbIMG1);
    }
    protected void thumbDelete2_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(2, tempThumbIMG2);
    }
    protected void thumbDelete3_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(3, tempThumbIMG3);
    }
    protected void thumbDelete4_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(4, tempThumbIMG4);
    }
    protected void thumbDelete5_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(5, tempThumbIMG5);
    }
    protected void thumbDelete6_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(6, tempThumbIMG6);
    }
    protected void deleteTexture1_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(1, tempTextureIMG1);
    }
    protected void deleteTexture2_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(2, tempTextureIMG2);
    }
    protected void deleteTexture3_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(3, tempTextureIMG3);
    }
    protected void deleteTexture4_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(4, tempTextureIMG4);
    }
    protected void deleteTexture5_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(5, tempTextureIMG5);
    }
    protected void deleteTexture6_Click(object sender, ImageClickEventArgs e)
    {
        deleteAndShift(6, tempTextureIMG6);
    }
    protected void leftArrowThumb_Click(object sender, ImageClickEventArgs e)
    {
        shiftPics("left", "thumbs");
    }
    protected void rightArrowThumb_Click(object sender, ImageClickEventArgs e)
    {
        shiftPics("right", "thumbs");
    }
    protected void leftArrowTexture_Click(object sender, ImageClickEventArgs e)
    {
        shiftPics("left", "textures");
    }
    protected void rightArrowTexture_Click(object sender, ImageClickEventArgs e)
    {
        shiftPics("right", "textures");
    }
    protected void tempThumbIMG1_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG1);
    }
    protected void tempThumbIMG2_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG2);
    }
    protected void tempThumbIMG3_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG3);
    }
    protected void tempThumbIMG4_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG4);
    }
    protected void tempThumbIMG5_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG5);
    }
    protected void tempThumbIMG6_Click(object sender, ImageClickEventArgs e)
    {
        makeMainPic(tempThumbIMG6);
    }
    private void makeMainPic(ImageButton picture)
    {
        // Can't make the default pic your primary pic
        if (picture.ImageUrl != tempURL)
        {
            // Remove existing border
            tempThumbIMG1.Style.Remove("border");
            tempThumbIMG2.Style.Remove("border");
            tempThumbIMG3.Style.Remove("border");
            tempThumbIMG4.Style.Remove("border");
            tempThumbIMG5.Style.Remove("border");
            tempThumbIMG6.Style.Remove("border");

            picture.Style.Add("border", "solid yellow 2px");
            Session["primaryPic"] = picture.ImageUrl;
        }
    }
}