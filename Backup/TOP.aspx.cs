using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace postes_gestion
{
    public partial class TOP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class1 c = new Class1();
            try
            {
                c.cn.Open();

            }
            catch (Exception ex)
            {
                Response.Write("echec de connexion !!!"+ex.Message);
                Response.End();
            
            }
          
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}