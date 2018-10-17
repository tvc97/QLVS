using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLVS.QuanLy
{
    public partial class LoaiVeSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                dsLoaiVeSo.Insert();

                MAVS.Text = "";
                TINH.Text = "";
                THU.SelectedIndex = -1;
                GIA.Text = "";
            }
            catch
            {

            }
        }
    }
}