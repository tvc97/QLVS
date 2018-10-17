using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLVS.QuanLy
{
    public partial class DotPhatHanh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPhatHanh_Click(object sender, EventArgs e)
        {
            dsDPH.Insert();
        }
    }
}