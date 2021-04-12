using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignement
{
    public partial class ViewAttendstudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String StuName = Request.QueryString["Student"];
                Label1.Text = StuName;
                Label2.Text = StuName;
                LoadTerm(StuName);
                int TermID = Convert.ToInt32(Request.QueryString["term"]);
                LoadCourse(StuName, TermID );
                int CourseID = Convert.ToInt32(Request.QueryString["Course"]);
                LoadAttendanceDetails(TermID, CourseID, StuName);
           
            }
        }

        private void LoadAttendanceDetails(int termID, int courseID, string stuName)
        {
            GridView3.DataSource = DAO.LoadAttendanceDetails(termID, courseID, stuName);
            GridView3.DataBind();
      
        }

        private void LoadCourse(String NameStu,int iD)
        {
            GridView2.DataSource = DAO.LoadCourse(NameStu,iD);
            GridView2.DataBind();
        }

        private void LoadTerm(string stuName)
        {
            GridView1.DataSource = DAO.LoadTerm(stuName);
            GridView1.DataBind();
         
        }
    }
}