using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Image im = new Image();
        
        
    }

    
    protected void btnPlay_Click(object sender, EventArgs e)
    {
        string sb= "<video src='Data/11%20Awesome%20Video%20Games%20Nobody%20Played.mp4' height='230' width='271' controls='control' type=video/webm autoplay/>";
        Panel1.Controls.Add(new Literal { Text = sb }); 
    }
}