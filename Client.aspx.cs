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
    public partial class Client : System.Web.UI.Page
    {
        Class1 c = new Class1();
        DataSet ds = new DataSet();
        public void enregistrer()
        {
            SqlCommandBuilder cmdd = new SqlCommandBuilder(c.da);
            c.da.Update(ds, "clt");


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                c.cn.Open();
                c.da = new SqlDataAdapter("select * from CLIENTS", c.cn);

                c.da.Fill(ds, "clt");
                GridView1.DataSource=ds.Tables["clt"];
                GridView1.DataBind();
               
            }
            catch (Exception ex)
            {
                Response.Write("Echec de connexion"+ex.Message);
                
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                
                
                        DataRow row;
                        row = ds.Tables["clt"].NewRow();
                        row[0] = TextBox1.Text;
                        row[1] = DropDownList1.Text;

                        ds.Tables["clt"].Rows.Add(row);
                        Response.Write("<script>alert ('bien ajouter ');</script>");
                        enregistrer();
                        
                    }
                
            
            catch
            {

                Response.Write("<script>alert ('connection introuvable !!! ');</script>");

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;

        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            try
            {
                c.cn.Open();

                SqlCommand cmd = new SqlCommand("select NomClient from CLIENTS", c.cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text != dr[0].ToString())
                    {
                        Response.Write("NomClient introuvable !!!");

                    }
                    else
                    {
                        cmd = new SqlCommand("update set NomSecteur='" + DropDownList1.SelectedItem +
                            "' from CLIENTS where NomClient='" + TextBox1.Text + "'", c.cn);
                        cmd.ExecuteNonQuery();
                        Response.Write("bien ajouter !!");


                    }

                }





            }
            catch (Exception ex)
            {
                Response.Write("connection introuvable!!!"+ex.Message);

            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            try
            {
                c.cn.Open();

                SqlCommand cmd = new SqlCommand("select NomClient from CLIENTS", c.cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text != dr[0])
                    {
                        Response.Write("NomClient introuvabl !!!");

                    }
                    else
                    {
                        cmd = new SqlCommand("delete  CLIENTS  where NomClient='" + TextBox1.Text + "'and NomSecteur='"+DropDownList1.SelectedItem+"'", c.cn);
                       
	
                        cmd.ExecuteNonQuery();
                        Response.Write("bien ajouter !!");


                    }

                }

            }
            catch (Exception ex)
            {
                Response.Write("connection introuvable !!!"+ ex.Message);

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
