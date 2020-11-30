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
    }
}
