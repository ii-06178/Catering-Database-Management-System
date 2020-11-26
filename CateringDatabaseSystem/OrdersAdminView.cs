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

        private void button5_Click(object sender, EventArgs e)
        {//show all orders with particular food item or customer
            ConnectingData c = new ConnectingData();
            if (textBox2.Text != "")
            {//select by customer
                dataGridView1.DataSource = c.Select("select * from orders where customers_customerid = " + textBox2.Text);
            }
            else if (textBox3.Text != "")
            {//select by food item
                dataGridView1.DataSource = c.Select("select * from orders o inner join orderbyitem oi on o.orderid = oi.orders_orderid where fooditem_fooditemid = (select fooditemid from fooditem where itemname = '" + textBox3.Text + "')");
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Enabled == true)
            {
                textBox2.Enabled = true;
                textBox3.Clear();
                textBox3.Enabled = false;
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Enabled == true)
            {
                textBox3.Enabled = true;
                textBox2.Clear();
                textBox2.Enabled = false;
            }
        }
    }
}
