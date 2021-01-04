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
    public partial class assurence : System.Web.UI.Page
    {
        Class1 c = new Class1();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
           

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            string Req;
            Req = "SELECT     min(OBJ.Annee) FROM     CLIENTS INNER JOIN ";
            Req += "OBJ ON CLIENTS.NomClient = OBJ.NomClient ";
            Req += "where CLIENTS.NomSecteur= 'Assurance'";
            da = new SqlDataAdapter(Req, c.cn);
            da.Fill(ds, "Res");
            int X = (int)ds.Tables["Res"].Rows[0].ItemArray[0];
            int Y = Convert.ToInt32(TextBox2.Text);
            if ((Y - X) < 2)
            {
                Label1.Text = "No Data";

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
         
           // c.cn.Open();
           // var Str = "";
           // Str = " declare @M int ";
           // Str += " declare @l int ";
           // Str += "   select @M=2015 ";
           // Str += "declare @k int ";

           // Str += "begin ";
           // Str += "if not exists(select SECTEURS.NomSecteur ,TDB_Commercial.NomClient,TDB_Commercial.Mois,VAL_R_N_1,Valeur_Objectif ";
           // Str += ",VAL_R_N, ";
           // Str += "Ecart_vs_B,Ecart_Vs_N,Nature_realise from ";
           // Str += "(SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif, ";
           // Str += "A.Valeur_Realise AS VAL_R_N, ";
           // Str += "A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B, ";
           // Str += "A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N, ";
           // Str += "B.Nature_realise ";
           // Str += "FROM OBJ D INNER JOIN REALISES B ON B.Mois = D.Mois AND B.NomClient = ";
           // Str += "D.NomClient AND B.Nature_realise = D.nature_objectif ";
           // Str += " inner JOIN REALISES A ON A.Mois = B.Mois AND D.NomClient = ";
           // Str += "A.NomClient AND D.Nature_Objectif = A.Nature_realise ";
           // Str += "where B.Annee =@M and D.Annee =@l AND A.Annee=@M  ";
           // Str += ") TDB_Commercial ";
           // Str += "inner join CLIENTS ON CLIENTS.NomClient=TDB_Commercial.NomClient ";
           // Str += "inner join SECTEURS ON SECTEURS.NomSecteur=CLIENTS.NomSecteur ";
           // Str += "WHERE SECTEURS.NomSecteur='Administration') ";

           // Str += "	begin ";
           // Str += "	 print 'no data found' ";
           // Str += "end  ";
           // Str += "else  ";
           // Str += "begin ";
           // Str += "   print'perform other action' ";
           // Str += "end ";
           // Str += "end ";
           //SqlCommand cmd = new SqlCommand(Str, c.cn);
           // cmd.ExecuteScalar();
           // object o = cmd.ExecuteScalar();
           //     Label1.Text = o.ToString();
            
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}