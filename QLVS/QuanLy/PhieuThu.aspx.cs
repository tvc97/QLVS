using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLVS.QuanLy
{
    public partial class PhieuThu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                dsPhieuThu.Insert();


                NGAY.Text = "";
                MADAILY.SelectedIndex = -1;
                SOTIEN.Text = "";
            } catch
            {

            }
        }
    }
}