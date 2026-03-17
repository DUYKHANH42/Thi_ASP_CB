using Exam_HoTen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam_HoTen
{
    public partial class XemTour : System.Web.UI.Page
    {
        TourDAO tdao = new TourDAO();
        DiaDiemDAO ddao = new DiaDiemDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                khoiTaoCBO();
                loadDuLieu();
            }
        }

        private void khoiTaoCBO()
        {
            List<DiaDiem> dd = ddao.getAll();
            ddlDiadiem.DataSource = dd;
            ddlDiadiem.DataTextField = "TenDiaDiem";
            ddlDiadiem.DataValueField = "MDD";
            ddlDiadiem.DataBind();
        }

        private void loadDuLieu()
        {

            RptTour.DataSource = tdao.getByDiaDiem(int.Parse(ddlDiadiem.SelectedValue));
            RptTour.DataBind();
        }

        protected void ddlDiadiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDuLieu();
        }
    }
}