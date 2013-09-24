using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public Model Model;
    public int Quantity;

	public string Display()
	{
        string displayString =
            Model.Name + " (" + Quantity.ToString()
            + " at " + Model.Price.ToString("c") + " each)";

        return displayString;
	}
}