using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace WebApplication2
{

    public partial class WebForm : System.Web.UI.Page
    {
        OleDbConnection myOleDbConnection = null;
        OleDbDataReader myOleDbDataReader = null;
        OleDbCommand myOleDbCommand;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "provider=MSDAORA;"
                + " Data Source=XE;"
                + "user id=system;"
                + "password=1234;"
                + "persist security info=false;";
                myOleDbConnection = new OleDbConnection(connectionString);
                myOleDbCommand = myOleDbConnection.CreateCommand();

            }
            catch (Exception ex)
            {
                Button1.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                myOleDbCommand.CommandText = "SELECT * FROM " + TableNamesDropDownList.SelectedValue + " WHERE rownum < 50";
                myOleDbConnection.Open();
                myOleDbDataReader = myOleDbCommand.ExecuteReader();
                if (!myOleDbDataReader.HasRows)
                    ErrorLabel.Text = "There were no Results for the SQL Query";
                DataTable dt = new DataTable();
                dt.Load(myOleDbDataReader);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        
    }
}