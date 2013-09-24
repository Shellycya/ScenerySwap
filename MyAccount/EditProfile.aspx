<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="MyAccount_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" language="javascript" src="../js/Tooltip.js"></script>

    <div id="header">
        <img src="../App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:HyperLink ID="HyperLink1" runat="server" SkinID="AccountLink" CssClass="headerLink1" NavigateUrl="~/MyAccount/MyAccount.aspx">My Account</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" SkinID="AccountLink" CssClass="headerLink2" NavigateUrl="~/MyAccount/Upload.aspx">Model Upload</asp:HyperLink>
        <asp:Label ID="UploadTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="EDIT PROFILE"></asp:Label>
    </div>

    <div id="memberInfo">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Green/images/controls/blueBox1.png" />
        <asp:Label ID="Label1" runat="server" Text="Member Information" 
            SkinID="BoxHeaderLabel" CssClass="memberLabel"></asp:Label>

        <table class="memberInfoTable">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" SkinID="UploadLBL" Text="First Name*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="fnameTB" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="Label3" runat="server" SkinID="UploadLBL" Text="Last Name*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="lnameTB" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="textboxdiv3">
                        <asp:TextBox ID="fnameTB" CssClass="textbox3" runat="server" SkinID="RoundBox" 
                            MaxLength="50"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div class="textboxdiv2-5">
                        <asp:TextBox ID="lnameTB" CssClass="textbox2-5" runat="server" SkinID="RoundBox"  MaxLength="50"></asp:TextBox>
                    </div>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" SkinID="UploadLBL" Text="Email Address*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="emailTB" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" SkinID="ErrorMessage" 
                        ErrorMessage="Wrong format" ControlToValidate="emailTB" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td><asp:Label ID="Label6" runat="server" SkinID="UploadLBL" Text="Retype Email Address*"></asp:Label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Email's don't match" ControlToCompare="emailTB" 
                        SkinID="ErrorCompare" ControlToValidate="retypeEmailTB"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                 <td>
                    <div class="textboxdiv3">
                        <asp:TextBox ID="emailTB" CssClass="textbox3" SkinID="RoundBox"  runat="server"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div class="textboxdiv3">
                        <asp:TextBox ID="retypeEmailTB" CssClass="textbox3" SkinID="RoundBox"  runat="server"></asp:TextBox>
                    </div>
                </td>
                <td valign="top">
                    <asp:CheckBox ID="DisplayEmailCB" runat="server" />
                    <asp:Label ID="Label7" runat="server" Font-Size="Small" Text="Do Not Display Email"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label8" runat="server" SkinID="UploadLBL" Text="Profession"></asp:Label>&nbsp;
                    </td>
                <td colspan="2"><asp:Label ID="Label9" runat="server" SkinID="UploadLBL" Text="Website"></asp:Label>&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Incorrect URL" SkinID="ErrorMessage"
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ControlToValidate="WebsiteTB"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="textboxdiv3">
                        <asp:TextBox ID="ProfessionTB" CssClass="textbox3" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td colspan="2">
                    <div class="textboxdiv4">
                        <asp:TextBox ID="WebsiteTB" CssClass="textbox4" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:Label ID="Label10" runat="server" SkinID="UploadLBL" Text="Avatar Upload"></asp:Label>&nbsp;&nbsp;
                    <asp:FileUpload ID="AvatarUpload" BorderColor="Black" BackColor="White" runat="server" />
                    <asp:Button ID="UploadBTN" runat="server" BorderColor="Black" Text="Upload" 
                        onclick="UploadBTN_Click" CausesValidation="False" />&nbsp&nbsp
                    <asp:Image ID="AvatarPic2" runat="server" 
                        ImageUrl="~/App_Themes/Green/images/smlDefaultThumb.png" />
                </td>
                <td valign="bottom">
                    <asp:CheckBox ID="MatureCB" runat="server" />
                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="See Mature Content"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="Not a proper picture format" SkinID="ErrorMessage" ControlToValidate="AvatarUpload" 
                        ValidationExpression="^.+(.jpg|.JPG|.png|.PNG|.gif|.GIF|.bmp|.BMP)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>

    <div id="paymentInfo">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/Green/images/controls/blueBox1.png" />
        <asp:Label ID="Label11" runat="server" Text="Payment Information" 
            SkinID="BoxHeaderLabel" CssClass="memberLabel"></asp:Label>

        <table class="paymentTable">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:RadioButton ID="checkRB" runat="server" GroupName="payment" 
                        Checked="True" />
                    <asp:Label ID="Label12" runat="server" SkinID="UploadLBL" Text="Check"></asp:Label>
                    <asp:Image ID="CheckInfoIMG" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" onmouseover="showTooltip(#VALX,#VALY,event)" 
                        ToolTip="ScenerySwap will send you a check once a month if your model was sold the previous month." />

                    <div id="myToolTip" style="position: absolute; visibility: hidden; width:200px; height:100px; margin: 18px 0;
            padding: 18px 20px;
            background-color: white; /* easy rounded corners for modern browsers */
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #c5d9e8;
            padding: 17px 19px;">
<div style="position:absolute;float:left;">
<asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/Green/images/controls/info.png" />
</div>
<div style="position:absolute;left:70px;top:30px;">
 <b><asp:Label ID="lbl" runat="server"></asp:Label></b>
</div>

</div>

                </td>
                <td>
                    <asp:RadioButton ID="paypalRB" runat="server" GroupName="payment" />
                    <asp:Label ID="Label13" runat="server" SkinID="UploadLBL" Text="PayPal"></asp:Label>
                    <asp:Image ID="PaypalInfoIMG" runat="server" ToolTip="ScenerySwap will directly deposit funds into your PayPal account once a month if your model was sold in the previous month."
                        ImageUrl="~/App_Themes/Green/images/controls/info.png" />
                </td>
            </tr>
            <tr><td colspan="4">&nbsp;</td></tr>
            <tr>
                <td colspan="2"><asp:Label ID="Label14" runat="server" SkinID="UploadLBL" Text="Full Name"></asp:Label></td>
                <td colspan="2"><asp:Label ID="Label15" runat="server" SkinID="UploadLBL" Text="Company"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="textboxdiv3-5">
                        <asp:TextBox ID="FullNameTB" CssClass="textbox3-5" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td colspan="2">
                    <div class="textboxdiv3-5">
                        <asp:TextBox ID="CompanyTB" CssClass="textbox3-5" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="Label16" runat="server" SkinID="UploadLBL" Text="Address*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" ControlToValidate="AddressTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td colspan="2"><asp:Label ID="Label17" runat="server" SkinID="UploadLBL" Text="City*"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*" ControlToValidate="CityTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="textboxdiv3-5">
                        <asp:TextBox ID="AddressTB" CssClass="textbox3-5" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td colspan="2">
                    <div class="textboxdiv3-5">
                        <asp:TextBox ID="CityTB" CssClass="textbox3-5" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label18" runat="server" SkinID="UploadLBL" Text="State*"></asp:Label>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*" ControlToValidate="StateTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
                <td><asp:Label ID="Label19" runat="server" SkinID="UploadLBL" Text="Zip Code*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="*" ControlToValidate="ZipTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                        runat="server" ErrorMessage="Wrong Format" SkinID="ErrorMessage" 
                        ControlToValidate="ZipTB" ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                </td>
                <td><asp:Label ID="Label20" runat="server" SkinID="UploadLBL" Text="Country*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="*" ControlToValidate="CountryTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
                <td><asp:Label ID="Label21" runat="server" SkinID="UploadLBL" Text="Telephone*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="*" ControlToValidate="TelephoneTB" 
                        ForeColor="Red"></asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ErrorMessage="(xxx)xxx-xxxx" ControlToValidate="TelephoneTB" 
                        SkinID="ErrorMessage" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="textboxdiv1">
                        <asp:DropDownList ID="StateTB" CssClass="dropdown1" SkinID="RoundBox" runat="server">
                            <asp:ListItem Value="--">--</asp:ListItem>
                            <asp:ListItem Value="AL">AL</asp:ListItem>
                            <asp:ListItem Value="AK">AK</asp:ListItem>
                            <asp:ListItem Value="AZ">AZ</asp:ListItem>
                            <asp:ListItem Value="AR">AR</asp:ListItem>
                            <asp:ListItem Value="CA">CA</asp:ListItem>
                            <asp:ListItem Value="CO">CO</asp:ListItem>
                            <asp:ListItem Value="CT">CT</asp:ListItem>
                            <asp:ListItem Value="DE">DE</asp:ListItem>
                            <asp:ListItem Value="FL">FL</asp:ListItem>
                            <asp:ListItem Value="GA">GA</asp:ListItem>
                            <asp:ListItem Value="HI">HI</asp:ListItem>
                            <asp:ListItem Value="ID">ID</asp:ListItem>
                            <asp:ListItem Value="IL">IL</asp:ListItem>
                            <asp:ListItem Value="IN">IN</asp:ListItem>
                            <asp:ListItem Value="IA">IA</asp:ListItem>
                            <asp:ListItem Value="KS">KS</asp:ListItem>
                            <asp:ListItem Value="KY">KY</asp:ListItem>
                            <asp:ListItem Value="LA">LA</asp:ListItem>
                            <asp:ListItem Value="ME">ME</asp:ListItem>
                            <asp:ListItem Value="MD">MD</asp:ListItem>
                            <asp:ListItem Value="MA">MA</asp:ListItem>
                            <asp:ListItem Value="MI">MI</asp:ListItem>
                            <asp:ListItem Value="MN">MN</asp:ListItem>
                            <asp:ListItem Value="MS">MS</asp:ListItem>
                            <asp:ListItem Value="MO">MO</asp:ListItem>
                            <asp:ListItem Value="MT">MT</asp:ListItem>
                            <asp:ListItem Value="NE">NE</asp:ListItem>
                            <asp:ListItem Value="NV">NV</asp:ListItem>
                            <asp:ListItem Value="NH">NH</asp:ListItem>
                            <asp:ListItem Value="NJ">NJ</asp:ListItem>
                            <asp:ListItem Value="MN">NM</asp:ListItem>
                            <asp:ListItem Value="NY">NY</asp:ListItem>
                            <asp:ListItem Value="NC">NC</asp:ListItem>
                            <asp:ListItem Value="ND">ND</asp:ListItem>
                            <asp:ListItem Value="OH">OH</asp:ListItem>
                            <asp:ListItem Value="OK">OK</asp:ListItem>
                            <asp:ListItem Value="OR">OR</asp:ListItem>
                            <asp:ListItem Value="PA">PA</asp:ListItem>
                            <asp:ListItem Value="RI">RI</asp:ListItem>
                            <asp:ListItem Value="SC">SC</asp:ListItem>
                            <asp:ListItem Value="SD">SD</asp:ListItem>
                            <asp:ListItem Value="TN">TN</asp:ListItem>
                            <asp:ListItem Value="TX">TX</asp:ListItem>
                            <asp:ListItem Value="UT">UT</asp:ListItem>
                            <asp:ListItem Value="VT">VT</asp:ListItem>
                            <asp:ListItem Value="VA">VA</asp:ListItem>
                            <asp:ListItem Value="WA">WA</asp:ListItem>
                            <asp:ListItem Value="WV">WV</asp:ListItem>
                            <asp:ListItem Value="WI">WI</asp:ListItem>
                            <asp:ListItem Value="WY">WY</asp:ListItem>
                            <asp:ListItem Value="AS">AS</asp:ListItem>
                            <asp:ListItem Value="DC">DC</asp:ListItem>
                            <asp:ListItem Value="FM">FM</asp:ListItem>
                            <asp:ListItem Value="GU">GU</asp:ListItem>
                            <asp:ListItem Value="MH">MH</asp:ListItem>
                            <asp:ListItem Value="MP">MP</asp:ListItem>
                            <asp:ListItem Value="PW">PW</asp:ListItem>
                            <asp:ListItem Value="PR">PR</asp:ListItem>
                            <asp:ListItem Value="VI">VI</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </td>
                <td>
                    <div class="textboxdiv2">
                        <asp:TextBox ID="ZipTB" CssClass="textbox2" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div class="textboxdiv2-5">
                        <asp:TextBox ID="CountryTB" CssClass="textbox2-5" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div class="textboxdiv2">
                        <asp:TextBox ID="TelephoneTB" CssClass="textbox2" SkinID="RoundBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <div id="taxInfo">
        <asp:Image ID="Image6" runat="server" ImageUrl="~/App_Themes/Green/images/controls/blueBox1.png" />
        <asp:Label ID="Label22" runat="server" Text="Tax Information" 
            SkinID="BoxHeaderLabel" CssClass="memberLabel"></asp:Label>

            <table class="taxTable">
                <tr>
                    <td><asp:Label ID="Label23" runat="server" Text="Window will be filled in after research."></asp:Label></td>
                </tr>
            </table>
            <asp:Button ID="SaveBTN" runat="server" CssClass="saveButton" 
                SkinID="UploadBTN" Text="Save" onclick="SaveBTN_Click" />
    </div><br />
    <asp:Label ID="ErrorMessage" runat="server" CssClass="editErrorLabel" ForeColor="Red"></asp:Label>&nbsp;&nbsp;<br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br /><br />
    

</asp:Content>

