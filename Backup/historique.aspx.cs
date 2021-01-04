using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace postes_gestion
{
    public partial class historique : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  Class1 c= new Class1 ();
        try
        {
            c.cn.Open();
        }
        catch (Exception ex)
        {
            Response.Write("echec de connection" + ex.Message);
            Response.End();
        
        }

        }

       
    }
}