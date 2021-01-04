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
    public partial class WebForm1 : System.Web.UI.Page
    {

        Class1 c = new Class1();
        DataSet ds = new DataSet();
        public void enregistrer()
        {
            SqlCommandBuilder cmdd = new SqlCommandBuilder(c.da);
            c.da.Update(ds, "sect");


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                c.cn.Open();
                c.da = new SqlDataAdapter("select * from SECTEURS", c.cn);

                c.da.Fill(ds, "sect");
                GridView2.DataSource = ds.Tables["sect"];
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Echec de connexion" + ex.Message);
                Response.Redirect("se connecter.aspx");
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                c.da = new SqlDataAdapter("select * from SECTEURS", c.cn);

                c.da.Fill(ds, "sect");
                c.cn.Open();
                int i;
                for (i = 0; i < ds.Tables["sect"].Rows.Count; i++)
                {
                    if (TextBox1.Text == ds.Tables["sect"].Rows[0][i].ToString())
                    {
                        Response.Write("SECTEUR exist déjà!!!");

                    }

                    else
                    {
                        DataRow row;
                        row = ds.Tables["sect"].NewRow();
                        row[0] = TextBox1.Text;
                        row[1] = TextBox2.Text;

                        ds.Tables["sect"].Rows.Add(row);
                        enregistrer();
                        Response.Write("<script>alert ('bien ajouter ');</script>");
                    }
                }
            }
            catch
            {

                Response.Write("<script>alert ('connection introuvable !!! ');</script>");

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox1.Text = "";

        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            try
            {
                c.cn.Open();

                SqlCommand cmd = new SqlCommand("select NomSecteur from SECTEURS", c.cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text != dr[0].ToString())
                    {
                        Response.Write("NomClient introuvable !!!");

                    }
                    else
                    {
                        cmd = new SqlCommand("update set designation='" + TextBox2.Text +
                            "' from SECTEURS where NomSecteur='" + TextBox1.Text + "'", c.cn);
                        cmd.ExecuteNonQuery();
                        Response.Write("bien ajouter !!");


                    }

                }





            }
            catch (Exception ex)
            {
                Response.Write("connection introuvable!!!" + ex.Message);

            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            try
            {
                c.cn.Open();

                SqlCommand cmd = new SqlCommand("select NomSecteur from SECTEURS", c.cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text != dr[0])
                    {
                        Response.Write("NomSecteur introuvabl !!!");

                    }
                    else
                    {
                        cmd = new SqlCommand("delete  SECTEURS  where NomSecteur='" + TextBox1.Text + "'and designationr='" + TextBox2.Text + "'", c.cn);


                        cmd.ExecuteNonQuery();
                        Response.Write("bien SUPPRIMER !!");


                    }

                }

            }
            catch (Exception ex)
            {
                Response.Write("connection introuvable !!!" + ex.Message);

            }
        }
    }
}

      

      

       