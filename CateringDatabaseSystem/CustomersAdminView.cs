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
    public partial class CustomersAdminView : Form
    {
        public CustomersAdminView()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {//add customer
            ConnectingData c = new ConnectingData();
            //error messages for null values
            if (textBox2.Text == "")
            {
                MessageBox.Show("Please enter customer name.");
            }
            else if (textBox6.Text == "")
            {
                MessageBox.Show("Please enter customer phone number.");
            }
            else if (textBox9.Text == "")
            {
                MessageBox.Show("Please enter customer address.");
            }
            else if (textBox11.Text == "")
            {
                MessageBox.Show("Please enter customer email address.");
            }
            else
            {//add to database
                c.Inserts("insert into customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, AlternatePhone,Email) values ((select max(CustomerID) from customers)+1, '" + textBox2.Text + "', '" + textBox6.Text + "', '" + textBox9.Text + "', '" + textBox8.Text + "', '" + textBox11.Text + "'" + ")");
            }
            if (textBox10.Text != "")
            {//if credit card info is given, add to database
                c.Inserts("insert into customers (CreditCardNo) values ('" + textBox10.Text + "')");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {//update customer
            ConnectingData c = new ConnectingData();
            if (textBox7.Text == "")
            {
                MessageBox.Show("Please enter ID of customer to update.");
            }
            else
            {
                c.Inserts("update customers set CustomerAddress = '" + textBox5.Text + "'" + "where CustomerID = " + textBox7.Text);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all customers
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from Customers");
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete customer
            ConnectingData c = new ConnectingData();
            if (textBox4.Text == "")
            {
                MessageBox.Show("Please enter the ID of the customer to delete.");
            }
            else
            {
                c.Inserts("delete from Customers where CustomerID =" + textBox4.Text);
            }
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            if (textBox5.Text != "")
            {
                textBox1.Text = "";
            }
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            if (textBox5.Text == "" && textBox7.Text != "")
            {
                textBox1.Text = "NOTE: Leaving address field empty will set its value to NULL";
            }
            else
            {
                textBox1.Text = "";
            }
        }
    }
}
