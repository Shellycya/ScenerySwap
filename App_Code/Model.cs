using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Model
/// </summary>
public class Model
{
    public int ProductID;
    public DateTime Date;
    public string PriceType;
    public decimal Price;
    public string Name;
    public string Extension;
    public string ImgPath;
    public string UserName;
    public int Quantity;

    public string dateString() {
       return Date.ToString("MMMM") + " " + Date.Day + ", " + Date.Year;
    }

    public static string formatString(DateTime date)
    {
        return date.ToString("MMMM") + " " + date.Day + ", " + date.Year;
    }

    public string formatPrice()
    {
        return "$" + String.Format("{0:0.00}", Price);
    }
}