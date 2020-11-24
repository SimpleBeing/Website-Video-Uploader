using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    /*private About()
    {
        FileInfo fi;
        DataTable dt = new DataTable();

        foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Data")))
        {
            fi = new FileInfo(strFile);
            lblTest.Text += fi.CreationTime.ToString();
            dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

        }

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }*/
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        
        string filename = "";
        Response.ContentType = "application/octect-stream";
        Response.AppendHeader("content-disposition", "filename=" + filename);
        Response.TransmitFile(Server.MapPath("~/Data/" + filename));
        Response.End();
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Data/")+FileUpload1.FileName);
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("type", typeof(string));
            

            FileInfo fi;

            foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Data")))
            {
                fi = new FileInfo(strFile);
                lblTest.Text+=fi.CreationTime.ToString();
                dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

            }
            
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Download")
        {
            Response.Clear();
            Response.ContentType = "application/octect-stream"; 
            Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Data/" + e.CommandArgument));
            Response.End();
        }
    }

    protected void dbDisplay_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("File", typeof(string));
        dt.Columns.Add("Size", typeof(string));
        dt.Columns.Add("type", typeof(string));

        FileInfo fi;
        int cRow = 0, row=1, col=1;
        string htmlString;

        foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Data")))
        {
            if (row < 7)
            {
                if (cRow != row)
                {
                    cRow = row;
                    htmlString = "<div class= 'row' >";
                    Panel1.Controls.Add(new Literal { Text = htmlString });
                }
                fi = new FileInfo(strFile);
                string temp = fi.Name;
                int index = temp.IndexOf('\\');
                while (index > 0)
                {
                    temp = temp.Remove(0, index);
                    index = temp.IndexOf('\\');
                }
                //temp = temp.Replace(" ", "%");
                int NameIndex = temp.IndexOf("."), nameLength=temp.Length;
                string name = "";
                if (nameLength < 20)
                {
                    name = temp;
                }
                else
                {
                    name = temp.Substring(0, 20) + "...";
                }
                
                
                lblTest.Text += fi.CreationTime.ToString();
                dt.Rows.Add(fi.Name, fi.Length, fi.Extension);
                string sb = "<div class=col-md-3>" + name + "<video src='Data\\" + temp + "' height='230' width='271' controls='control' type=video/webm/></div>";
                if (col < 4)
                {
                    col++;
                }
                else
                {
                    sb = sb + "</div>";
                    row++;
                    col = 1;
                }
                Panel1.Controls.Add(new Literal { Text = sb });
                lblTest.Text = sb;

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        
    }
}