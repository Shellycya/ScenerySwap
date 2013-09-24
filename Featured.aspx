<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Featured.aspx.cs" Inherits="Featured" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript" src="js/hover.js"></script>

    <div id="artistHeader">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="ArtistSearchBTN" >
            <img src="App_Themes/Green/images/Header.png" alt="header banner" />
            <!--<asp:Label ID="Label1" runat="server" Text="Artists" SkinID="AccountLabel" CssClass="artistName"></asp:Label>
            <div class="searchBoxDiv">
                <asp:TextBox ID="ArtistSearchTB" CssClass="searchBox" SkinID="RoundBox" runat="server"
                    MaxLength="50"></asp:TextBox>
            </div>
            <asp:Button ID="ArtistSearchBTN" CssClass = "aSearchButton" runat="server" 
                Text="SEARCH ARTISTS" BackColor="#D8E7A7" BorderStyle="None" Height="26px" 
                onclick="ArtistSearchBTN_Click" />-->
            <asp:Label ID="PageNameLBL" runat="server" SkinID="HeaderTitle" 
                CssClass="uploadTitle" Text="Featured Artists"></asp:Label>
        </asp:Panel>
    </div>

     

    <div id="featuredContainer">
        <img src="App_Themes/Green/images/back_box.png" alt="back box" />
        <asp:Image ID="FeaturedIMG" name="FeaturedIMG" CssClass="featImg" runat="server" Width="383px" Height="287px" ImageUrl="~/images/home/game_ready/people.png" />
        <asp:Image ID="Image1" runat="server" CssClass="blueright" ImageUrl="~/App_Themes/Green/images/bluebg.png" />
        <asp:Image ID="Image2" runat="server" CssClass="featuredArtists" ImageUrl="~/App_Themes/Green/images/FeaturedArtists.png" />
        <asp:Label ID="Label2" runat="server" CssClass="checkoutWeek" ForeColor="White" Text="Check out this week's most talented artists."></asp:Label>
        <div class="artistBy">
            <asp:Label ID="featuredModelLink" runat="server" SkinID="BoldBlue" Text="Cloud"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="by"></asp:Label>
            <asp:Label ID="featuredArtistLink" runat="server" ForeColor="#aa6021" Text="Saj1242"></asp:Label>
        </div>
        <div class="floatingFeatured">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/Green/images/floatingBox.png" />
            <asp:Image ID="Arrow1" runat="server" CssClass="arrow1" ImageUrl="~/App_Themes/Green/images/arrowDark.png"  />
            <asp:Image ID="Arrow2" runat="server" CssClass="arrow2" ImageUrl="~/App_Themes/Green/images/arrowDark.png"  />
            <asp:Image ID="Arrow3" runat="server" CssClass="arrow3" ImageUrl="~/App_Themes/Green/images/arrowDark.png"  />
            <asp:Label ID="FeaturedLBL1" runat="server" CssClass="featured1" Font-Size="Small" Text="Featured Artist"></asp:Label>
            <asp:Label ID="FeaturedLBL2" runat="server" CssClass="featured2" Font-Size="Small" Text="Featured Model"></asp:Label>
            <asp:Label ID="FeaturedLBL3" runat="server" CssClass="featured3" Font-Size="Small" Text="Featured Section"></asp:Label>
            <asp:Label ID="FloatArtist" runat="server" CssClass="floatName1" SkinID="BoldBlue" Text="Saj1242" ></asp:Label>
            <asp:Label ID="FloatModel" runat="server" CssClass="floatName2" SkinID="BoldBlue" Text="Cloud"></asp:Label>
            <asp:Label ID="FloatSection" runat="server" CssClass="floatName3" SkinID="BoldBlue" Text="Tanks"></asp:Label>
            <asp:Button ID="FloatArtistBTN" runat="server" CssClass="floatButton1" 
                SkinID="FeaturedBTN" Text="View this Artist's Profile" 
                onclick="FloatArtistBTN_Click" />
            <asp:Button ID="FloatModelBTN" runat="server" CssClass="floatButton2" 
                SkinID="FeaturedBTN" Text="View Model Details" onclick="FloatModelBTN_Click" />
            <asp:Button ID="FloatSectionBTN" runat="server" CssClass="floatButton3" 
                SkinID="FeaturedBTN" Text="View More" onclick="FloatSectionBTN_Click" />
        </div>

        <div class="fArtist1" >
            <asp:Image ID="Image4" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
            <asp:Image ID="AvatarImage1" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
            <asp:Label ID="FeatArtistLBL1" runat="server" SkinID="BoldWhite" CssClass="categoryArtist" Text="Artist1"></asp:Label>
            <asp:LinkButton ID="ProfileLink1" name="ProfileLink1" CssClass="seeProfile" runat="server" 
                onclick="ProfileLink1_Click">See Profile</asp:LinkButton>
            <asp:Button ID="SeeBTN1" name="SeeBTN1" runat="server" CssClass="seeButton" 
                SkinID="FeaturedBTN2" Text="See All..." onclick="SeeBTN1_Click" />
            <asp:Repeater ID="FeatRepeater1" runat="server" 
                onitemdatabound="FeatRepeater1_ItemDataBound" >
                <ItemTemplate>
                    <asp:Image ID="InsideArtistImage" runat="server" CssClass="featRepeaterImageSml" CommandName="ArtistPic" Width="71px" Height="69px"
                        ImageUrl='<%# Eval("mainPic") %>' />
                    <asp:LinkButton ID="Label1" runat="server" ForeColor="#363e48" Font-Size="Smaller" Font-Bold="true" Font-Underline="false" CssClass="featPriceSml" Text='<%# "$" + Eval("price") %>'></asp:LinkButton>
                </ItemTemplate>

                <SeparatorTemplate><span class="insideSpace">&nbsp;</span></SeparatorTemplate>
            </asp:Repeater>
        </div>
        <div class="fArtist2">
            <asp:Image ID="Image5" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
            <asp:Image ID="AvatarImage2" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
            <asp:Label ID="FeatArtistLBL2" runat="server" SkinID="BoldWhite" CssClass="categoryArtist" Text="Artist2"></asp:Label>
            <asp:LinkButton ID="ProfileLink2" CssClass="seeProfile2" runat="server" 
                onclick="ProfileLink2_Click">See Profile</asp:LinkButton>
            <asp:Button ID="SeeBTN2" runat="server" CssClass="seeButton" 
                SkinID="FeaturedBTN2" Text="See All..." onclick="SeeBTN2_Click" />
            <asp:Repeater ID="FeatRepeater2" runat="server" 
                onitemdatabound="FeatRepeater2_ItemDataBound" >
                <ItemTemplate>
                    <asp:Image ID="InsideArtistImage" runat="server" CssClass="featRepeaterImageSml" CommandName="ArtistPic" Width="71px" Height="69px"
                        ImageUrl='<%# Eval("mainPic") %>' />
                    <asp:LinkButton ID="Label1" runat="server" ForeColor="#363e48" Font-Size="Smaller" Font-Bold="true" Font-Underline="false" CssClass="featPriceSml" Text='<%# "$" + Eval("price") %>'></asp:LinkButton>
                </ItemTemplate>

                <SeparatorTemplate><span class="insideSpace">&nbsp;</span></SeparatorTemplate>
            </asp:Repeater>
        </div>
        <asp:Image ID="Image8" runat="server" CssClass="featLine" ImageUrl="~/App_Themes/Green/images/hr_line.png" />

        <div class="fArtist3">
            <asp:Image ID="Image6" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
            <asp:Image ID="AvatarImage3" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
            <asp:Label ID="FeatArtistLBL3" runat="server" SkinID="BoldWhite" CssClass="categoryArtist" Text="Artist3"></asp:Label>
            <asp:LinkButton ID="ProfileLink3" CssClass="seeProfile" runat="server" 
                onclick="ProfileLink3_Click">See Profile</asp:LinkButton>
            <asp:Button ID="SeeBTN3" runat="server" CssClass="seeButton" 
                SkinID="FeaturedBTN2" Text="See All..." onclick="SeeBTN3_Click" />
            <asp:Repeater ID="FeatRepeater3" runat="server" 
                onitemdatabound="FeatRepeater3_ItemDataBound" >
                <ItemTemplate>
                    <asp:Image ID="InsideArtistImage" runat="server" CssClass="featRepeaterImageSml" CommandName="ArtistPic" Width="71px" Height="69px"
                        ImageUrl='<%# Eval("mainPic") %>' />
                    <asp:LinkButton ID="Label1" runat="server" ForeColor="#363e48" Font-Size="Smaller" Font-Bold="true" Font-Underline="false" CssClass="featPriceSml" Text='<%# "$" + Eval("price") %>'></asp:LinkButton>
                </ItemTemplate>

                <SeparatorTemplate><span class="insideSpace">&nbsp;</span></SeparatorTemplate>
            </asp:Repeater>
        </div>
        <div class="fArtist4">
            <asp:Image ID="Image7" runat="server" CssClass="categoryHolder" ImageUrl="~/App_Themes/Green/images/gray_background.png"></asp:Image>
            <asp:Image ID="AvatarImage4" runat="server" CssClass="categoryImage" Width="111px" Height="108px"
                ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
            <asp:Label ID="FeatArtistLBL4" runat="server" SkinID="BoldWhite" CssClass="categoryArtist" Text="Artist4"></asp:Label>
            <asp:LinkButton ID="ProfileLink4" CssClass="seeProfile4" runat="server" 
                onclick="ProfileLink4_Click">See Profile</asp:LinkButton>
            <asp:Button ID="SeeBTN4" runat="server" CssClass="seeButton" 
                SkinID="FeaturedBTN2" Text="See All..." onclick="SeeBTN4_Click" />
            <asp:Repeater ID="FeatRepeater4" runat="server" 
                onitemdatabound="FeatRepeater4_ItemDataBound" >
                <ItemTemplate>
                    <asp:Image ID="InsideArtistImage" runat="server" CssClass="featRepeaterImageSml" CommandName="ArtistPic" Width="71px" Height="69px"
                        ImageUrl='<%# Eval("mainPic") %>' />
                    <asp:LinkButton ID="Label1" runat="server" ForeColor="#363e48" Font-Size="Smaller" Font-Bold="true" Font-Underline="false" CssClass="featPriceSml" Text='<%# "$" + Eval("price") %>'></asp:LinkButton>
                </ItemTemplate>

                <SeparatorTemplate><span class="insideSpace">&nbsp;</span></SeparatorTemplate>
            </asp:Repeater>
        </div>
    </div>
    
    <div style="display: none;">
        <asp:Label ID="HiddenModel11" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel12" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel13" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel21" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel22" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel23" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel31" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel32" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel33" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel41" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel42" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenModel43" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL11" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL12" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL13" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL21" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL22" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL23" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL31" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL32" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL33" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL41" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL42" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenURL43" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre11" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre12" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre13" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre21" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre22" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre23" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre31" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre32" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre33" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre41" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre42" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="HiddenGenre43" runat="server" Text="Label"></asp:Label>
        <input type="hidden" id="HiddenArtist" name="HiddenArtist" value = "" />
        <input type="hidden" id="HiddenModel" name="HiddenModel" value = "" />
        <input type="hidden" id="HiddenGenre" name="HiddenGenre" value = "" />
    </div>
    
    
</asp:Content>

