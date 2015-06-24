using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Edit : System.Web.UI.Page
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


                if (!IsPostBack)
                {
                    //init stdID dropDown
                    myOleDbCommand.CommandText = "SELECT stdID FROM Student";
                    myOleDbConnection.Open();
                    myOleDbDataReader = myOleDbCommand.ExecuteReader();
                    if (!myOleDbDataReader.HasRows)
                        ErrorLabel.Text = "There were no Results for the SQL Query";
                    DataTable dt = new DataTable();
                    dt.Load(myOleDbDataReader);
                    stdIDDropDownList.DataSource = dt;
                    stdIDDropDownList.DataTextField = "STDID";
                    stdIDDropDownList.DataBind();
                }
                myOleDbConnection.Close();
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                myOleDbCommand.CommandText = "UPDATE Student SET class='" + classTextBox.Text + "' WHERE stdID=" + stdIDDropDownList.Text;
                myOleDbConnection.Open();
                int result = myOleDbCommand.ExecuteNonQuery();
                if (result == 0)
                    ErrorLabel.Text = "There were no Results for the SQL Query";
                else
                    ErrorLabel.Text = "student number " + stdIDDropDownList.Text + " class updated to: " + classTextBox.Text;
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
            finally
            {
                myOleDbConnection.Close();
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}