using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace postes_gestion
{
    public partial class se_connecter : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (RadioButton2.Checked)
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
           
            if(!Page.IsPostBack){
                {
                    if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                    {
                        TextBox1.Text = Request.Cookies["UserName"].Value;
                        TextBox2.Attributes["value"] = Request.Cookies["Password"].Value;
                    }
                }

                TextBox1.Text = "entrer votre nom ...";
                
             
                
               
                TextBox2.Text="entrer le code" ;
                
               
            }
            else {
              
                string nom = Request["nom"];
                Session["nom"] = TextBox1.Text;
            }
           


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection("server=.;database=projet poste;integrated security=true");
            cn.Open();
            string nom = "select count (*) from utilisateur where login = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(nom, cn);
            int test = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            cn.Close();




            if (test == 1)
            {
                cn.Open();

                string passe = "select mot_de_passe from utilisateur  where login='" + TextBox1.Text + "'";
                SqlCommand cmdd = new SqlCommand(passe, cn);


                string passeword = cmdd.ExecuteScalar().ToString().Replace(" ", "");


                if (passeword == TextBox2.Text)
                {
                    Session["new"] = TextBox1.Text;


                    Response.Write("<script>alert (' utilisateur connaitre ');</script>");

                    Response.Redirect("TOP.aspx");
                    cn.Close();
                }
                else
                {

                    Response.End();

                }
                cn.Close();
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton2.Checked)
            {
                Response.Cookies["sessionActive"]["nom"]=TextBox1.Text;
                Response.Cookies["sessionActive"]["passe"] = TextBox2.Text;
                Response.Cookies["sessionActive"].Expires = DateTime.Now.AddYears(1);
            
            
            }
        }

        protected void RadioButton1_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

       
       

        }
    }
