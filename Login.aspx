<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
        <img src="App_Themes/Green/images/Header.png" alt="header banner" />
        <asp:Label ID="LoginTitleLBL" runat="server" SkinID="LoginHeader" CssClass="loginTitle" Text="Log In or Register for a New Account"></asp:Label>
        <asp:Label ID="LoginSceneryTitleLBL" runat="server" SkinID="HeaderTitle" CssClass="uploadTitle" Text="Scenery Swap Account"></asp:Label>
    </div>

    <div id="loginBox">
        <asp:Panel ID="panelLogin" runat="server" DefaultButton="Login1$LoginButton">
        <asp:Login ID="Login1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ></asp:Login>
        </asp:Panel>
    </div>
    <asp:LinkButton ID="HyperLink1" CssClass="newUserLink" runat="server" 
        onclick="HyperLink1_Click">Create New User</asp:LinkButton>

    <div id="createUser">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Width="780px" passwordregularexpression='@\"(?:.{7,})(?=(.*\d){1,})'
            passwordregularexpressionerrormessage="Your password must be 7 characters long, and contain at least one number."
            BorderColor="Black" BorderWidth="2px" BorderStyle="Solid" 
            BackColor="#F2F5F7" oncreateduser="CreateUserWizard1_CreatedUser" >
            <ContinueButtonStyle BackColor="#D8E7A7" BorderColor="Black" BorderWidth="1px" 
                Font-Size="1em" />
            <CreateUserButtonStyle BackColor="#D8E7A7" BorderColor="Black" 
                BorderWidth="1px" Font-Size="1em" />
            <TitleTextStyle BackColor="#555D68" Font-Bold="True" Font-Size="1.2em" 
                ForeColor="White" Height="30px" HorizontalAlign="Left" />
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table cellpadding="5px" style="background-color:#F2F5F7;font-size:100%;width:780px;">
                            <tr>
                                <td align="left" colspan="2" 
                                    style="color:White;background-color:#555D68;font-size:1.2em;font-weight:bold;height:30px;">
                                    Create a New Account</td>
                            </tr>
                            <tr><!--User Name Label-->
                                <td align="left">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                </td>
                                <!--Email label -->
                                <td align="left">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail (Private)</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><!--User Name Textbox-->
                                    <asp:TextBox ID="UserName" runat="server" CssClass="wizardTB" MaxLength="16"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                                <td><!--Email Textbox-->
                                    <asp:TextBox ID="Email" runat="server" CssClass="wizardTB"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                        ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr><!--Password Label-->
                                <td align="left">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                </td>
                                <!--ConfirmPasswordLabel -->
                                <td align="left">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                                </td>
                            </tr>
                            <tr><td><!--Password Textbox-->
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="wizardTB"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                                <td><!--Confirm Password textbox -->
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="wizardTB"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" 
                                        ErrorMessage="Confirm Password is required." 
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr><!--Question Label-->
                                <td align="left">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question</asp:Label>
                                </td>
                                <!--Answer Label-->
                                <td align="left">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer</asp:Label>
                                </td>
                            </tr>
                            <tr><td><!--Question Textbox-->
                                    <asp:TextBox ID="Question" runat="server" CssClass="wizardTB"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                        ControlToValidate="Question" ErrorMessage="Security question is required." 
                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                                <td><!--Answer Textbox-->
                                    <asp:TextBox ID="Answer" runat="server" CssClass="wizardTB"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Password and Confirmation Password must match." 
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:CheckBox ID="CheckBox1" runat="server" />
                                    <asp:Label ID="Label1" runat="server" CssClass="eula" Text="I agree to the terms and conditions of the "></asp:Label>
                                    <asp:HyperLink ID="EULALink" CssClass="eula" runat="server">End User License Agreement</asp:HyperLink></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False" ViewStateMode="Enabled"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table style="background-color:#F2F5F7;font-size:100%;width:780px;">
                            <tr>
                                <td align="left" 
                                    
                                    style="color:White;background-color:#555D68;font-size:1.2em;font-weight:bold;height:30px;">
                                    Complete</td>
                            </tr>
                            <tr>
                                <td>
                                    Your account has been successfully created.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ContinueButton" runat="server" BackColor="#D8E7A7" 
                                        BorderColor="Black" BorderWidth="1px" CausesValidation="False" 
                                        CommandName="Continue" Font-Size="1em" onclick="ContinueButton_Click" 
                                        Text="Continue" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishCompleteButtonStyle BackColor="#D8E7A7" BorderColor="Black" 
                BorderWidth="1px" Font-Size="1em" />
        </asp:CreateUserWizard>
    </div>
    <br /><br />
</asp:Content>

