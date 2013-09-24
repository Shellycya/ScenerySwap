<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="memberBody">
        <div id="memberHeader">
            <img src="App_Themes/Green/images/Header.png" alt="header banner" />
            <asp:HyperLink ID="HyperLink1" runat="server" SkinID="AccountLink" CssClass="headerLink1" NavigateUrl="~/Default.aspx">My Account</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" SkinID="AccountLink" CssClass="headerLink2" NavigateUrl="~/Default.aspx">Upload FAQ</asp:HyperLink>
            <asp:Label ID="MemberTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="Member Profile"></asp:Label>
        </div>

        <div class="userBox">
            <img src="App_Themes/Green/images/controls/userbox.png" alt="user box" />
            <asp:Image ID="AvatarPic2" CssClass="avatar" runat="server" ImageUrl="~/App_Themes/Green/images/avatar_default.png" />
            <asp:Label ID="MemberName" runat="server" SkinID="NameTitle" CssClass="memberName" ForeColor="#424341" Text="Shellycya" />
        </div>

        <div id="memberInfo">
            <asp:Label ID="Label1" runat="server" SkinID="MemberHeader" Text="Email"></asp:Label><br />
            <asp:Label ID="MemberEmail" CssClass="memberData" runat="server" SkinID="MemberData" Text=""></asp:Label><br /><br />
            <asp:Label ID="Label2" runat="server" SkinID="MemberHeader" Text="Profession"></asp:Label><br />
            <asp:Label ID="MemberProfession" CssClass="memberData" runat="server" SkinID="MemberData" Text=""></asp:Label><br /><br />
            <asp:Label ID="Label3" runat="server" SkinID="MemberHeader" Text="Website"></asp:Label><br />
            <asp:HyperLink ID="MemberWebsite" CssClass="memberData" SkinID="MemberLink" Font-Underline="true" runat="server"></asp:HyperLink><br /><br />

        </div>
        <div class="memberHeader2">
            <img src="App_Themes/Green/images/controls/header_notext.png" alt="header banner" />
            <asp:Label ID="SubmittedByLBL" CssClass="submittedBy" runat="server" Text="Label" Font-Italic="true" ForeColor="#94CADB" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label4" runat="server" CssClass="clickView" ForeColor="White" Text="Click To View"></asp:Label>
        </div>
        
        <div id="memberPics">
            <asp:SqlDataSource ID="SqlDataSourceImagePrice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
            
                
                SelectCommand="SELECT Picture.ImagePath, Product.Price FROM Picture 
                    INNER JOIN Product ON Picture.ProductID = Product.ProductID 
                    INNER JOIN [User] ON Product.UserID = [User].UserID 
                    WHERE ([User].Username = @MemberUser) AND (Picture.PrimaryPic = 'yes') 
                    ORDER BY Product.Price DESC">

            
                <SelectParameters>
                    <asp:ControlParameter ControlID="MemberName" Name="MemberUser" 
                            PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Repeater ID="MemberRepeater" runat="server" 
                onitemcommand="MemberRepeater_ItemCommand" 
                DataSourceID="SqlDataSourceImagePrice">
                <HeaderTemplate>
                    <table class="memberTable" cellpadding='0px' cellspacing='0px'><tr><td>
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="modelCell" style="display: inline;">
                        <asp:Image ID="MemImage" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                            ImageUrl='<%# Eval("ImagePath") %>' />
                        <asp:Label ID="Label1" runat="server" SkinID="BoldWhite" CssClass="categoryPrice" Text='<%# Eval("price") %>'></asp:Label>
                        <asp:LinkButton ID="PreviewLink" CssClass="categoryPreview" runat="server">Info</asp:LinkButton>
                        <asp:Image ID="MBG1" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                    </td></tr></table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>

