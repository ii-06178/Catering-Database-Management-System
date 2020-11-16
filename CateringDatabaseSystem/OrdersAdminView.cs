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
    public partial class OrdersAdminView : Form
    {
        public OrdersAdminView()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {//update order status
            ConnectingData c = new ConnectingData();
            c.Inserts("update orders set orderstatus = '" + comboBox1.Text + "'" + "where OrderID = " + textBox1.Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete order
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from Orders where OrderID =" + textBox4.Text);

        }

        private void button4_Click(object sender, EventArgs e)
        {//show all orders
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from orders");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
