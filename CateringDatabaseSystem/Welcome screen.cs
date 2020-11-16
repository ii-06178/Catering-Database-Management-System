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
            if (comboBox1.Text.Equals("Admin") || comboBox1.Text.Equals("Rider"))
            {
                textBox1.Enabled = true;
                textBox2.Enabled = true;
                button2.Enabled = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text.Equals("Admin"))
            {
                var Admin = new Admin();
                Admin.Show();
                this.Hide();
            }
            else if (comboBox1.Text.Equals("Rider"))
            {
                var Rider = new Rider();
                Rider.Show();
                this.Hide();
            }
        }
    }
}
