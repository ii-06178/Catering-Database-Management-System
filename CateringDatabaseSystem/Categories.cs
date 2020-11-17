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
            c.Inserts("insert into categories (CategoriesID, CategoryName, MeasuredIn) values (" + textBox1.Text + ", '" + textBox2.Text + "', '" + comboBox2.Text + "')");
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all categories
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from Categories");
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete category
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from Categories where CategoriesID =" + textBox4.Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {//update category
            ConnectingData c = new ConnectingData();
            c.Inserts("update Categories set CategoryName = '" + textBox3.Text + "'" + "where CategoriesID = " + textBox7.Text);
        }
    }
}
