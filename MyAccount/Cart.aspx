<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="MyAccount_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" language="javascript">
        function redirect() {
            location.href = "../Default.aspx";
        }
    </script>
    <div id="header">
        <img src="../App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:HyperLink ID="HyperLink1" runat="server" SkinID="AccountLink" CssClass="headerLink1" NavigateUrl="~/Default.aspx">My Account</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" SkinID="AccountLink" CssClass="headerLink2" NavigateUrl="~/MyAccount/Upload.aspx">Model Upload</asp:HyperLink>
        <asp:Label ID="UploadTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="SHOPPING CART"></asp:Label>
    </div>

    <div class="cartSummary">
        <asp:Label ID="SubtotalLBL" runat="server" CssClass="subLabel" Text="Subtotal:" Font-Names="hobo std" 
            Font-Size="24px" ForeColor="#B65A17"></asp:Label>&nbsp;&nbsp;
        <asp:Label ID="TotalLBL" runat="server" Text="$0" Font-Bold="true" Font-Size="24px"></asp:Label>
        <asp:Label ID="Label2" runat="server" CssClass="changeQuestion" SkinID="CartSmallLBL" Text="Make any changes below?"></asp:Label>
        <asp:Button ID="UpdateBTN" runat="server" CssClass="cartUpdateButton" SkinID="CartBTN" Text="Update"></asp:Button>
    </div>

    <div id="shoppingCart">
        
        <asp:Repeater ID="CartRepeater" runat="server" 
            onitemcommand="CartRepeater_ItemCommand">
            <HeaderTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Green/images/controls/cartheader.png" />
                
            </HeaderTemplate>
                
            <ItemTemplate>
                <div class="cartItem">
                    <asp:Label ID="Label1" runat="server" SkinID="CartSmallLBL" CssClass="cartTopLabel" Text="Item added on "></asp:Label>
                    <asp:Label ID="Label3" runat="server" SkinID="CartSmallLBL" Text='<%# Eval("date") %>'></asp:Label>
                    <asp:Label ID="Label4" runat="server" SkinID="CartSmallLBL" CssClass="cartPricetypeLabel" Text='<%# Eval("license") %>'></asp:Label><br />
                    <asp:Image ID="PicImage" runat="server" CssClass="cartImage" Width="70px" Height="70px" ImageUrl='<%# Eval("imgPath") %>' />
                    <asp:Label ID="Label5" runat="server" ForeColor="#113c6b" Font-Size="18px" Font-Bold="true" CssClass="cartName" Text='<%# Eval("name") %>'></asp:Label>
                    <asp:Label ID="PriceLBL" runat="server" Font-Bold="true" Font-Size="18px" CssClass="cartPriceLabel" Text='<%# Eval("price") %>'></asp:Label>
                    <asp:Label ID="Label7" runat="server" Font-Bold="true" Font-Size="18px" CssClass="cartQuantityLabel" Text='<%# Eval("quantity") %>'></asp:Label><br />
                    <asp:Label ID="Label8" runat="server" SkinID="CartSmallLBL" CssClass="cartExtLabel" Text='<%# Eval("exts") %>'></asp:Label>
                    <asp:Label ID="Label9" runat="server" CssClass="cartCreatedLabel" Text="Created by"></asp:Label>
                    <asp:Label ID="Label10" runat="server" CssClass="cartCreatorLabel" ForeColor="#113c6b" Text='<%# Eval("username") %>'></asp:Label>
                    <asp:LinkButton ID="DeleteBTN" runat="server" ForeColor="Black" Font-Underline="false" SkinID="CartLinkBTN" Text="&nbsp;&nbsp;&nbsp;Delete"></asp:LinkButton>
                </div>
            </ItemTemplate>

            <SeparatorTemplate>
                <asp:Image ID="SepIMG" runat="server" ImageUrl="~/App_Themes/Green/images/hr_line.png" />
            </SeparatorTemplate>

            <FooterTemplate>
               
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <br />
    <asp:Label ID="ErrorMessage" runat="server" Text=""></asp:Label>
    <asp:Button ID="CheckoutBTN" runat="server" SkinID="CartCheckoutBTN" 
        CssClass="checkoutButton" Text="Proceed To Checkout" 
        onclick="CheckoutBTN_Click" /><br /><br /><br />
    <asp:Button ID="RedirectBTN" runat="server" Visible="false" Text="Button" OnClientClick="redirect(); return false" OnClick="RedirectBTN_Click" />
    
 
</asp:Content>

