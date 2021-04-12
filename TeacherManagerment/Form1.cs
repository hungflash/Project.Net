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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        
        }
        public static string TeacherTXT = "";

        private void Form1_Load(object sender, EventArgs e)
        {
            userTxt.Text = Login.SetValueForText1;
            LoadTerm();
            LoadClass();
            int classID = Convert.ToInt32(CBXClass.SelectedValue);
            LoadStudent(classID);
        }

        private void LoadStudent(int classid)
        {
            dataGridView1.DataSource = DAO.LoadStudent(classid);
        }

        private void LoadClass()
        {
            CBXClass.DisplayMember = "ClassName";
            CBXClass.ValueMember = "ClassID";
            CBXClass.DataSource = DAO.LoadClass();
            CBXClass.SelectedIndex = 0;

        }

        private void LoadTerm()
        {
            CBXTerm.DisplayMember = "TermID";
            CBXTerm.ValueMember = "TermID";
            CBXTerm.DataSource = DAO.LoadTerm();
            CBXTerm.SelectedIndex = 0;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String F = textBox1.Text;
            String L = textBox2.Text;
            String A = textBox4.Text;
            String ph = txtphone.Text;
            String bi = dtDateBirth.Value.Date.ToString("yyyy-MM-dd");
            int term = Convert.ToInt32(CBXTerm.SelectedValue);
            String acc = txtacc.Text;
            String pass= txtpass.Text;
            int ClassID = Convert.ToInt32(CBXClass.SelectedValue);
            int count = DAO.AddStudent(F, L, bi, A, ph, term, acc, pass, ClassID);
            if (count > 0)
            {
                MessageBox.Show("ADD SO Successfully!!");
            }
            else
            {
                MessageBox.Show("ADD Very Fail!!");
            }
            LoadStudent(ClassID);
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Close");
            this.Close();
            Login d = new Login();
            d.Close();
        }

        private void CBXClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classID = Convert.ToInt32(CBXClass.SelectedValue);
            LoadStudent(classID);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
            {
                textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[0].FormattedValue.ToString() + "";
                textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells[1].FormattedValue.ToString() + "";
                dtDateBirth.Text = dataGridView1.Rows[e.RowIndex].Cells[2].FormattedValue.ToString() + "";
                textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() + "";
                txtphone.Text = dataGridView1.Rows[e.RowIndex].Cells[4].FormattedValue.ToString() + "";
                CBXTerm.Text = dataGridView1.Rows[e.RowIndex].Cells[5].FormattedValue.ToString() + "";
                txtacc.Text = dataGridView1.Rows[e.RowIndex].Cells[6].FormattedValue.ToString() + "";
                txtpass.Text = dataGridView1.Rows[e.RowIndex].Cells[7].FormattedValue.ToString() + "";
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            TeacherTXT = userTxt.Text;
            Form2 f = new Form2();
            this.Hide();
            f.Show();
        }
    }
    }
