using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomControls
{
    /// <summary>
    /// Summary description for UserParameter
    /// </summary>
    public class UserParameter : System.Web.UI.WebControls.Parameter
    {
        protected override object Evaluate(HttpContext context, System.Web.UI.Control control)
        {
            if (context.User != null && !string.IsNullOrEmpty(context.User.Identity.Name))
            {
                return context.User.Identity.Name;
            }
            return null;
        }

    }
}