using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
using System.Windows.Forms;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    // This method will be called by the other method (MethodToCallFromScript) that gets called by JavaScript.
    public void DoSomething()
    {
        // Indicate success.
        MessageBox.Show("It worked!");
    }


    // This nested class must be ComVisible for the JavaScript to be able to call it.
    [ComVisible(true)]
    public class ScriptManager
    {
        // Variable to store the form of type Form1.
        private test mForm;

        // Constructor.
        public ScriptManager(test form)
        {
            // Save the form so it can be referenced later.
            mForm = form;
        }

        // This method can be called from JavaScript.
        public void MethodToCallFromScript()
        {
            // Call a method on the form.
            mForm.DoSomething();
        }

        // This method can also be called from JavaScript.
        public void AnotherMethod(string message)
        {
            MessageBox.Show(message);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.Text = "Clicked!";
    }
}