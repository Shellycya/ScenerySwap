<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Submissions.aspx.cs" Inherits="Management_Submissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .reasonsTB
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type = "text/javascript" language="javascript">
        function Confirm() {
            var confirm_value = document.getElementById("confirm_value");
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
         }
    </script>

    <div id="darkBackgroundLayer" class="darkenBackground">
        <script language="javascript" type="text/javascript">
            document.getElementById("darkBackgroundLayer").style.display = "none";
        </script>
    </div>
    <div id="header">
        <img src="../App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:Label ID="UploadTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="SUBMISSIONS"></asp:Label>
    </div>

    <input type="hidden" id="confirm_value" name="confirm_value" value = "" />

    <div id="SubmissionSec">
        <br /><asp:Label ID="Label1" runat="server" CssClass="qualityLBL" Text="Check For Quality" Font-Size="1.5em"></asp:Label><br /><br />

        <asp:SqlDataSource ID="ArtistDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
            
            
            
            SelectCommand="SELECT [User].Username, Product.Name, Product.ProductID, Product.SubmittedDate, Product.Price, Picture.ImagePath 
            FROM [User] INNER JOIN Product ON [User].UserID = Product.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID 
            WHERE (Picture.PrimaryPic = 'yes') AND (Product.UnderReview = 'Yes') ORDER BY [User].Username">
        </asp:SqlDataSource>

        <div class="smallPopup">
            <asp:Panel ID="ConfirmPanel" runat="server" CssClass="confirmPanel" 
                BackColor="#f2f5f7" BorderColor="Black" BorderStyle="Solid" Visible="false">
            
                <asp:Label ID="SureLBL" runat="server" CssClass="sureLBL" Font-Size="1.1em" Text="Are you sure you want to approve"></asp:Label>
                <div class="artistBySub">
                    <asp:Label ID="featuredModelLink" runat="server" SkinID="BoldBlue" Text="Cloud"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="by"></asp:Label>
                    <asp:Label ID="featuredArtistLink" runat="server" ForeColor="#aa6021" Text="Saj1242"></asp:Label><br /><br />
                    <asp:Button ID="YesBTN" runat="server" SkinID="SubmissionsBTN" Width="100px" 
                        Style="margin-right: 10px;" Text="Yes" onclick="YesBTN_Click" />
                    <asp:Button ID="NoBTN" runat="server" SkinID="SubmissionsBTN" Width="100px" 
                        Text="No" onclick="NoBTN_Click" />
                </div>
            </asp:Panel>
        </div>
        <asp:Panel ID="ApprovedPanel" runat="server" CssClass="ApprovedPanel" BackColor="#f2f5f7" BorderColor="Black" BorderStyle="Solid" Visible="false">
            <div class="hasApproved">
                <asp:Label ID="ApprovedModel" runat="server" SkinID="BoldBlue" Text="Cloud"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="by"></asp:Label>
                <asp:Label ID="ApprovedArtist" runat="server" ForeColor="#aa6021" Text="Saj1242"></asp:Label><br />
                <asp:Label ID="Label7" runat="server" Text="Has Been Approved"></asp:Label><br /><br />
                <asp:Button ID="Button1" runat="server" SkinID="SubmissionsBTN" Text="OK" Width="100px" />
            </div>
        </asp:Panel>
        <asp:Panel ID="DeniedPanel" runat="server" CssClass="DeniedPanel" BackColor="#f2f5f7" BorderColor="Black" BorderStyle="Solid" Visible="false">
            <div class="middleDenied">
                <asp:Label ID="DeniedModel" runat="server" SkinID="BoldBlueBig" Text="Cloud" Font-Size="Larger"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="by"></asp:Label>
                <asp:Label ID="DeniedArtist" runat="server" ForeColor="#aa6021" Text="Saj1242"></asp:Label><br /><br />
                <asp:Label ID="Label9" runat="server" Text="Did not meet the qualilty guidelines for the following reasons."></asp:Label><br /><br />
                <asp:TextBox ID="ReasonsTB" CssClass="reasonsTB" runat="server" Height="258px" 
                    Rows="100" TextMode="MultiLine" Width="416px" BorderStyle="Solid" BorderColor="Black"></asp:TextBox><br /><br />
                <asp:Label ID="Body1" runat="server" Text="Visit "> </asp:Label>
                <asp:HyperLink ID="Body2" runat="server" SkinID="DarkBlueLink" NavigateUrl="~/Default.aspx">http://www.sceneryswap.com</asp:HyperLink>
                <asp:Label ID="Body3" runat="server" Text=" and log into your account. Visit the My Account page and click edit next to "></asp:Label>
                <asp:HyperLink ID="Body4" runat="server" Font-Bold="true" SkinID="DarkBlueLink">Cloud.</asp:HyperLink>
                <asp:Label ID="Body5" runat="server" Text=" Make the listed adjustments and submit
                    again.  We have a tutorial on the submissions process you can view "></asp:Label>
                <asp:HyperLink ID="Body6" runat="server" SkinID="OrangeLink" Font-Bold="true">here</asp:HyperLink>
                <asp:Label ID="Body7" runat="server" Text=" or you can contact us at "></asp:Label>
                <a href="mailto:info@sceneryswap.com">info@sceneryswap.com</a> 
                <asp:Label ID="Body8" runat="server" Text="with any questions.<br /><br />Thank you!"></asp:Label><br /><br />
                <asp:Button ID="EmailBTN" runat="server" SkinID="SubmissionsBTN" 
                    Text="Send Email" onclick="EmailBTN_Click" />
                <asp:Button ID="Button3" runat="server" SkinID="SubmissionsBTN" Width="100px" Text="Cancel" />
            </div>
        </asp:Panel>

        <asp:Repeater ID="ArtistRepeater" runat="server" 
            DataSourceID="ArtistDataSource1" 
            onitemcommand="ArtistRepeater_ItemCommand" 
            onitemcreated="ArtistRepeater_ItemCreated" 
            onitemdatabound="ArtistRepeater_ItemDataBound">

            <ItemTemplate>
                <div class="artistLgMin">
                    <asp:Image ID="LargeMinBG" CssClass="artistLgMin2" runat="server" ImageUrl="~/App_Themes/Green/images/light_blue_med.png" />
                    <asp:Image ID="artistAvatar" CssClass="artistAvatar" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="111" Width="113" />
                    <asp:Image ID="artistNameBG" CssClass="avatarNameBG" runat="server" ImageUrl="~/App_Themes/Green/images/light_border.png" />
                    <asp:LinkButton ID="artistNameLBL" runat="server" CssClass="artistNameLBL" SkinID="ArtistNameLink" Text='<%# Eval("Name") %>' CommandName="ModelName"></asp:LinkButton>
                    <asp:Label ID="DateSubmittedLBL" runat="server" CssClass="dateSubmittedLBL"  Font-Size="1.2em" Text='<%# "Submitted " + Model.formatString((DateTime)Eval("SubmittedDate")) %>'></asp:Label>
                    <asp:Label ID="priceLBL" runat="server" CssClass="dateJoinedLBL" Font-Size="1.5em" Text='<%# "$" + Eval("Price") %>'></asp:Label>
                    <asp:Image ID="artistDetailsBG" CssClass="artistDetailsBG" runat="server" ImageUrl="~/App_Themes/Green/images/dark_border.png" />
                    <asp:HiddenField ID="HiddenProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                    
                    <div class="subBy">
                        <asp:Label ID="Label2" SkinID="BoldWhite" runat="server" Text="by"></asp:Label>
                        <asp:Label ID="SubmissionLBL" SkinID="BoldOrange" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </div>
                    <div class="subButtonsRight">
                        <asp:Button ID="ViewSubBTN" runat="server" CssClass="subButton" SkinID="SubmissionsBTN" Text="View Submission" CommandName="View" />
                        <asp:Button ID="ApproveSubBTN" runat="server" CssClass="subButton" SkinID="SubmissionsBTN" Text="Approve" CommandName="Approve" />
                        <asp:Button ID="DownloadSubBTN" runat="server" CssClass="subButton" SkinID="SubmissionsBTN" Text="Download" CommandName="Download" />
                    </div>
                    
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>
</asp:Content>

