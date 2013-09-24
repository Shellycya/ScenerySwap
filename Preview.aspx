<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Preview.aspx.cs" Inherits="Preview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenProductID" runat="server" />
    <div id="header">
        <img src="App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:Label ID="GenreLBL" CssClass="genreLabel" SkinID="HeaderTitle" runat="server" Text=""></asp:Label>
        <asp:Image ID="Image1" runat="server" CssClass="menuLine1" 
            ImageUrl="~/App_Themes/Green/images/vMenuLine.png" />
        <asp:Label ID="Label1" runat="server" Text="Created In" CssClass="createin" ForeColor="White"></asp:Label>
        <asp:HyperLink ID="ProgramLink" CssClass="createin2" runat="server">HyperLink</asp:HyperLink>
        <asp:Image ID="Image2" runat="server" CssClass="menuLine2" 
            ImageUrl="~/App_Themes/Green/images/vMenuLine.png" />
        <asp:Label ID="Label2" runat="server" Text="Created By" CssClass="createin3" ForeColor="White"></asp:Label>
        <asp:LinkButton ID="UserLink" CssClass="createin4" runat="server" 
            SkinID="LtBlueLink" onclick="UserLink_Click">LinkButton</asp:LinkButton>
        <asp:Image ID="Image3" runat="server" CssClass="menuLine3" 
            ImageUrl="~/App_Themes/Green/images/vMenuLine.png" />
        <asp:Label ID="ModelPriceLBL" runat="server" SkinID="HeaderTitle" CssClass="priceLabel" Text=""></asp:Label>
    </div>

    <div id="previewThumbs">
        <div id="descriptor">
            <asp:Label ID="ModelTypeLBL" runat="server" Text="" 
                ForeColor="#17336C" Font-Size="Large"></asp:Label>
            <asp:Label ID="GenreLBL2" runat="server" ForeColor="#17336C" Text="" Font-Size="Large"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Thumbnails - Cick To Enlarge" CssClass="thumbnailLabel" Font-Size="Large"></asp:Label>
            <table width="100%" cellpadding="10px" >
                <tr>
                    <td class="thumbContainer"><asp:Image ID="Background1" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:HyperLink rel="lightbox[thumbs]" ID="Thumbnail1" runat="server" CssClass="previewThumb" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background2" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:HyperLink rel="lightbox[thumbs]" ID="Thumbnail2" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background3" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:HyperLink rel="lightbox[thumbs]" ID="Thumbnail3" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background4" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:HyperLink rel="lightbox[thumbs]" ID="Thumbnail4" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background5" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:HyperLink rel="lightbox[thumbs]" ID="Thumbnail5" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                </tr>
                <tr>
                    <td class="thumbContainer"><asp:Image ID="Background6" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail6" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background7" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail7" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background8" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail8" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background9" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail9" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background10" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail10" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                </tr>
                <tr>
                    <td class="thumbContainer"><asp:Image ID="Background11" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail11" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background12" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail12" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background13" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail13" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background14" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail14" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                    <td class="thumbContainer"><asp:Image ID="Background15" runat="server" ImageUrl="~/App_Themes/Green/images/blue_background.png" />
                        <asp:Hyperlink rel="lightbox[thumbs]" ID="Thumbnail15" runat="server" CssClass="previewThumb" ImageUrl="" /></td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="Tags:"></asp:Label>
        <asp:Label ID="TagsLBL" runat="server" ForeColor="#17336C" ></asp:Label>
    </div>

    <asp:Button ID="CartBTN" runat="server" CssClass="previewCart" 
        SkinID="PreviewBTN" Text="ADD TO CART" onclick="CartBTN_Click" />

    <div id="previewTables"> 
        <div id="leftTables">
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="ModelsDataContext" EntityTypeName="" TableName="Products" 
                Where="ProductID == @ProductID">
                <WhereParameters>
                    <asp:ControlParameter ControlID="HiddenProductID" Name="ProductID" 
                        PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:SqlDataSource ID="SqlDataSourceModelDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT [Polygons], [Vertices], [Textures], [Materials], [Rigged], [Animated], [GameReady] FROM [Product] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenProductID" Name="ProductID" 
                        PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDataSourcePriceDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT [Price], [Price_Commercial], [QualityCheck] FROM [Product] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenProductID" Name="ProductID" 
                        PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceDownloadDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ScenerySwapConnectionString1 %>" 
                SelectCommand="SELECT [Program], [Version], [Extension], [Size] FROM [DownloadType] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenProductID" Name="ProductID" 
                        PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        
            <asp:DetailsView ID="DetailsView1" runat="server" SkinID="PurpleDetails" 
                DataSourceID="SqlDataSourceModelDetails" HeaderText="Model Details">
                <Fields>
                    <asp:BoundField DataField="Polygons" HeaderText="Polygon Count" 
                        SortExpression="Polygons" />
                    <asp:BoundField DataField="Vertices" HeaderText="Vertices" 
                        SortExpression="Vertices" />
                    <asp:BoundField DataField="Textures" HeaderText="Textures" 
                        SortExpression="Textures" />
                    <asp:BoundField DataField="Materials" HeaderText="Materials" 
                        SortExpression="Materials" />
                    <asp:BoundField DataField="Rigged" HeaderText="Rigged" 
                        SortExpression="Rigged" />
                    <asp:BoundField DataField="Animated" HeaderText="Animated" 
                        SortExpression="Animated" />
                    <asp:BoundField DataField="GameReady" HeaderText="Game Ready" 
                        SortExpression="GameReady" />
                </Fields>
            </asp:DetailsView>
            <br />
        
            <asp:DetailsView ID="DetailsView2" runat="server" 
                AutoGenerateRows="False" DataSourceID="SqlDataSourcePriceDetails" 
                HeaderText="Product License" SkinID="PurpleDetails">
                <Fields>
                    <asp:BoundField DataField="Price" HeaderText="Stand Alone License" 
                        SortExpression="Price" />
                    <asp:BoundField DataField="Price_Commercial" HeaderText="Commercial License" 
                        SortExpression="Price_Commercial" />
                    <asp:BoundField DataField="QualityCheck" HeaderText="Checked For Quality" 
                        SortExpression="QualityCheck" />
                </Fields>
            </asp:DetailsView>
            <br />
        </div>

        <div class="textboxdiv7">
            <asp:TextBox ID="PreviewMTB" CssClass="textbox7" runat="server" 
                 Rows="15" TextMode="MultiLine" Font-Names="Arial" ReadOnly="True"></asp:TextBox>
        </div>
        
        <div id="previewControls">
            <div class="previewButtons">
                <asp:Button ID="EditBTN" runat="server" SkinID="PreviewBTN" Text="EDIT" />
                <asp:Button ID="PublishBTN" runat="server" SkinID="PreviewBTN" Text="SUBMIT" 
                    onclick="PublishBTN_Click" /><br />
                <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
    
    <asp:Image ID="Image4" runat="server" CssClass="hrline" ImageUrl="~/App_Themes/Green/images/hr_line.png" />
    <div class="moreFrom">
        <div class="moreFromLabel">
            <asp:Label ID="MoreFromLBL" runat="server" Text="More From "></asp:Label>
            <asp:LinkButton ID="MoreFromLNK" ForeColor="#17336C" Font-Underline="false" runat="server" 
                onclick="MoreFromLNK_Click"></asp:LinkButton>
        </div>
        <table cellspacing="15px" cellpadding="-5px" class="moreFromTable">
            <tr>
                <td><asp:ImageButton ID="MoreFromIMG1" CssClass="smallThumb" runat="server" onclick="MoreFromIMG1_Click" /></td>
                <td><asp:ImageButton ID="MoreFromIMG2" CssClass="smallThumb" runat="server" onclick="MoreFromIMG2_Click" /></td>
                <td><asp:ImageButton ID="MoreFromIMG3" CssClass="smallThumb" runat="server" onclick="MoreFromIMG3_Click" /></td>
                <td><asp:ImageButton ID="MoreFromIMG4" CssClass="smallThumb" runat="server" onclick="MoreFromIMG4_Click" /></td>
                <td><asp:ImageButton ID="MoreFromIMG5" CssClass="smallThumb" runat="server" onclick="MoreFromIMG5_Click" /></td>
            </tr>
            <tr>
                <td class="smallPrice"><asp:Label ID="PriceLBL1" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="PriceLBL2" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="PriceLBL3" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="PriceLBL4" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="PriceLBL5" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
    <asp:Image ID="Image5" runat="server" CssClass="hrline" ImageUrl="~/App_Themes/Green/images/hr_line.png" />

    <div class="moreFrom">
        <div class="moreFromLabel">
            <asp:Label ID="Label5" runat="server" Text="Related Products"></asp:Label>
        </div>
        <table cellspacing="15px" cellpadding="-5px" class="moreFromTable">
            <tr>
                <td><asp:ImageButton ID="RelatedIMG1" CssClass="smallThumb" runat="server" 
                        onclick="RelatedIMG1_Click" /></td>
                <td><asp:ImageButton ID="RelatedIMG2" CssClass="smallThumb" runat="server" 
                        onclick="RelatedIMG2_Click" /></td>
                <td><asp:ImageButton ID="RelatedIMG3" CssClass="smallThumb" runat="server" 
                        onclick="RelatedIMG3_Click" /></td>
                <td><asp:ImageButton ID="RelatedIMG4" CssClass="smallThumb" runat="server" 
                        onclick="RelatedIMG4_Click" /></td>
                <td><asp:ImageButton ID="RelatedIMG5" CssClass="smallThumb" runat="server" 
                        onclick="RelatedIMG5_Click" /></td>
            </tr>
            <tr>
                <td class="smallPrice"><asp:Label ID="RPriceLBL1" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="RPriceLBL2" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="RPriceLBL3" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="RPriceLBL4" runat="server" Text="Label"></asp:Label></td>
                <td class="smallPrice"><asp:Label ID="RPriceLBL5" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table><br />
    </div>
    <br /><br />
  
   
</asp:Content>

