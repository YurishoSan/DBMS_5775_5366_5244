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
    public partial class Procedure : System.Web.UI.Page
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
                Output.Text = ex.Message;
            }

            if (!IsPostBack)
            {
                try
                {
                    //init Publisher dropDown
                    myOleDbCommand.CommandText = "SELECT DISTINCT Publisher FROM Book";
                    myOleDbConnection.Open();
                    myOleDbDataReader = myOleDbCommand.ExecuteReader();
                    if (!myOleDbDataReader.HasRows)
                        Output.Text = "There were no Results for the SQL Query";
                    DataTable dt = new DataTable();
                    dt.Load(myOleDbDataReader);
                    PublisherList.DataSource = dt;
                    PublisherList.DataTextField = "Publisher";
                    PublisherList.DataBind();
                    myOleDbConnection.Close();
                }
                catch (Exception ex)
                {
                    Output.Text = ex.Message;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string StringToReturn = "";
            OleDbCommand myOleDbCommand;
            myOleDbCommand = myOleDbConnection.CreateCommand();
            myOleDbCommand.CommandText = "Package.BooksByPublisherStudy";
            myOleDbCommand.CommandType = CommandType.StoredProcedure;
            OleDbParameter par1 = new OleDbParameter("RETURN_VALUE", OleDbType.VarChar);
            par1.Direction = ParameterDirection.ReturnValue;
            par1.Size = 4000;
            myOleDbCommand.Parameters.Add(par1);

            OleDbParameter par2 = new OleDbParameter("publisher_in", OleDbType.VarChar);
            par2.Direction = ParameterDirection.Input;
            par2.Size = 2000;
            par2.Value = PublisherList.SelectedValue;
            myOleDbCommand.Parameters.Add(par2);

            try
            {
                myOleDbConnection.Open();
                myOleDbDataReader = myOleDbCommand.ExecuteReader();
                if (!myOleDbDataReader.HasRows)
                    StringToReturn = "No result";
                DataTable dt = new DataTable();
                dt.Load(myOleDbDataReader);
                StringToReturn = "";
                string m = (string)myOleDbCommand.Parameters["RETURN_VALUE"].Value;
                StringToReturn = m;
                myOleDbConnection.Close();
            }
            catch (Exception ex)
            {
                StringToReturn = ex.Message;
            }
            Output.Text = StringToReturn;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

    }
}