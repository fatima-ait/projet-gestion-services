using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security;

namespace postes_gestion
{
    public partial class administrateur : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (CheckBox1.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["UserName"].Value = TextBox1 .Text.Trim();
            Response.Cookies["Password"].Value = TextBox2.Text.Trim();

            if (!Page.IsPostBack)
            {
                {
                    if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                    {
                        TextBox1.Text = "Administrateur :"+ Request.Cookies["UserName"].Value;
                        TextBox2.Attributes["value"] = Request.Cookies["Password"].Value;
                    }
                }

                TextBox1.Text = "entrer votre nom ...";




                TextBox2.Text = "entrer le code";


            }
            else
            {

                string nom = Request["nom"];
                Session["nom"] = TextBox1.Text;


            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
             SqlConnection cn = new SqlConnection("server=.;database=projet poste;integrated security=true");
            cn.Open();
            string nom = "select count (*) from administrateur where nom_admin = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(nom, cn);
            int test = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            cn.Close();

            
      

            if (test == 1)
            {
                cn.Open();

                string passe = "select code_admin from administrateur  where nom_admin='" + TextBox1.Text + "'";
                SqlCommand cmdd = new SqlCommand(passe, cn);


                string passeword = cmdd.ExecuteScalar().ToString().Replace(" ", "");


                if (passeword == TextBox2.Text)
                {
                    Session["new"] = TextBox1.Text;

                    Label1.Text = "aucun erreur !!!";
                    Response.Write("<script>alert (' administrateur connaitre ');</script>");

                    Response.Redirect("pour admin.aspx");
                    cn.Close();
                }
                else
                {
                    Label1.Text = "mot du passe incorrect !!!";
                    Response.End();

                }
                cn.Close();
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
           TextBox1.Text = "";
            TextBox2.Text = "";
            CheckBox1.Checked = false;
        
        }

     
           
        }

            
      

          
        
    
       

            
        }

      

        
    
