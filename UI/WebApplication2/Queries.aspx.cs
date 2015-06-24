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

    public partial class WebForm2 : System.Web.UI.Page
    {
        OleDbConnection myOleDbConnection2 = null;
        OleDbDataReader myOleDbDataReader2 = null;
        OleDbCommand myOleDbCommand2;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connectionString2 = "provider=MSDAORA;"
                + " Data Source=XE;"
                + "user id=system;"
                + "password=1234;"
                + "persist security info=false;";
                myOleDbConnection2 = new OleDbConnection(connectionString2);
                myOleDbCommand2 = myOleDbConnection2.CreateCommand();

            }
            catch (Exception ex)
            {
                Button2.Enabled = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                switch (QueriesDropDownList.Text)
                {
                    case "2 - Shelves sorted by books count":
                        myOleDbCommand2.CommandText = "SELECT shelfNum, COUNT(shelfNum) AS books FROM Book GROUP BY shelfNum HAVING COUNT(shelfNum) > 1 ORDER BY books DESC";
                        break;

                    case "3 - Average age per Beit Midrash Hall":
                        myOleDbCommand2.CommandText = "SELECT BeitMidrashHall.bmhID, BeitMidrashHall.name, AVG(MONTHS_BETWEEN(SYSDATE, dateOfBirth) / 12) AS abvAge FROM BeitMidrashHall INNER JOIN Student ON Student.bmhID = BeitMidrashHall.bmhID GROUP BY BeitMidrashHall.bmhID, BeitMidrashHall.name ORDER BY BeitMidrashHall.bmhID";
                        break;
                    default:
                        ErrorLabel2.Text = "Unknown query.";
                        break;
                }
                myOleDbConnection2.Open();
                myOleDbDataReader2 = myOleDbCommand2.ExecuteReader();
                if (!myOleDbDataReader2.HasRows)
                    ErrorLabel2.Text = "There were no Results for the SQL Query";
                DataTable dt = new DataTable();
                dt.Load(myOleDbDataReader2);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLabel2.Text = ex.Message;
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}