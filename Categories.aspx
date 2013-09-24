<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
        <img src="App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:Label ID="CategoryLBL" runat="server" SkinID="LoginHeader" CssClass="loginTitle" ></asp:Label>
        <asp:Label ID="ResultsLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text=""></asp:Label>
    </div>

    <asp:Label ID="NoResultsLBL" runat="server" CssClass="noresultslabel" 
        Font-Names="Estrangelo Edessa" Font-Size="2em"></asp:Label>

    <div id="repeaterContainer">
        <div id="artistTable">

        <asp:SqlDataSource ID="SqlDataSourcePriceDesc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
            
            SelectCommand="SELECT Picture.ImagePath, Product.Price 
            FROM Picture INNER JOIN Product ON Picture.ProductID = Product.ProductID INNER JOIN Genre ON Product.GenreID = Genre.GenreID
            WHERE ([Product].MediaType = @MediaType) AND ([Genre].LongName = @LongName) AND Picture.PrimaryPic = 'yes'
            ORDER BY Product.Price DESC">
            
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenModelType" Name="MediaType" 
                        PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="HiddenCategory" Name="LongName" 
                        PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

            <asp:HiddenField ID="HiddenModelType" runat="server" />
            <asp:HiddenField ID="HiddenCategory" runat="server" />
           <!--<asp:SqlDataSource ID="SqlDataSourceArtists" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT DISTINCT [User].AvatarPic, [User].Username  
                FROM [User] INNER JOIN Product ON [User].UserID = Product.UserID INNER JOIN Genre ON Product.GenreID = Genre.GenreID 
                WHERE ([Product].MediaType = @MediaType) AND ([Genre].LongName = @LongName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenModelType" Name="MediaType" 
                            PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="HiddenCategory" Name="LongName" 
                            PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource> -->

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                SkinID="PurpleGrid" AllowPaging="True" 
                PageSize="6">
                <Columns>
                    <asp:ImageField DataImageUrlField="AvatarPic" ControlStyle-Width="30" 
                        ControlStyle-Height = "30" HeaderText="Artists" >
                    <ControlStyle Height="30px" Width="30px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="Username" 
                        SortExpression="Username" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1Thumbs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
            
            SelectCommand="SELECT Picture.ImagePath, Product.Price 
            FROM Picture INNER JOIN Product ON Picture.ProductID = Product.ProductID INNER JOIN Genre ON Product.GenreID = Genre.GenreID
            WHERE ([Product].MediaType = @MediaType) AND ([Genre].LongName = @LongName) AND Picture.PrimaryPic = 'yes'
            ORDER BY Product.Price">
            
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenModelType" Name="MediaType" 
                        PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="HiddenCategory" Name="LongName" 
                        PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


        <div id="ProductContainer" class="productContainer" runat="server">
            <div id="SortBar">
                <asp:Image ID="BarIMG" runat="server" CssClass="filterbg" ImageUrl="~/App_Themes/Green/images/controls/filter_bar.png" />
                <div class="sortBy">
                    <asp:Label ID="SortbyLBL" runat="server" Font-Size="Small" Text="Sort By:"></asp:Label>
                    <asp:DropDownList ID="SortDDL" CssClass="pagenumDDL" runat="server" 
                        AutoPostBack="True" Height="18px" Width="106px">
                        <asp:ListItem>Price</asp:ListItem>
                        <asp:ListItem>Price High</asp:ListItem>
                        <asp:ListItem>Newest</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="pageCount">
                    <asp:Label ID="ItemsLBL" runat="server" Font-Size="Small" Text="Items Per Page:"></asp:Label>
                    <asp:DropDownList ID="PageDDL" CssClass="pagenumDDL" runat="server" 
                        OnSelectedIndexChanged="PageDDL_change" AutoPostBack="True" Height="20px"  
                        Width="45px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem Selected="True">15</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="prevNextButtons">
                    <asp:ImageButton ID="cmdPrev" runat="server" ImageUrl="~/App_Themes/Green/images/controls/filterPrev_button.png" OnClick="cmdPrev_Click" />
                    <asp:Label ID="lblCurrentPage" runat="server" Text="10 of 30"></asp:Label>
                    <asp:ImageButton ID="cmdNext" runat="server" ImageUrl="~/App_Themes/Green/images/controls/filterNext_button.png" OnClick="cmdNext_Click" />
                </div>
            </div>
        <asp:Repeater ID="ThumbRepeater" runat="server" onitemcommand="R1_ItemCommand">
            <HeaderTemplate>
                <table><tr><td>
                
            </HeaderTemplate>
            <ItemTemplate>
                <div class="modelCell" style="display: inline;">
                    <asp:Image ID="PicImage" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                        ImageUrl='<%# Eval("ImagePath") %>' />
                    <asp:Label ID="Label1" runat="server" SkinID="BoldWhite" CssClass="categoryPrice" Text='<%# Eval("price") %>'></asp:Label>
                    <asp:LinkButton ID="PreviewLink" CssClass="categoryPreview" runat="server" CommandName="info">Info</asp:LinkButton>
                    <asp:Image ID="Image1" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
                    <div style="clear: both" runat="server" visible="<%# (Container.ItemIndex+1) % 5 == 0 %>"></div>
                </div>
            </ItemTemplate>

            <FooterTemplate>
               </td></tr></table>
            </FooterTemplate>
        </asp:Repeater>
        </div>
    </div><br /><br />

</asp:Content>

