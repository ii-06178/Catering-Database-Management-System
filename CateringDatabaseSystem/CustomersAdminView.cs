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
            c.Inserts("insert into customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, AlternatePhone,Email) values (" + textBox1.Text + ", '" + textBox2.Text + "', " + textBox6.Text + ", '" + textBox9.Text + "', " + textBox8.Text + ", '" + textBox11.Text + "'" + ")");
            if (textBox10.Text != "")
            {
                c.Inserts("insert into customers (CreditCardNo) values (" + textBox10.Text + ")");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {//update customer
            ConnectingData c = new ConnectingData();
            c.Inserts("update customers set CustomerAddress = '" + textBox5.Text + "'" + "where CustomerID = " + textBox7.Text);
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all customers
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from Customers");
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete customer
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from Customers where CustomerID =" + textBox4.Text);
        }
    }
}
