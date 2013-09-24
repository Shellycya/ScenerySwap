using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;
using System.IO;
using System.Transactions;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Zip;

public partial class MyAccount_Cart : System.Web.UI.Page
{
    private ArrayList cart;
    private ArrayList modelCart;
    private ArrayList zipList = new ArrayList();
    private string username;
    ModelsDataContext modelData = new ModelsDataContext();
    Invoice newInvoice = new Invoice();
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
        this.GetModelCart();
        CartRepeater.DataSource = this.GetCart();
        CartRepeater.DataBind();

        getSubtotal(this.GetCart());
        if (Session["Subtotal"] == null)
        {
            CheckoutBTN.Enabled = false;
        }
    }

    private void getSubtotal(ArrayList cart)
    {
        if (Session["Subtotal"] != null)
        {
            decimal subtotal = (decimal)Session["Subtotal"];
            TotalLBL.Text = "$" + Convert.ToString(subtotal);
        }
    }


    private ArrayList GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new ArrayList());
        cart = (ArrayList)Session["Cart"];
        return cart;
    }

    private ArrayList GetModelCart()
    {
        if (Session["ModelCart"] == null)
            Session.Add("ModelCart", new ArrayList());
        modelCart = (ArrayList)Session["ModelCart"];
        return modelCart;
    }

 
    protected void CheckoutBTN_Click(object sender, EventArgs e)  // temp remove selected item
    {
        //get model info based off of productID
        modelCart = this.GetModelCart();
        makeInvoice(modelCart);
        for(int i = 0; i < modelCart.Count; i++) {
            Model thisModel = (Model)modelCart[i];
            String fileName = Server.MapPath("~/uploads/" + thisModel.UserName + "/" + thisModel.Name + ".zip");
            zipList.Add(fileName);
            //FileInfo fileInfo = new FileInfo(fileName);
            
            //downloadFile(fileInfo, fileName);
             
        }

        // Zip up the folder
        String modelPath = "~/orders/" + username + "/thisOrder";
        Directory.CreateDirectory(Server.MapPath("~/orders/" + username));
        CreateZip(Server.MapPath(modelPath), null, Server.MapPath(modelPath));

        FileInfo fileInfo = new FileInfo(Server.MapPath(modelPath + ".zip"));
        downloadFile(fileInfo);

        // Will put write to database purchase order code here
        cart.Clear();
        modelCart.Clear();
        TotalLBL.Text = "$0";
        Response.Flush();
        ClientScript.RegisterStartupScript(typeof(MyAccount_Cart), "Click", "redirect();", true); 
        
        
        //Response.End();
    }

    private void makeInvoice(ArrayList modelCart)
    {
        string withoutDollar = (TotalLBL.Text).Substring(1, TotalLBL.Text.Length - 1);
        Decimal subtotal = Convert.ToDecimal(withoutDollar);
        DateTime now = DateTime.Now;
        int invoiceID = -1;

        newInvoice.UserID = thisUser.UserID;
        newInvoice.OrderDate = now;
        newInvoice.Subtotal = subtotal;
        newInvoice.SalesTax = 0;        // need to add tax once paypal is working

        try
        {
            using (TransactionScope ts = new TransactionScope())
            {
                // write everything to the database
                modelData.Invoices.InsertOnSubmit(newInvoice);
                modelData.SubmitChanges();
                //Set up next section for adding models
                invoiceID = getInvoiceID(thisUser.UserID, now, subtotal);

                // Fill LineItem table
                foreach (Model purchase in modelCart)
                {
                    LineItem li = new LineItem();
                    li.InvoiceNum = invoiceID;
                    li.ProductID = purchase.ProductID;
                    li.UnitPrice = purchase.Price;
                    li.Quantity = purchase.Quantity;
                    modelData.LineItems.InsertOnSubmit(li);
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

    }

    /*
 * Gets the invoiceID from the userID, OrderDate and the total.
 * */
    private int getInvoiceID(int userid, DateTime now, Decimal subtotal)
    {
        var query = from invoice in modelData.Invoices
                    where invoice.UserID == userid && invoice.OrderDate == now && 
                    invoice.Subtotal == subtotal
                    select invoice.InvoiceNum;
        return query.Single();
    }

    protected void downloadFile(FileInfo fileInfo)
    {
        // Clear spaces from file name
        String filename = fileInfo.Name.Replace(' ', '_');
        Response.ClearContent();
        Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
        Response.AddHeader("Content-Length", fileInfo.Length.ToString());
        Response.ContentType = ReturnExtension(".zip");
        Response.Flush();
        Response.TransmitFile(fileInfo.FullName);

        //Response.End();
    }

   

    // Remove the selected item
    protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label priceLabel = (Label)e.Item.FindControl("PriceLBL");
        string priceString = priceLabel.Text;
        priceString = priceString.Substring(1);
        decimal price = Convert.ToDecimal(priceString);
        decimal currentTotal = (decimal)Session["Subtotal"];

        int index = e.Item.ItemIndex;
        cart.RemoveAt(index);
        modelCart.RemoveAt(index);
        Session.Add("Subtotal", currentTotal - price);
        Response.Redirect("~/MyAccount/Cart.aspx");
    }

    private string ReturnExtension(string fileExtension)
    {
        switch (fileExtension)
        {
            case ".htm":
            case ".html":
            case ".log":
                return "text/HTML";
            case ".txt":
                return "text/plain";
            case ".max":
                return "model/mesh";
            case ".doc":
                return "application/ms-word";
            case ".tiff":
            case ".tif":
                return "image/tiff";
            case ".asf":
                return "video/x-ms-asf";
            case ".avi":
                return "video/avi";
            case ".zip":
                return "application/zip";
            case ".xls":
            case ".csv":
                return "application/vnd.ms-excel";
            case ".gif":
                return "image/gif";
            case ".jpg":
            case "jpeg":
                return "image/jpeg";
            case ".bmp":
                return "image/bmp";
            case ".wav":
                return "audio/wav";
            case ".mp3":
                return "audio/mpeg3";
            case ".mpg":
            case "mpeg":
                return "video/mpeg";
            case ".rtf":
                return "application/rtf";
            case ".asp":
                return "text/asp";
            case ".pdf":
                return "application/pdf";
            case ".fdf":
                return "application/vnd.fdf";
            case ".ppt":
                return "application/mspowerpoint";
            case ".dwg":
                return "image/vnd.dwg";
            case ".msg":
                return "application/msoutlook";
            case ".xml":
            case ".sdxl":
                return "application/xml";
            case ".xdp":
                return "application/vnd.adobe.xdp+xml";
            default:
                return "application/octet-stream";
        }
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

            CompressFolder(folderName, zipStream);

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
    private void CompressFolder(string path, ZipOutputStream zipStream)
    {
        ArrayList files = zipList;
        //string[] files = Directory.GetFiles(path);  // Change this to files in the cart

        foreach (string filename in files)
        {

            FileInfo fi = new FileInfo(filename);
            int folderOffset = filename.LastIndexOf("\\");
            string entryName = filename.Substring(folderOffset+1); // Makes the name in zip based on the folder
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
        /*string[] folders = Directory.GetDirectories(path);
        foreach (string folder in folders)
        {
            CompressFolder(folder, zipStream, folderOffset);
        }*/
    }


    protected void RedirectBTN_Click(object sender, EventArgs e)
    {
    }
}