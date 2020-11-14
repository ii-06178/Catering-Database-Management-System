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
        {
            ConnectingData c = new ConnectingData();
            c.Inserts("insert into customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, AlternatePhone,Email,CreditCardNo) values (" + textBox1.Text + ", " + "'" + textBox2.Text + "'" + ", " + textBox6.Text + ", " + "'" + textBox9.Text + "'" + ", " + textBox8.Text + ", " + "'" + textBox11.Text + "'" + ", " + textBox10.Text + ")");
        }
    }
}
