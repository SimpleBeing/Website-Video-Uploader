using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    private string[] toSend, customerTable ={
        "cust_ID",/*0*/
        "cust_type",/**/
        "company_number",/**/
        "VAT_Number",/**/
        "cust_title",/**/
        "cust_name",/*5*/
        "cust_surname",/*6*/
        "cust_cellphoneNo",/*7*/
        "cust_telephoneNo",/*8*/
        "cust_email",/*9*/
        "cust_billing_attention",/*10*/
        "cust_billing_address1",/**/
        "cust_billing_address2",/**/
        "cust_billing_city",/**/
        "cust_billing_Region",/**/
        "cust_billing_postalCode",/**/
        "cust_billing_country",/**/
        "cust_billing_applytoaddress",/**/
        "cust_attention",/*18*/
        "cust_address1",/**/
        "cust_address2",/**/
        "cust_city",/**/
        "cust_Region",/**/
        "cust_postalCode",/**/
        "cust_country",/**/
        "cust_notes"/**/
    };
    public DatabaseHandler database;
    protected void Page_Load(object sender, EventArgs e)
    {
        database = new DatabaseHandler("customer", customerTable);
        toSend = new string[] {
            customerTable[0],
            customerTable[5],
            customerTable[6],
            customerTable[9],
            customerTable[7],
            customerTable[8],
            customerTable[18]
        };
        ShowData();
    }

    public void ShowData()
    {
        GridView1.DataSourceID = "";
        GridView1.DataSource = database.getSpecificTableData(toSend);
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Edit")
        {
            lblReport.Text = e.CommandArgument.ToString();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}