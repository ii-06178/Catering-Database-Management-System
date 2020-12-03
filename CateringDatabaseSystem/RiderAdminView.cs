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
    public partial class RiderAdminView : Form
    {
        public RiderAdminView()
        {
            InitializeComponent();
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {//add rider
            ConnectingData c = new ConnectingData();
            c.Inserts("insert into rider (riderID, riderName, riderPhoneNo, RiderCNIC, RiderCompany, RiderEmail, RiderPassword) values ((select max(riderID) from rider)+1, '" + textBox2.Text + "', '" + textBox6.Text + "' , '" + textBox9.Text + "', '" + textBox8.Text + "', '" + textBox11.Text + "', '" + textBox10.Text + "')");
        }

        private void RiderAdminView_Load(object sender, EventArgs e)
        {
            
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all riders
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from rider");
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete rider
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from rider where riderID =" + textBox4.Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {//update rider
            ConnectingData c = new ConnectingData();
            if (textBox1.Text != "")
            {//name
                c.Inserts("update rider set riderName = '" + textBox1.Text + "'" + "where riderID = " + textBox7.Text);
            }
            if (textBox5.Text != "")
            {//phone number
                c.Inserts("update rider set riderPhoneNo = '" + textBox5.Text + "'" + "where riderID = " + textBox7.Text);
            }
            if (textBox12.Text != "")
            {//password
                c.Inserts("update rider set riderPassword = '" + textBox12.Text + "'" + "where riderID = " + textBox7.Text);
            }
        }
        
        private void button6_Click(object sender, EventArgs e)
        {//search
            ConnectingData c = new ConnectingData();
            if (comboBox1.Text == "Rider ID")
            {
                dataGridView1.DataSource = c.Select("select * from rider where riderID = " + textBox3.Text);
            }
            else if (comboBox1.Text == "All Orders Delivered By Rider")
            {
                dataGridView1.DataSource = c.Select("select orderID as 'ID',customers_customerID as 'Customer ID', paymentType as 'Payment Type', region_regionID as 'Region ID', rider_riderID as 'Rider ID', orderDate as 'Order Date', requiredDate as 'Required Date', shippedDate as 'Shipped Date', OrderStatus as 'Order Status', totalPrice as 'Total Price/Rs.'  from payment p inner join orders o on p.paymentid = o.payment_paymentid where rider_riderID = " + textBox3.Text);
            }
            else if (comboBox1.Text == "Rider Name")
            {
                dataGridView1.DataSource = c.Select("select * from rider where riderName = '" + textBox3.Text + "'");
            }
            else if (comboBox1.Text == "Rider Company")
            {
                dataGridView1.DataSource = c.Select("select * from rider where riderCompany = '" + textBox3.Text + "'");
            }
            else if (comboBox1.Text == "Delivered Most Orders")
            {
                dataGridView1.DataSource = c.Select("select top(1) RiderID, RiderName, RiderPhoneNo, RiderCNIC, RiderCompany, RiderEmail, RiderPassword, count(OrderID) as 'No of Orders Delivered' from rider r inner join orders o on r.riderID = o.Rider_RiderID group by riderID, RiderName, RiderPhoneNo, RiderCNIC, RiderCompany, RiderEmail, RiderPassword");
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.Text == "Rider ID")
            {
                textBox3.Enabled = true;
                textBox3.Text = "Enter Rider ID";
            }
            else if (comboBox1.Text == "All Orders Delivered By Rider")
            {
                textBox3.Enabled = true;
                textBox3.Text = "Enter Rider ID";
            }
            else if (comboBox1.Text == "Rider Name")
            {
                textBox3.Enabled = true;
                textBox3.Text = "Enter Rider Name";
            }
            else if (comboBox1.Text == "Rider Company")
            {
                textBox3.Enabled = true;
                textBox3.Text = "Enter Company Name";
            }
            else if (comboBox1.Text == "Delivered Most Orders")
            {
                textBox3.Clear();
                textBox3.Enabled = false;
            }
        }
    }
}
