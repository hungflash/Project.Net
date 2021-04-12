using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignement
{
    public partial class TeacherAttendent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int TeachID = Convert.ToInt32(Request.QueryString["TeachID"]);
                Calendar1.SelectedDate = Convert.ToDateTime("3-30-2021");
                String techerName = Request.QueryString["NameTeach"];
                Label1.Text += techerName;
                Label2.Text = techerName;
                drClass.SelectedIndex = 0;
                LoadSlot();
                LoadDRList(TeachID);
                LoadGrivData(TeachID);
               
            }
        }

        private void LoadSlot()
        {
            DropDownList1.SelectedIndex = 0;
            DropDownList1.DataValueField = "SlotID";
            DropDownList1.DataTextField = "SlotID";
            DropDownList1.DataSource = DAO.LoadSlot();
            DropDownList1.DataBind();
        }

        public void LoadDRList(int teachId)
        {
            drClass.SelectedIndex = 0;
            drClass.DataValueField = "ClassID";
            drClass.DataTextField = "ClassName";
            drClass.DataSource = ClassList.GetClassByTeachID(teachId);
            drClass.DataBind();
        }
        public void LoadGrivData(int teachID)
        {
            String Date = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            int select = Convert.ToInt32(drClass.SelectedValue);
            int slotID = Convert.ToInt32(DropDownList1.SelectedValue);
            GridView1.DataSource = DAO.GetListAttenByClassid(select,teachID, Date, slotID);
            GridView1.DataBind();
            List<Attendance> l = new List<Attendance>();
            foreach (Attendance row in l)
            {
                if (row.Status == true)
                {
                    RadioButton rPRE = (RadioButton)GridView1.FindControl("RadioButton1");
                    rPRE.Checked = true ;
                }
                else
                {
                    RadioButton rAP = (RadioButton)GridView1.FindControl("RadioButton2");
                    rAP.Checked = true;
                }

            }

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = 0;
            String date = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            int TeachID = Convert.ToInt32(Request.QueryString["TeachID"]);
            int clas = Convert.ToInt32(drClass.SelectedValue);
            int Slot= Convert.ToInt32(DropDownList1.SelectedValue);
            foreach (GridViewRow row in GridView1.Rows)
            {
                String rollNumer = row.Cells[1].Text;
                RadioButton RPRe = (row.Cells[4].FindControl("RadioButton1") as RadioButton);
                RadioButton RABs = (row.Cells[4].FindControl("RadioButton2") as RadioButton);
                bool Status=true;
                if (RPRe.Checked)
                {
                    Status = true;
                }
                else
                {
                    Status = false;
                }
                 count = DAO.UpdateAttendance(rollNumer, Status,date,clas,Slot,TeachID);
            }
            if ( count > 0)
            {
                Response.Write("Attendance Success ");
            }
            else
            {
                Response.Write("Attendance Fails");
            }
        }

        protected void drClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int TeachID = Convert.ToInt32(Request.QueryString["TeachID"]);
            LoadGrivData(TeachID);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            int TeachID = Convert.ToInt32(Request.QueryString["TeachID"]);
            TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            LoadGrivData(TeachID);
        }
    }
}