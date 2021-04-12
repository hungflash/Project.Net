using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignement
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String uid = UserName.Text;
                String pass = password.Text;
                Account a = DAO.Login(uid, pass);
                Teacher t = DAO.LoginTeacher(uid, pass);
                if (t!=null)
                {
                    Response.Redirect("TeacherAttendent.aspx?NameTeach=" + UserName.Text+"&TeachID="+t.TeacherID);

                } else if (a != null)
                {
                    Response.Redirect("ViewAttendstudent.aspx?Student="+UserName.Text);
                    //Response.Redirect("default2.aspx ?firstname=" + TextBox1.Text + "&lastname=" + TextBox2.Text);
                }
                else
                {
                    Response.Write("Incorrrect User and Password");
                }
            }
            catch (Exception ex)
            {
                //Response.Redirect("ERR.aspx");
                Response.Write(ex.Message);
            }
        }
    }
}