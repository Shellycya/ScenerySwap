<%@ Register Tagprefix="Search" Namespace="SiteSearchASP.NET.Interface" assembly="SiteSearchASP.NET" %>
<%@ Import namespace="SiteSearchASP.NET.Interface" %>
<html>
<head runat="server">

 <style type="text/css">
 <!--
  body {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #333333}
  td {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #333333}
  a {  color: #3399CC}
 -->
 </style>

</head>
<body bgcolor="#FFFFFF" text="#000000">

<form id="Form1" runat="server">

<div style="width:450"> 

  <span style="color:#CB8623;font-size:13px"><b>Search this site:</b></span><br><br>

   <table border="0" cellpadding="2" cellspacing="0">
    <tr>
     <td><input type="text" id="SearchTerm" runat="server" size="15"></td>
     <td>
      <select id="SearchType" runat="server"> 
       <option value="all">All words</option>
       <option value="exact">Exact Phrase</option>
       <option value="any">Any words</option>
      </select>
      <select id="SearchArea" runat="server"> 
       <option value="">All Areas</option>
      </select>
     </td>
     <td><input type="submit" value="Search"></td>
    </tr>
   </table> <br><br>
     

  <Search:InformationWhenSearchNotRan runat="server">

    Please enter search term above.<br><br>

  </Search:InformationWhenSearchNotRan>

  
  <Search:InformationWhenSearchRan runat="server">

    Searching for '<%#Search.Render(Page, "SearchTerm")%>' found <%#Search.Render(Container, "PageCount")%> pages.<br><br>

  </Search:InformationWhenSearchRan>


  <ASP:DataGrid 
   id="ResultsDataGrid" Runat="Server"
   PagerStyle-Mode="NumericPages" 
   PagerStyle-HorizontalAlign="Right"
   PageSize="10" 

   CellPadding = 0
   BorderWidth = 0
   CellSpacing = 0
   ShowHeader = false
   AllowPaging = true
   AutoGenerateColumns = false   
  >
   <Columns>
    <ASP:TemplateColumn>
     <ItemTemplate>

		<a href='<%# Search.Render(Container,"PageUrl") %>'><b><%#Search.Render(Container, "PageTitle")%></b></a> 

		<%# Search.Render(Container,"PageFileType") %> <%#Search.Render(Container, "PageRelevance")%>%<br>

		<%#Search.Render(Container, "PagecontentSummary")%><br>

		<a href='<%# Search.Render(Container,"PageUrl") %>'><%# Search.Render(Container,"PageUrlShort") %></a>
		&nbsp; Size: 
		<%# Search.Render(Container,"PageSize") %>kb.<br><br>

     </ItemTemplate>
    </ASP:TemplateColumn>
   </Columns>
  </ASP:DataGrid>

  <br><br>

  <Search:Settings
   
	runat="server"

	ResultsControl    ="ResultsDataGrid"
	SearchAreaControl ="SearchArea"
	SearchTermControl ="SearchTerm"
	SearchTypeControl ="SearchType"
	
	LicenseCode=""
	
	Debug="false" 
	
	HighlightFoundTermPrefix="<span style='background-color:#FFCC33'>"
	HighlightFoundTermSuffix="</span>"
	
  /> 

  </div>

 </form>

</body>
</html>