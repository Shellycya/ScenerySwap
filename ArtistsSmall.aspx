<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="ArtistsSmall.aspx.cs" Inherits="ArtistsSmall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="artistHeader">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="ArtistSearchBTN" >
            <img src="App_Themes/Green/images/Header.png" alt="header banner" />
            <asp:Label ID="Label1" runat="server" Text="Artists" SkinID="AccountLabel" CssClass="artistName"></asp:Label>
            <div class="searchBoxDiv">
                <asp:TextBox ID="ArtistSearchTB" CssClass="searchBox" SkinID="RoundBox" runat="server"
                    MaxLength="50"></asp:TextBox>
            </div>
            <asp:Button ID="ArtistSearchBTN" CssClass = "aSearchButton" runat="server" 
                Text="SEARCH ARTISTS" BackColor="#D8E7A7" BorderStyle="None" Height="26px" 
                onclick="ArtistSearchBTN_Click" />
            <asp:Label ID="ArtistResultsLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="500 Results"></asp:Label>
        </asp:Panel>
    </div>

    <div id="artistContainer">
        <div id="SortBar2">
            <asp:Image ID="BarIMG" runat="server" CssClass="filterbg2" ImageUrl="~/App_Themes/Green/images/controls/filter_bar.png" />
            <div class="sortBy2">
                <asp:Label ID="ArtistSortLBL" runat="server" Font-Size="Small" Text="Sort By:"></asp:Label>
                <asp:DropDownList ID="ArtistSortDDL" CssClass="pagenumDDL" runat="server" 
                    AutoPostBack="True" Height="18px" Width="106px" Font-Size="Small" >
                    <asp:ListItem>Large</asp:ListItem>
                    <asp:ListItem Selected="True">Small</asp:ListItem>
                    <asp:ListItem>Artist</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="pageCount2">
                <asp:Label ID="ItemsLBL" runat="server" Font-Size="Small" Text="Items Per Page:"></asp:Label>
                <asp:DropDownList ID="ArtistPageDDL" CssClass="pagenumDDL" runat="server" 
                    AutoPostBack="True" Height="20px" 
                    Width="45px" onselectedindexchanged="ArtistPageDDL_SelectedIndexChanged" 
                    Font-Size="Small">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem Selected="True">3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>All</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="prevNextButtons2">
                <asp:ImageButton ID="artistCmdPrev" runat="server" 
                    ImageUrl="~/App_Themes/Green/images/controls/filterPrev_button.png" 
                    onclick="artistCmdPrev_Click" />
                <asp:Label ID="lblCurrentPage" runat="server" Text="10 of 30"></asp:Label>
                <asp:ImageButton ID="artistCmdNext" runat="server" 
                    ImageUrl="~/App_Themes/Green/images/controls/filterNext_button.png" 
                    onclick="artistCmdNext_Click" />
            </div>
        </div>
        <asp:Label ID="EnterArtistLBL" runat="server" CssClass="enterArtist" Text="" ForeColor="#b15214" Font-Bold="true"></asp:Label>
        <div id="smallArtistsSml">
            <asp:SqlDataSource ID="ArtistDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT DISTINCT [User].Username, [User].AvatarPic, [User].JoinedDate 
                    FROM [User] INNER JOIN Product ON [User].UserID = Product.UserID ORDER BY [User].Username">
            </asp:SqlDataSource>


            <asp:Repeater ID="ArtistRepeater" runat="server"
                onitemcommand="ArtistRepeater_ItemCommand" 
                onitemdatabound="ArtistRepeater_ItemDataBound">

                <ItemTemplate>
                    <asp:Panel ID="artistSmMin" runat='server' CssClass="artistSmMin">
                        <asp:Image ID="LargeMinBG" CssClass="artistLgMin2" runat="server" ImageUrl="~/App_Themes/Green/images/light_blue_bg_sml.png" />
                        <asp:Image ID="artistAvatar" CssClass="artistAvatarSml" runat="server" ImageUrl='<%# Eval("avatarpic") %>' Height="40" Width="40" />
                        <asp:Image ID="artistNameBG" CssClass="avatarNameBGSml" runat="server" ImageUrl="~/App_Themes/Green/images/light_border_long.png" />
                        <asp:LinkButton ID="artistNameLBL" runat="server" CssClass="artistNameLBLSml" SkinID="ArtistNameLinkSml" Text='<%# Eval("username") %>' CommandName="UserName"></asp:LinkButton>
                        <asp:Label ID="dateJoinedLBL" runat="server" CssClass="dateJoinedLBLSml" Text='<%# "Joined " + Eval("joineddate") %>'></asp:Label>
                        <asp:Image ID="artistDetailsBG" CssClass="artistDetailsBGSml" runat="server" Visible="false" ImageUrl="~/App_Themes/Green/images/dark_border_med.png" />
                        <asp:Button ID="DetailsCloseBTN" CssClass="artistDetailsBTNSml" runat="server" SkinID="NormalBTN" Text="Details" CommandName="ExpandsOrCloses" />
                        <asp:Label ID="SubmissionLBL" CssClass="submissionsSml" Font-Bold="true" runat="server" Text="Show Recent"></asp:Label>
                        <asp:LinkButton ID="seeAllBTN" CssClass="seeAllBTNSml" runat="server" SkinID="NormalLink" Text="See All.." Visible="false" CommandName="SeeAll" /> 
                        
                        <asp:SqlDataSource ID="ArtistDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                
                            SelectCommand="SELECT TOP 5 Picture.ImagePath, Product.Price 
                                FROM Picture INNER JOIN Product ON Picture.ProductID = Product.ProductID INNER JOIN [User] ON Product.UserID = [User].UserID 
                                WHERE (Picture.PrimaryPic = 'yes') AND ([User].Username = @ArtistName) 
                                ORDER BY Product.PublishedDate DESC">

                            <SelectParameters>
                                <asp:ControlParameter ControlID="artistNameLBL" Name="ArtistName" 
                                        PropertyName="Text" Type="String" />
                            </SelectParameters>
                    
                        </asp:SqlDataSource>
                        <div class="insideRepeater2">
                        <asp:Repeater ID="InsideRepeater" runat="server" DataSourceID="ArtistDataSource2" Visible="false" OnItemCommand="InsideRepeater_ItemCommand" >
                            <ItemTemplate>
                                <asp:Image ID="InsideArtistImage" runat="server" CssClass="artistRepeaterImageSml" CommandName="ArtistPic" Width="71px" Height="69px"
                                    ImageUrl='<%# Eval("ImagePath") %>' />
                                <asp:LinkButton ID="Label1" runat="server" ForeColor="#363e48" Font-Bold="true" Font-Underline="false" CssClass="artistPriceSml" Text='<%# "$" + Eval("price") %>'></asp:LinkButton>
                            </ItemTemplate>

                            <SeparatorTemplate><span class="insideSpace">&nbsp;</span></SeparatorTemplate>
                        </asp:Repeater>
                        </div>
                    </asp:Panel>
                </ItemTemplate>

            </asp:Repeater>
        </div>
    </div>

</asp:Content>

