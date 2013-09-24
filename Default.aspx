<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="home_game">
         <p>If you are an artist, log in and upload some models and get started making money!</p>
        <h1>GAME READY</h1>
        <p>We have a large selection of game ready models from a community of artists.  
        These models are available in multiple formats and texture sizes.  These are 
        perfect for small developers or large scale projects in need of some last minute assets.  Click on the 
        category you are interested in and get started!</p>

         <table class="hometable">
             <tr>
                 <td class="homecell">
                     <asp:ImageButton ID="GamePeopleButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/people.png" 
                         onclick="GamePeopleButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GamePeopleLBL" runat="server" CssClass="homelabels" Text="PEOPLE"></asp:Label>
                     </td>
                 <td>
                     <asp:ImageButton ID="GameMonsterButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/monsters.png" 
                         onclick="GameMonsterButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameMonsterLBL" runat="server" CssClass="homelabels" Text="MONSTERS"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="GameArchButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/architecture.png" 
                         onclick="GameArchButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameArchLBL" runat="server" CssClass="homelabels" Text="ARCHITECTURE"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="GameNatureButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/nature.png" 
                         onclick="GameNatureButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameNatureLBL" runat="server" CssClass="homelabels" Text="NATURE"></asp:Label></td>
             </tr>
             <tr>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Men, Women, Children, Heads, Hands, <br />Hair, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Dragons, Ogres, Snakes, Zombies, <br />Giants, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Houses, Castles, Lairs, Skyscrapers, <br />Tombs, Cathedrals, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Trees, Flowers, Rocks, Mountains <br />Grass, Water, More...</a></td>
             </tr>
             <tr>
                 <td>
                     <asp:ImageButton ID="GameVehicleButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/vehicles.png" 
                         onclick="GameVehicleButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameVehicleLBL" runat="server" CssClass="homelabels" Text="VEHICLES"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="GameWeaponButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/weapons.png" 
                         onclick="GameWeaponButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameWeaponLBL" runat="server" CssClass="homelabels" Text="WEAPONS"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="GameArmorButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/armor.png" onclick="GameArmorButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameArmorLBL" runat="server" CssClass="homelabels" Text="ARMOR"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="GameAnimalButton" runat="server" 
                         ImageUrl="~/images/home/game_ready/animals.png" 
                         onclick="GameAnimalButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="GameAnimalLBL" runat="server" CssClass="homelabels" Text="ANIMALS"></asp:Label></td>
             </tr>
             <tr>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Tanks, Guns, Cannons, Bunkers <br />Landmines, Soldiers, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Swords, Bows, Maces, Guns, <br />Lasers, Hammers, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Helmets, Chainmail, Shields, <br />Gauntlets, Full Sets, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Cats, Dogs, Tigers, Bears, Lions <br />Mice, Snakes, More...</a></td>
             </tr>
         </table>
    </div>
    <div id="home_hires">
    <h1>High Resolution Models</h1>
        <p>Browse our high resolution models which are perfect whether you are making a movie, advertising, or just for fun.  These
        can be for large scale projects or the individual who needs a few more pieces for their project.</p>
    
    <table class="hometable">
             <tr>
                 <td class="homecell">
                     <asp:ImageButton ID="HiresPeopleButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/people.png" 
                         onclick="HiresPeopleButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label1" runat="server" CssClass="homelabels" Text="PEOPLE"></asp:Label>
                     </td>
                 <td>
                     <asp:ImageButton ID="HiresMonstersButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/monsters.png" 
                         onclick="HiresMonstersButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label2" runat="server" CssClass="homelabels" Text="MONSTERS"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="HiresArchitectureButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/architecture.png" 
                         onclick="HiresArchitectureButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label3" runat="server" CssClass="homelabels" Text="ARCHITECTURE"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="HiresNatureButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/nature.png" onclick="HiresNatureButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label4" runat="server" CssClass="homelabels" Text="NATURE"></asp:Label></td>
             </tr>
             <tr>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Men, Women, Children, Heads, Hands, <br />Hair, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Dragons, Ogres, Snakes, Zombies, <br />Giants, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Houses, Castles, Lairs, Skyscrapers, <br />Tombs, Cathedrals, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Trees, Flowers, Rocks, Mountains <br />Grass, Water, More...</a></td>
             </tr>
             <tr>
                 <td>
                     <asp:ImageButton ID="HiresVehicleButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/vehicles.png" 
                         onclick="HiresVehicleButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label5" runat="server" CssClass="homelabels" Text="VEHICLES"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="HiresWeaponsButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/weapons.png" 
                         onclick="HiresWeaponsButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label6" runat="server" CssClass="homelabels" Text="WEAPONS"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="HiresArmorButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/armor.png" onclick="HiresArmorButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label7" runat="server" CssClass="homelabels" Text="ARMOR"></asp:Label></td>
                 <td>
                     <asp:ImageButton ID="HiresAnimalsButton" runat="server" 
                         ImageUrl="~/images/home/hi_res/animals.png" 
                         onclick="HiresAnimalsButton_Click" />
                     <img src="images/home/label-alpha.png" alt="label image" class="seeThrough" />
                     <asp:Label ID="Label8" runat="server" CssClass="homelabels" Text="ANIMALS"></asp:Label></td>
             </tr>
             <tr>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Tanks, Guns, Cannons, Bunkers <br />Landmines, Soldiers, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Swords, Bows, Maces, Guns, <br />Lasers, Hammers, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Helmets, Chainmail, Shields, <br />Gauntlets, Full Sets, More...</a></td>
                 <td>
                     <a href="Default.aspx" class="categoryLinks">Cats, Dogs, Tigers, Bears, Lions <br />Mice, Snakes, More...</a></td>
             </tr>
         </table>
    
    
    </div>

</asp:Content>

