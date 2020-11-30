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
    public partial class Rider : Form
    {
        public Rider()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {//select orders to deliver and display in 2nd datagridview
            DataTable dt = new DataTable();
            dt.Columns.Add("OrderID");
            dt.Columns.Add("RequiredDate");
            dt.Columns.Add("TotalPrice");
            dt.Columns.Add("PaymentType");
            //for each selected row, add row to second datagridview
            foreach (DataGridViewRow row in dataGridView1.SelectedRows)
            {
                dt.Rows.Add(row.Cells[0].Value, row.Cells[1].Value, row.Cells[2].Value, row.Cells[3].Value);
            }
            dataGridView2.DataSource = dt;
            button6.Enabled = true;
        }

        private void Rider_Load(object sender, EventArgs e)
        {
            //populating region combobox with values from the database (region table)
            ConnectingData c2 = new ConnectingData();
            DataTable ds2 = c2.Select("Select regionID, regionDescription from region");
            DataRow row2 = ds2.NewRow(); //adding default null value as first element in combobox
            row2[0] = 0;
            row2[1] = "";
            ds2.Rows.InsertAt(row2, 0);

            comboBox1.DataSource = ds2;
            comboBox1.DisplayMember = "regionDescription";
            comboBox1.ValueMember = "regionID";
        }

        private void button1_Click(object sender, EventArgs e)
        {//view orders in region where status = in process and no rider is assigned
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select OrderID, RequiredDate, TotalPrice, PaymentType from orders o inner join payment p on o.payment_paymentID = p.paymentID where region_regionID = (select regionID from region where regionDescription = '" + comboBox1.Text + "') and orderStatus = 'In Process' and rider_riderID is null");
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {//remove selected order
            foreach (DataGridViewRow row in dataGridView2.SelectedRows)
            {
                dataGridView2.Rows.Remove(row);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {//assigning riderID to selected orders
            ConnectingData c = new ConnectingData();
            if (textBox1.Text == "")
            {
                MessageBox.Show("Enter your ID");
            }
            else if (dataGridView2.Rows.Count == 0)
            {
                MessageBox.Show("Select orders to deliver");
            }
            else
            {
                foreach (DataGridViewRow row in dataGridView2.Rows)
                {
                    c.Inserts("update orders set rider_riderID = " + textBox1.Text + "where orderID = " + row.Cells[0].Value);
                }
                MessageBox.Show("Orders have been selected.");
            }
        }
    }
}
