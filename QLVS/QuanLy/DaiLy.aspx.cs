using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLVS.QuanLy
{
    public partial class DaiLy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                dsDaiLy.Insert();

                MADAILY.Text = "";
                TENDAILY.Text = "";
                DIACHI.Text = "";
                SDT.Text = "";
            }
            catch
            {

            }
        }
    }
}