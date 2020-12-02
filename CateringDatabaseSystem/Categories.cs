using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CateringDatabaseSystem
{
    public partial class Categories : Form
    {
        public Categories()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {//add category
            ConnectingData c = new ConnectingData();
            if (textBox2.Text == "" || comboBox2.Text == "")
            {
                MessageBox.Show("Fill all fields");
            }
            else
            {
                c.Inserts("insert into categories (CategoriesID, CategoryName, MeasuredIn) values ((select max(CategoriesID) from categories)+1, '" + textBox2.Text + "', '" + comboBox2.Text + "')");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all categories
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from Categories");
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete category
            ConnectingData c = new ConnectingData();
            if (textBox4.Text == "")
            {
                MessageBox.Show("Enter ID of category to delete.");
            }
            else
            {
                c.Inserts("delete from Categories where CategoriesID =" + textBox4.Text);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {//update category
            ConnectingData c = new ConnectingData();
            if (textBox7.Text == "")
            {
                MessageBox.Show("Enter ID of category to update.");
            }
            else if (textBox3.Text == "" && comboBox1.Text == "")
            {
                MessageBox.Show("Enter details to update.");
            }
            else
            {
                if (textBox3.Text != "")
                {//name
                    c.Inserts("update Categories set CategoryName = '" + textBox3.Text + "'" + "where CategoriesID = " + textBox7.Text);
                }
                if (comboBox1.Text != "")
                {//measured in
                    c.Inserts("update Categories set MeasuredIn = '" + comboBox1.Text + "'" + "where CategoriesID = " + textBox7.Text);
                }
            }
        }
    }
}
