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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            this.Hide();
            f.Show();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            String TeacherName = Form1.TeacherTXT;
            String d = dtSchedule.Value.Date.ToString("yyyy-MM-dd");
            dataGridView1.DataSource = DAO.GetSchedule(TeacherName, d);
        }
        private void dtSchedule_ValueChanged(object sender, EventArgs e)
        {
            String TeacherName = Form1.TeacherTXT;
            String d = dtSchedule.Value.Date.ToString("yyyy-MM-dd");
            dataGridView1.DataSource = DAO.GetSchedule(TeacherName, d);
        }
    }
}
