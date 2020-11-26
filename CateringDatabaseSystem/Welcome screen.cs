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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            /*if (comboBox1.Text.Equals("Admin") || comboBox1.Text.Equals("Rider"))
            {
                textBox1.Enabled = true;
                textBox2.Enabled = true;
                button2.Enabled = true;
            }
            else*/ 
            if (comboBox1.Text.Equals("Customer"))
            {//if role selected is customer, open customer order form
                var CustomerOrder = new CustomerOrder();
                CustomerOrder.Show();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {//opens forms for role selected
            if (comboBox1.Text.Equals("Admin"))
            {
                var Admin = new Admin();
                Admin.Show();
            }
            else if (comboBox1.Text.Equals("Rider"))
            {
                var Rider = new Rider();
                Rider.Show();
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {//enable login textboxes only if role selected is rider or admin, disable otherwise
            if (comboBox1.Text == "Rider" || comboBox1.Text == "Admin")
            {
                textBox1.Enabled = true;
                textBox2.Enabled = true;
                button2.Enabled = true;
            }
            else if (comboBox1.Text == "Customer")
            {
                textBox1.Clear();
                textBox2.Clear();
                textBox1.Enabled = false;
                textBox2.Enabled = false;
                button2.Enabled = false;
            }
        }
    }
}
