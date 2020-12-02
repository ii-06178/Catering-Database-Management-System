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
    public partial class CustomerOrder : Form
    {
        public CustomerOrder()
        {
            InitializeComponent();
        }

        private void CustomerDetails_Load(object sender, EventArgs e)
        {
            //populating categories combobox with values from the database (categories table)
            ConnectingData c = new ConnectingData();   
            DataTable ds = c.Select("Select CategoriesID, CategoryName from Categories"); 
            DataRow row = ds.NewRow(); //adding default null value as first element in combobox
            row[0] = 0;
            row[1] = "";
            ds.Rows.InsertAt(row, 0);

            comboBox3.DataSource = ds;
            comboBox3.DisplayMember = "CategoryName";
            comboBox3.ValueMember = "CategoriesID";

            //populating region combobox with values from the database (region table)
            ConnectingData c2 = new ConnectingData();
            DataTable ds2 = c2.Select("Select regionID, regionDescription from region");
            DataRow row2 = ds2.NewRow(); //adding default null value as first element in combobox
            row2[0] = 0;
            row2[1] = "";
            ds2.Rows.InsertAt(row2, 0);

            comboBox2.DataSource = ds2;
            comboBox2.DisplayMember = "regionDescription";
            comboBox2.ValueMember = "regionID";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {//confirm order 
            // error messages for null values
             if (textBox2.Text == "")
            {
                MessageBox.Show("Please enter your name.");
            }
            else if (textBox6.Text == "")
            {
                MessageBox.Show("Please enter your contact number.");
            }
            else if (comboBox2.Text == "")
            {
                MessageBox.Show("Please select your region.");
            }
            else if (textBox9.Text == "")
            {
                MessageBox.Show("Please enter your address.");
            }
            else if (textBox11.Text == "")
            {
                MessageBox.Show("Please enter your email.");
            }
            else if (textBox14.Text == "0")
            {
                MessageBox.Show("Please select items to order!");
            }
            else if (!radioButton4.Checked && !radioButton5.Checked)
            {
                MessageBox.Show("Please select a payment method!");
            }
            else if (radioButton4.Checked && textBox4.Text == "")
            {
                MessageBox.Show("Please enter your credit card number.");
            }
            else if (dateTimePicker1.Value < DateTime.Today)
            {
                MessageBox.Show("Invalid date!\nAn order can not be placed for before today.");
            }
             else
            {//add order to database
                //adding customer details in customers table
                ConnectingData c = new ConnectingData();
                c.Inserts("insert into customers (customerID, customerName, customerContactNo, customerAddress, alternatePhone, email, creditCardNo) values ((select max(customerID) from customers)+1, '"+ textBox2.Text + "' , '" + textBox6.Text + "' , '" + textBox9.Text + "' , '" + textBox8.Text + "' , '" + textBox11.Text + "' , '" + textBox4.Text + "')");
                //adding payment details to payment table
                if (radioButton4.Checked)
                {
                    c.Inserts("insert into payment (paymentID, paymentType) values ((select max(paymentID) from payment)+1, 'Credit Card')");
                }
                else if (radioButton5.Checked)
                {
                    c.Inserts("insert into payment (paymentID, paymentType) values ((select max(paymentID) from payment)+1, 'COD')");
                }
                //adding order to orders table
                c.Inserts("insert into orders (orderID, Payment_PaymentID, Region_RegionID, Customers_CustomerID, OrderDate, RequiredDate, OrderStatus, TotalPrice) values ((select max(orderID) from orders)+1, (select max(paymentID) from payment), (select regionID from region where regionDescription = '" + comboBox2.Text + "'), (select max(customerID) from customers), getdate(), '" + dateTimePicker1.Value + "', 'In Process', " + textBox10.Text + ")");

                //adding each food item in order to orderByItem table
                foreach (ListViewItem item in listView1.Items)
                {
                    int quantity = int.Parse(listView2.Items[item.Index].Text); //getting quantity of food item from listview2
                    c.Inserts("insert into orderByItem (orderID, FoodItem_FoodItemID, quantity, discount, unitprice) values ((select max(orderID) from orders), (select foodItemID from foodItem where itemName = '" + item.Text + "'), " + quantity + ", " + textBox13.Text + ", (select unitprice from foodItem where itemName = '" + item.Text + "')) ");
                }
                MessageBox.Show("Thank You! \nYour order has been recorded.");
                this.Close();
            }
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {//if payment method is COD, disabling credit card textbox
            if (radioButton5.Checked)
            {
                textBox4.Clear();
                textBox4.Enabled = false;
            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }
        //enabling categories combobox only if categories is selected
        private void radioButton8_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton8.Checked)
            {
                comboBox3.Enabled = true;
            }
        }

        private void radioButton7_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton7.Checked == true)
            {
                comboBox3.Enabled = false;
            }
        }

        private void radioButton6_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton6.Checked == true)
            {
                comboBox3.Enabled = false;
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {//enabling textbox for either unit amount or weight for order quantity based on the unit of measurement of food item
            if (listBox2.SelectedItem != null)
            {
                textBox3.Text = "0"; //resetting price to 0
                if (listBox2.GetItemText(listBox2.SelectedItem) == "Weight (Kg)")
                {//measured in weight 
                    textBox5_TextChanged(sender, e); //if diff food item selected from list, update price
                    textBox5.Enabled = true;
                    textBox7.Text = "Enter Amount"; //reset default
                    textBox7.Enabled = false; //disable amount textbox
                }
                else
                {//measured in units 
                    textBox7_TextChanged(sender, e);//if diff food item selected from list, update price
                    textBox7.Enabled = true;
                    textBox5.Text = "Enter Weight (Kg)"; //reset default
                    textBox5.Enabled = false; //disable weight textbox
                }
            }
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {//calculating price of amount entered of food item 
            if (textBox7.Text != "Enter Amount")
            {
                int temp;
                if (!int.TryParse(textBox7.Text, out temp))
                {//checking if the value entered is invalid
                    textBox1.Text = "Invalid, please enter a whole number!";
                }
                else
                {
                    textBox1.Text = ""; 
                    string unitprice = listBox3.GetItemText(listBox3.SelectedItem);
                    string unitquantity = listBox4.GetItemText(listBox4.SelectedItem);
                    textBox3.Text = (double.Parse(textBox7.Text) * double.Parse(unitprice) / double.Parse(unitquantity)).ToString();
                }
            }
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {//search by category
            textBox3.Text = "0"; //resetting price to 0
            if (radioButton8.Checked == true & comboBox3.Text != "")
            {//populating list box with food items in selected category
                ConnectingData c = new ConnectingData();
                DataTable ds = c.Select("Select fooditemid, itemname, unitprice,unitquantity,measuredin from fooditem f inner join categories c on f.categories_categoriesid = c.categoriesid  where categoryname = '" + comboBox3.Text + "'");
                listBox1.DataSource = ds;
                listBox2.DataSource = ds;
                listBox3.DataSource = ds;
                listBox4.DataSource = ds;
                listBox1.DisplayMember = "itemname";
                listBox2.DisplayMember = "measuredin";
                listBox3.DisplayMember = "unitprice";
                listBox4.DisplayMember = "unitquantity";
                listBox1.ValueMember = "fooditemid";
                listBox2.ValueMember = "fooditemid";
                listBox3.ValueMember = "fooditemid";
                listBox4.ValueMember = "fooditemid";
            }
            else if (radioButton8.Checked == true & comboBox3.Text == "")
            {//error message if no category selected
                MessageBox.Show("Please select a category!");
            }
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {//calculating price of amount entered of food item by weight
            if (textBox5.Text != "Enter Weight (Kg)")
            {
                double temp;
                if (!double.TryParse(textBox5.Text, out temp))
                {//checking if the value entered is invalid
                    textBox1.Text = "Invalid, please enter a number!";
                }
                else
                {
                    textBox1.Text = "";
                    string unitprice = listBox3.GetItemText(listBox3.SelectedItem);
                    string unitquantity = listBox4.GetItemText(listBox4.SelectedItem);
                    textBox3.Text = (double.Parse(textBox5.Text) * double.Parse(unitprice) / double.Parse(unitquantity)).ToString();
                }
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {//add to cart  
            if (textBox3.Text == "0")
            {//error message if quantity not specified
                MessageBox.Show("Please determine item and quantity to order!");
            }
            else
            {
                listView1.Items.Add(listBox1.GetItemText(listBox4.SelectedItem));
                if (textBox5.Enabled)
                {
                    listView2.Items.Add(textBox5.Text);
                }
                if (textBox7.Enabled)
                {
                    listView2.Items.Add(textBox7.Text);
                }
                listView3.Items.Add(textBox3.Text);
            }
            //calculating and displaying cart total
            double cart_total = 0;
            foreach (ListViewItem item in listView3.Items)
            {
                cart_total = cart_total + double.Parse(item.Text);
                textBox14.Text = cart_total.ToString();
            }
            //calculating and displaying total cost
            double total_cost = 200 + ( cart_total * (100 - int.Parse(textBox13.Text)) / 100);
            textBox10.Text = total_cost.ToString();
        }

        private void comboBox2_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {//if date selected is before today, it is invalid
            if (dateTimePicker1.Value < DateTime.Today)
            {
                textBox15.Text = "Invalid \n date!";
            }
            else
            {
                textBox15.Text = "";
            }
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {//if payment method is online, enabling credit card textbox
            if (radioButton4.Checked)
            {
                textBox4.Enabled = true;
            }
        }

        private void groupBox3_ControlAdded(object sender, ControlEventArgs e)
        {

        }

        private void listView1_ControlAdded(object sender, ControlEventArgs e)
        {
            
        }
    }
}

