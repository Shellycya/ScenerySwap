<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" MaintainScrollPositionOnPostback="True" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="header">
        <img src="../App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:HyperLink ID="HyperLink1" runat="server" SkinID="AccountLink" CssClass="headerLink1" NavigateUrl="~/Default.aspx">My Account</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" SkinID="AccountLink" CssClass="headerLink2" NavigateUrl="~/Default.aspx">Upload FAQ</asp:HyperLink>
        <asp:Label ID="UploadTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="MODEL UPLOAD"></asp:Label>
    </div>

    <table class="uploadtable">
        <tr>
            <td colspan="3"><asp:Image ID="Image4" runat="server" ImageUrl="~/App_Themes/Green/images/genrebox.png" />
                <asp:Label ID="CategoryLBL" runat="server" Text="Choose Category:*" SkinID="UploadLBL" CssClass="categorylbl"></asp:Label>
                <asp:DropDownList ID="GenreDDL" runat="server" CssClass="genreDDL">
                    <asp:ListItem Value="None">---------------</asp:ListItem>
                    <asp:ListItem Value="1">People</asp:ListItem>
                    <asp:ListItem Value="2">Monsters</asp:ListItem>
                    <asp:ListItem Value="3">Architecture</asp:ListItem>
                    <asp:ListItem Value="4">Nature</asp:ListItem>
                    <asp:ListItem Value="5">Vehicles</asp:ListItem>
                    <asp:ListItem Value="6">Weapons</asp:ListItem>
                    <asp:ListItem Value="7">Armor</asp:ListItem>
                    <asp:ListItem Value="8">Animals</asp:ListItem>
                    <asp:ListItem Value="9">Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MNameLBL" runat="server" SkinID="UploadLBL" Text="Model Name*"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ForeColor="Red" ErrorMessage="*" ControlToValidate="MNameTB"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="PriceLBL" runat="server" SkinID="UploadLBL" Text="Price"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ForeColor="Red" ErrorMessage="*" ControlToValidate="PriceTB"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ErrorMessage="Not a reasonable price" SkinID="ErrorRange" MaximumValue="10000.00" 
                    Type="Currency" MinimumValue=".01" ControlToValidate="PriceTB"></asp:RangeValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="textboxdiv4">
                    <asp:TextBox ID="MNameTB" CssClass="textbox4" runat="server" SkinID="RoundBox" MaxLength="50" ></asp:TextBox>
                </div>
            </td>
            <td>
                <div class="textboxdiv3">
                    <asp:TextBox ID="PriceTB" SkinID="RoundBox" CssClass="textbox3" runat="server" ></asp:TextBox>*
                </div>
             </td>
            <td>
                <asp:Label ID="SLicenseLBL" runat="server" SkinID="UploadLBL" Text="Stand Alone License"></asp:Label>
            </td>
            
            <td>
                <asp:Image ID="infoIMG" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" />
            </td>
        
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <div class="textboxdiv3">
                    <asp:TextBox ID="Price2TB" SkinID="RoundBox" CssClass="textbox3" runat="server" 
                        Height="16px" ></asp:TextBox><br /><br />
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ErrorMessage="Not a reasonable price" SkinID="ErrorRange" MaximumValue="10000.00" 
                    Type="Currency" MinimumValue=".01" ControlToValidate="Price2TB"></asp:RangeValidator>
                </div>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" SkinID="UploadLBL" Text="Commercial License"></asp:Label>
            </td>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" />
            </td>
        </tr>
    </table>
        
    <div id="descSection">   
    <asp:Label ID="MDescLBL" runat="server" SkinID="UploadLBL" Text="Model Description*"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ForeColor="Red" ErrorMessage="*" ControlToValidate="DescTB"></asp:RequiredFieldValidator>
    <div class="textboxdiv6">
        <asp:TextBox ID="DescTB" CssClass="textbox6" runat="server" 
             Rows="5" TextMode="MultiLine" Font-Names="Arial"></asp:TextBox>
    </div>
    <a name="thumbtop"></a>       
    <asp:Label ID="TagLBL" runat="server" SkinID="UploadLBL" Text="Search Tags"></asp:Label>
    <div class="textboxdiv5">
        <asp:TextBox ID="TagTB" SkinID="RoundBox" CssClass="textbox5" runat="server" Rows="5"></asp:TextBox>
    </div>
    <asp:Label ID="ModelLBL" runat="server" SkinID="UploadLBL" Text="Program Used to Create Model"></asp:Label>
    <div class="textboxdiv3">
        <asp:TextBox ID="ModelTB" SkinID="RoundBox" CssClass="textbox3" runat="server" Rows="5"></asp:TextBox>
    </div>
        
    </div>

    <div id="ModelThumbs">
        <table class="uploadtable2" cellspacing="15px" >
            <tr>
                <td colspan='6'>
                    <asp:Label ID="ThumbLBL" runat="server" SkinID="UploadLBL" Text="Upload Thumbnails"></asp:Label>&nbsp;&nbsp;
                    <asp:FileUpload ID="ThumbUpload" runat="server" AllowMultiple="true"  BackColor="White" 
                        BorderColor="White" Font-Bold="True" Font-Size="Medium" ForeColor="Black" />
                    <asp:Button ID="UploadBTN" runat="server" Text="Add Image" 
                        onclick="UploadBTN_Click" PostBackUrl="#thumbtop" 
                        CausesValidation="False" Font-Size="Medium" 
                        Height="28px" />
                    <asp:RegularExpressionValidator ID="ModelUploadValidator" runat="server" 
                        ErrorMessage="The image must end in either .jpg, .png, .gif, or .bmp." 
                        ControlToValidate="ThumbUpload" SkinID="ErrorMessage"
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.gif|.GIF|.bmp|.BMP|.tga|.TGA)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:Label ID="NoNameLBL2" runat="server" Text="" ForeColor="Red" Font-Size="11px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr class="picRow">
                <td>
                    <asp:ImageButton ID="leftArrowThumb" runat="server" CssClass="leftArrow" ImageUrl="~/App_Themes/Green/images/leftArrowDisabled.png" 
                        OnClick="leftArrowThumb_Click" Visible="False" PostBackUrl="#thumbtop" CausesValidation="False" />
                    <asp:ImageButton ID="tempThumbIMG1" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG1_Click" />
                    <asp:ImageButton ID="thumbDelete1" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete1_Click" />
                </td>
                <td><asp:ImageButton ID="tempThumbIMG2" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG2_Click" />
                    <asp:ImageButton ID="thumbDelete2" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete2_Click" />
                </td>
                <td><asp:ImageButton ID="tempThumbIMG3" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG3_Click" />
                    <asp:ImageButton ID="thumbDelete3" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete3_Click" />
                </td>
                <td><asp:ImageButton ID="tempThumbIMG4" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG4_Click" />
                    <asp:ImageButton ID="thumbDelete4" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete4_Click" />
                </td>
                <td><asp:ImageButton ID="tempThumbIMG5" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG5_Click" />
                    <asp:ImageButton ID="thumbDelete5" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete5_Click" />
                </td>
                <td><asp:ImageButton ID="tempThumbIMG6" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" PostBackUrl="#thumbtop" CausesValidation="False" OnClick="tempThumbIMG6_Click" />
                    <asp:ImageButton ID="thumbDelete6" runat="server" CssClass="deletePic" PostBackUrl="#thumbtop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="thumbDelete6_Click" />
                    <asp:ImageButton ID="rightArrowThumb" runat="server" CssClass="rightArrow" ImageUrl="~/App_Themes/Green/images/rightArrowDisabled.png" 
                        OnClick="rightArrowThumb_Click" Visible="False" PostBackUrl="#thumbtop" CausesValidation="False" />
                </td>
            </tr>

        </table>
    </div>
    
    <table cellspacing="8px" width="95%" id="modelDetails">
        <tr>
            <td><asp:Label ID="Label4" runat="server" SkinID="UploadLBL" Text="Geometry"></asp:Label></td>
            <td><asp:Label ID="Label5" runat="server" SkinID="UploadLBL" Text="Textures"></asp:Label></td>
            <td><asp:Label ID="Label6" runat="server" SkinID="UploadLBL" Text="Materials"></asp:Label></td>
            <td><asp:Label ID="Label7" runat="server" SkinID="UploadLBL" Text="Rigged"></asp:Label></td>
            <td><asp:Label ID="Label8" runat="server" SkinID="UploadLBL" Text="Animated"></asp:Label></td>
            <td><asp:Label ID="Label9" runat="server" SkinID="UploadLBL" Text="Game Ready"></asp:Label></td>
            <td><asp:Label ID="Label16" runat="server" SkinID="UploadLBL" Text="Mature Content"></asp:Label></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="GeometryRBL" runat="server">
                    <asp:ListItem>Polygons</asp:ListItem>
                    <asp:ListItem>Subdivision</asp:ListItem>
                    <asp:ListItem>Nurbs</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="TexturesRBL" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="MaterialsRBL" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="RiggedRBL" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="AnimatedRBL" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="GameReadyRBL" runat="server">
                    <asp:ListItem Value="Game">Yes</asp:ListItem>
                    <asp:ListItem Value="Hi Res">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RadioButtonList ID="MatureRBL" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            
        </tr>
        <tr>
            <td colspan='3'><asp:Label ID="Label10" runat="server" SkinID="UploadLBL" Text="Polygon Count*"></asp:Label>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ForeColor="Red" ErrorMessage="*" ControlToValidate="PolygonTB"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator3" runat="server" SkinID="ErrorRange" 
                    ErrorMessage="Not a number" Type="Integer" ControlToValidate="PolygonTB" 
                    MaximumValue="10000000" MinimumValue="0"></asp:RangeValidator>
            </td>
            <td colspan='3'><asp:Label ID="Label11" runat="server" SkinID="UploadLBL" Text="Vertices*"></asp:Label>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ForeColor="Red" ErrorMessage="*" ControlToValidate="VerticesTB"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator4" runat="server" SkinID="ErrorRange" 
                    ErrorMessage="Not a number" Type="Integer" ControlToValidate="VerticesTB" MinimumValue="0" MaximumValue="10000000"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td colspan='3'>
                <div class="textboxdiv3">
                    <asp:TextBox ID="PolygonTB" SkinID="RoundBox" CssClass="textbox3" runat="server" ></asp:TextBox>
                </div>
            </td>
            <td colspan='3'>
                <div class="textboxdiv3">
                    <asp:TextBox ID="VerticesTB" SkinID="RoundBox" CssClass="textbox3" runat="server" ></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>

    <table id="uploadModel" cellspacing="25px" width="95%">
        <tr>
        <td>
        <asp:Label ID="UploadMLbl" runat="server" SkinID="UploadLBL" Text="Upload Model"></asp:Label>&nbsp;&nbsp;
                    <asp:FileUpload ID="ModelUpload" runat="server" AllowMultiple="true"  BackColor="White" 
                Font-Bold="True" Font-Names="Arial" Font-Size="Medium" />
                    <asp:Button ID="ModelBtn" runat="server" Text="Add Model" 
                        PostBackUrl="#thumbtop" Font-Size="Medium" 
                        Height="28px" 
                        CausesValidation="False" onclick="ModelBtn_Click" />&nbsp;
                    <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="The image must end in either .jpg, .png, .gif, or .bmp." 
                        ControlToValidate="ModelUpload" SkinID="ErrorMessage"
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.gif|.GIF|.bmp|.BMP)$"></asp:RegularExpressionValidator>-->
        </td>
        </tr>
    </table>
    <div class="addedModels">
        
        <asp:Repeater ID="ModelRepeater" runat="server" OnItemCommand="ModelRepeater_ItemCommand">
            <ItemTemplate>
                <asp:Image ID="ModelBGImg" runat="server" ImageUrl="~/App_Themes/Green/images/dark_border_sml.png"></asp:Image>
                <asp:Label ID="ModelName" runat="server" CssClass="removeModel" Text="<%# Container.DataItem %>" ForeColor="#e59956" Font-Bold="true"></asp:Label>
                <asp:Button ID="RemoveModelBTN" runat="server" CssClass="removeButton" SkinID="UploadBTN" Text="Remove..." />
            </ItemTemplate>
            <SeparatorTemplate><br /></SeparatorTemplate>
        </asp:Repeater>

    </div>
    <a name="texturetop"></a>
    <div id="ModelTextures">
        <table class="uploadtable2" cellspacing="15px">
            <tr>
                <td colspan='6'>
                    <asp:Label ID="TextureLBL" runat="server" SkinID="UploadLBL" Text="Upload Textures"></asp:Label>&nbsp;&nbsp;
                    <asp:FileUpload ID="TextureUpload" runat="server" AllowMultiple="true"  BackColor="White" 
                        Font-Bold="True" Font-Size="Medium" />
                    <asp:Button ID="TextureBtn" runat="server" Text="Add Texture" 
                        PostBackUrl="#texturetop" Font-Size="Medium" 
                        Height="28px" CausesValidation="False" onclick="TextureBtn_Click" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="The image must end in either .jpg, .png, .gif, .tga, or .bmp." 
                        ControlToValidate="TextureUpload" SkinID="ErrorMessage"
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.gif|.GIF|.bmp|.BMP|.tga|.TGA)$" 
                        Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:Label ID="NoNameLBL" runat="server" Text="" ForeColor="Red" Font-Size="11px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr class="picRow">
                <td>
                    <asp:ImageButton ID="leftArrowTexture" runat="server" CssClass="leftArrow" ImageUrl="~/App_Themes/Green/images/leftArrowDisabled.png" 
                        PostBackUrl="#texturetop" CausesValidation="False" OnClick="leftArrowTexture_Click" Visible="False" />
                    <asp:ImageButton ID="tempTextureIMG1" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture1" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture1_Click" />
                </td>
                <td><asp:ImageButton ID="tempTextureIMG2" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture2" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture2_Click" />
                </td>
                <td><asp:ImageButton ID="tempTextureIMG3" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture3" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture3_Click" />
                </td>
                <td><asp:ImageButton ID="tempTextureIMG4" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture4" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture4_Click" />
                </td>
                <td><asp:ImageButton ID="tempTextureIMG5" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture5" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture5_Click" />
                </td>
                <td><asp:ImageButton ID="tempTextureIMG6" runat="server" ImageUrl="~/App_Themes/Green/images/tempThumbnail.png" />
                    <asp:ImageButton ID="deleteTexture6" runat="server" CssClass="deletePic" PostBackUrl="#texturetop" ImageUrl="~/App_Themes/Green/images/delete.png" CausesValidation="False" OnClick="deleteTexture6_Click" />
                    <asp:ImageButton ID="rightArrowTexture" runat="server" CssClass="rightArrow" ImageUrl="~/App_Themes/Green/images/rightArrowDisabled.png" 
                        PostBackUrl="#texturetop" CausesValidation="False" OnClick="rightArrowTexture_Click" Visible="False" />
                </td>
            </tr>
        </table><br />
    </div> 
    
    <asp:Button ID="PrevBTN" SkinID="UploadBTN" runat="server" Text="Preview" 
            onclick="PreviewBTN_Click" CssClass="previewUpload" />
    <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

    
</asp:Content>


