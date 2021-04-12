using Assignement;
using DataAccessDemo.DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace TeacherManagerment
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
         
        }
        public static string SetValueForText1 = "";
        private void button1_Click(object sender, EventArgs e)
        {

        String user = User.Text;
            String pass = Pass.Text;
                SetValueForText1 = User.Text;

            Teacher t = DAO.LoginTeacher(user,pass);
            if (t != null)
            {
                Form1 d = new Form1();
                this.Hide();
                d.Show();
            }
            else
                MessageBox.Show("Invalid  Username or Password");
            }
        }
    public static class ControlID
    {
        public static string TextData { get; set; }
    }
}
