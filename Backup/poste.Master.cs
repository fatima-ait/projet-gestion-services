using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Data.SqlClient;
using System.Data;

namespace postes_gestion
{
    public partial class poste : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class1 c = new Class1();
            try
            {
                c.cn.Open();
                //Label1.Text=" "+Session["nom"]+" !! " ;
                za.Text = za.Text = DateTime.Now.ToLongDateString();
                if (Session["nom"] != " ")
                    Label1.Text = Session["nom"].ToString();
                else
                    Response.Write("Aucune société n'a été choisie !");
            }
            catch(Exception ex){
            
            Response.Write("echec du connexion"+ex.Message);
            Response.End();
            
            }
            
            
            

        }

        protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
        {

        }

    }
}
