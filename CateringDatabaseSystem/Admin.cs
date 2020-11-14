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
    public partial class Admin : Form
    {
        public Admin()
        {
            InitializeComponent();
        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text.Equals("Orders"))
            {
                var OrdersAdminView = new OrdersAdminView();
                OrdersAdminView.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Customers"))
            {
                var CustomersAdminView = new CustomersAdminView();
                CustomersAdminView.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Ingredients"))
            {
                var Ingredients = new Ingredients();
                Ingredients.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Food Items"))
            {
                var FoodItems = new FoodItems();
                FoodItems.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Weekly Menu"))
            {
                var WeeklyMenu = new WeeklyMenu();
                WeeklyMenu.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Riders"))
            {
                var RiderAdminView = new RiderAdminView();
                RiderAdminView.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Categories"))
            {
                var Categories = new Categories();
                Categories.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Region"))
            {
                var Region = new Region();
                Region.Show();
                //this.Hide();
            }
            else if (comboBox1.Text.Equals("Deals"))
            {
                var Deals = new Deals();
                Deals.Show();
                //this.Hide();
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
