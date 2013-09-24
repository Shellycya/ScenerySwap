using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GamePeopleButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "People");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameMonsterButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Monsters");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameArchButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Architecture");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameNatureButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Nature");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameVehicleButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Vehicles");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameWeaponButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Weapons");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameArmorButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Armor");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void GameAnimalButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "Game Models");
        Session.Add("Category", "Animals");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }

    protected void HiresPeopleButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "People");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresMonstersButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Monsters");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresArchitectureButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Architecture");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresNatureButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Nature");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresVehicleButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Vehicles");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresWeaponsButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Weapons");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresArmorButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Armor");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
    protected void HiresAnimalsButton_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("ModelType", "High Resolution Models");
        Session.Add("Category", "Animals");
        Session.Add("PrevPage", "Default");
        Response.Redirect("~/Categories.aspx");
    }
}