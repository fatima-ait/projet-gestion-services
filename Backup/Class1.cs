using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace postes_gestion
{  
    public class Class1
    {
       public  SqlConnection cn = new SqlConnection("server=. ; database=projet poste ;integrated security=true");
       public  SqlCommand cmd; 
        public SqlDataAdapter da;
    }
}