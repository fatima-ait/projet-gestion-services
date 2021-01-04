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
    public partial class nouv_realise : System.Web.UI.Page
    {
        Class1 c = new Class1();
        
      

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                c.cn.Open();
              
              
              
                
            }
            catch (Exception ex)
            {
                
                Response.Write("connexion introuvable !!!" +ex.Message);
                Response.End();
                
            }

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                Label2.Text = "Suppression avec succès";
            }
            else
            {
                Label2.Text = "Echec de la suppression le client ne doit avoir aucune commande";
                e.ExceptionHandled = true;
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                Label2.Text = "Modification avec succès";
            }
            else
            {
                Label2.Text = "Echec de la modification le client ne doit avoir aucune commande";
                e.ExceptionHandled = true;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

       

       

      
           
         

        }

    

       
    }
