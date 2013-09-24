<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount_MyAccount" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%@ Register Namespace="CustomControls" TagPrefix="cc1" %>
    <div id="header">
        <img src="../App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:HyperLink ID="HyperLink1" runat="server" SkinID="AccountLink" CssClass="headerLink1" NavigateUrl="~/MyAccount/EditProfile.aspx">Edit Profile</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" SkinID="AccountLink" CssClass="headerLink2" NavigateUrl="~/MyAccount/Upload.aspx">Model Upload</asp:HyperLink>
        <asp:Label ID="UploadTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="MY ACCOUNT"></asp:Label>
    </div>
    
    <div id="published">
            <asp:SqlDataSource ID="PublishedDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT DISTINCT TOP 3 [User].Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate, Product.ProductID 
                FROM [User] INNER JOIN Product ON [User].UserID = Product.UserID INNER JOIN Picture ON Product.ProductID = Picture.ProductID 
                WHERE (Picture.PrimaryPic = N'yes') AND ([User].Username = @UserName) ORDER BY [User].Username">

                <SelectParameters>
                    <cc1:UserParameter Name="UserName" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="PurchasedDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT DISTINCT TOP (3) User_1.Username, Picture.ImagePath, Product.Name, Product.Price, Product.PublishedDate, Product.ProductID 
                FROM (SELECT LineItem.ProductID FROM LineItem INNER JOIN Invoice ON LineItem.InvoiceNum = Invoice.InvoiceNum INNER JOIN [User] 
                    ON Invoice.UserID = [User].UserID WHERE ([User].Username = @UserName)) AS b 
                INNER JOIN Product ON b.ProductID = Product.ProductID INNER JOIN [User] AS User_1 ON Product.UserID = User_1.UserID 
                INNER JOIN Picture ON Product.ProductID = Picture.ProductID 
                WHERE (Picture.PrimaryPic = N'yes') ORDER BY User_1.Username">

                <SelectParameters>
                    <cc1:UserParameter Name="UserName" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:Label ID="Label1" runat="server" Font-Size="1.5em" Text="Models Published"></asp:Label>
            <asp:Button ID="SeeAllBTN" runat="server" Text="See All.." SkinID="SubmissionsBTN" CommandName="SeeAll" CssClass="myAccountBTN" OnClick="SeeAllBTN_Click"  ></asp:Button>

            <asp:Repeater ID="PublishedRepeater" runat="server" DataSourceID="PublishedDataSource1" OnItemCommand="PublishedRepeater_ItemCommand">
                <HeaderTemplate>
                   
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="artistLgMin">
                        <asp:HiddenField ID="HiddenProduct" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:Image ID="LargeMinBG" CssClass="artistLgMin2" runat="server" ImageUrl="~/App_Themes/Green/images/light_blue_med.png" />
                        <asp:Image ID="artistAvatar" CssClass="artistAvatar" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="111" Width="113" />
                        <asp:Image ID="artistNameBG" CssClass="avatarNameBG" runat="server" ImageUrl="~/App_Themes/Green/images/light_border.png" />
                        <asp:LinkButton ID="artistNameLBL" runat="server" CssClass="artistNameLBL" SkinID="ArtistNameLink" Text='<%# Eval("Name") %>' CommandName="ModelName"></asp:LinkButton>
                        <asp:Label ID="PubLBL" runat="server" CssClass="pubDateLBL" Font-Size="1.3em" Text="Published"></asp:Label>
                        <asp:Label ID="dateJoinedLBL" runat="server" CssClass="dateJoinedLBL" Font-Size="1.3em" Text='<%# "$" + Eval("Price") %>'></asp:Label>
                        <asp:Image ID="artistDetailsBG" CssClass="artistDetailsBG" runat="server" ImageUrl="~/App_Themes/Green/images/dark_border.png" />
                        <asp:Button ID="editBTN" CssClass="editBTN" runat="server" SkinID="NormalBTN" Text="Edit" CommandName="ExpandsOrCloses" />
                        <div class="subBy">
                            <asp:Label ID="Label2" SkinID="BoldWhite" runat="server" Text="by"></asp:Label>
                            <asp:LinkButton ID="AccountArtist" SkinID="BoldOrange" runat="server" Text='<%# Eval("Username") %>' CommandName="ArtistName" ></asp:LinkButton>
                        </div>
                        <asp:Label ID="SubmissionLBL" CssClass="pubDate" SkinID="BoldWhite" runat="server" Text='<%# Model.formatString((DateTime)Eval("PublishedDate")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    
                </FooterTemplate>
            </asp:Repeater>

            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Green/images/hr_line.png" /><br /><br />
            <asp:Label ID="Label3" runat="server" Font-Size="1.5em" Text="Models Purchased"></asp:Label>
            <asp:Button ID="SeeAllBTN2" runat="server" Text="See All.." SkinID="SubmissionsBTN" CommandName="SeeAll" CssClass="myAccountBTN" OnClick="SeeAllBTN2_Click"  ></asp:Button>

            <asp:Repeater ID="PurchasedRepeater" runat="server" DataSourceID="PurchasedDataSource1" OnItemCommand="PurchasedRepeater_ItemCommand">
                <HeaderTemplate>
                   
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="artistLgMin">
                        <asp:HiddenField ID="HiddenProduct" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:Image ID="LargeMinBG" CssClass="artistLgMin2" runat="server" ImageUrl="~/App_Themes/Green/images/light_blue_med.png" />
                        <asp:Image ID="artistAvatar" CssClass="artistAvatar" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="111" Width="113" />
                        <asp:Image ID="artistNameBG" CssClass="avatarNameBG" runat="server" ImageUrl="~/App_Themes/Green/images/light_border.png" />
                        <asp:LinkButton ID="artistNameLBL" runat="server" CssClass="artistNameLBL" SkinID="ArtistNameLink" Text='<%# Eval("Name") %>' CommandName="ModelName"></asp:LinkButton>
                        <asp:Label ID="PubLBL" runat="server" CssClass="pubDateLBL" Font-Size="1.3em" Text="Published"></asp:Label>
                        <asp:Label ID="dateJoinedLBL" runat="server" CssClass="dateJoinedLBL" Font-Size="1.3em" Text='<%# "$" + Eval("Price") %>'></asp:Label>
                        <asp:Image ID="artistDetailsBG" CssClass="artistDetailsBG" runat="server" ImageUrl="~/App_Themes/Green/images/dark_border.png" />
                        <asp:Button ID="editBTN" CssClass="editBTN" runat="server" SkinID="NormalBTN" Text="Edit" CommandName="ExpandsOrCloses" />
                        <div class="subBy">
                            <asp:Label ID="Label2" SkinID="BoldWhite" runat="server" Text="by"></asp:Label>
                            <asp:LinkButton ID="AccountArtist" SkinID="BoldOrange" runat="server" Text='<%# Eval("Username") %>' CommandName="ArtistName" ></asp:LinkButton>
                        </div>
                        <asp:Label ID="SubmissionLBL" CssClass="pubDate" SkinID="BoldWhite" runat="server" Text='<%# Model.formatString((DateTime)Eval("PublishedDate")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        
    <br /><br /><br />
</asp:Content>

