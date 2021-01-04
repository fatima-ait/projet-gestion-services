using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace postes_gestion
{
    public partial class Evolution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class1 c = new Class1();
            try
            {
                c.cn.Open();
                   //if (Request.Cookies["sessionActive"] != null)
                    //{
                    //    if (Session["nom"] != null && Session["passe"] != null)
                    //    {

                    //        Label2.Text = " utilisateur :" + Session["nom"] + ";";



                    //    }
                    //    else
                    //    {
                    //        Response.Redirect("se connecter.aspx");
                    //    }


                    //}
                    //else
                    //{
                        
                    //    Label2.Text = "bienvenue " + Request.Cookies["sessionActive"]["nom"];
                        
                    //}
                
                if(!Page.IsPostBack)
                {

                    TextBox1.Text = DateTime.Now.Year.ToString();
                  
                }
            }
            catch (Exception ex)
            {
                Response.Write("echec de connection "+ ex.Message);
                Response.End();
            
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }
    }
}