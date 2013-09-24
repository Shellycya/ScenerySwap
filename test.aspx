<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <script type="text/javascript" language="javascript">
    
    
    </script>
    <input type="button" value="Go!" onclick="window.external.MethodToCallFromScript();" />
    <br />
    <input type="button" value="Go Again!" onclick="window.external.AnotherMethod('Hello');" />
    <br />
    <br />
    <div style="display: none;">
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        
    </div>
</asp:Content>

