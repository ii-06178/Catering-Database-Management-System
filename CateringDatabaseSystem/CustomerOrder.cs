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
    public partial class CustomerOrder : Form
    {
        public CustomerOrder()
        {
            InitializeComponent();
        }

        private void CustomerDetails_Load(object sender, EventArgs e)
        {
            //populating categories combobox with values from the database (categories table)
            ConnectingData c = new ConnectingData();   
            DataTable ds = c.Select("Select CategoriesID, CategoryName from Categories"); 
            DataRow row = ds.NewRow(); //adding default null value as first element in combobox
            row[0] = 0;
            row[1] = "";
            ds.Rows.InsertAt(row, 0);

            comboBox3.DataSource = ds;
            comboBox3.DisplayMember = "CategoryName";
            comboBox3.ValueMember = "CategoriesID";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton5.Checked)
            {
                textBox4.Enabled = true;
            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (radioButton8.Checked == true & comboBox3.Text != "")
            {//search by category
                //populating list box with food items in selected category
                ConnectingData c = new ConnectingData();    
                DataTable ds = c.Select("Select fooditemid, itemname, unitprice from fooditem where categories_categoriesid = (select categoriesid from categories where categoryname = '" + comboBox3.Text + "')");
                listBox1.DataSource = ds; 
                listBox1.DisplayMember = "itemname";
                listBox1.ValueMember = "fooditemid";
            }
            else if (radioButton8.Checked == true & comboBox3.Text == "")
            {//error message if no category selected
                MessageBox.Show("Please select a category!");
            }
        }

        private void radioButton8_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton8.Checked)
            {
                comboBox3.Enabled = true;
            }
        }

        private void radioButton7_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton7.Checked == true)
            {
                comboBox3.Enabled = false;
            }
        }

        private void radioButton6_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton6.Checked == true)
            {
                comboBox3.Enabled = false;
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string measuredIn;
        }

        private void button2_Click(object sender, EventArgs e)
        {//enabling quantity or weight textboxes based on the type of food selected
            if (listBox1.SelectedItem.ToString() != "")
            {
                string fooditem = listBox1.SelectedItem.ToString();
                ConnectingData c = new ConnectingData();
                string measuredIn = c.getStringValue("Select measuredIn from Categories where categoriesid = (select categories_categoriesid from fooditem where itemname = " + fooditem + ")");
                if (measuredIn == "Quantity")
                {
                    textBox7.Enabled = true;
                    textBox5.Clear();
                    textBox5.Enabled = false;
                }
                else if (measuredIn == "Weight (Kg)")
                {
                    textBox5.Enabled = true;
                    textBox7.Clear();
                    textBox7.Enabled = false;
                }
            }
        }
    }
}
