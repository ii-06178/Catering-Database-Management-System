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
    public partial class IngredientsAdmin : Form
    {
        public IngredientsAdmin()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {//adding ingredients
            ConnectingData c = new ConnectingData();
            if (textBox2.Text == "" || textBox6.Text == "" || comboBox2.Text == "")
            {
                MessageBox.Show("Fill all fields!");
            }
            else
            {
                c.Inserts("insert into ingredients (ingredientsID, ingredientName, itemsInStock, measuredIn) values ((select max(ingredientsID) from ingredients)+1, '" + textBox2.Text + "'," + textBox6.Text + ", '" + comboBox2.Text + "')");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {// show all ingredients
             ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from ingredients");
        }

        private void button3_Click(object sender, EventArgs e)
        {//update ingredients
            if (textBox7.Text != "")
            {//if an ID is entered
                ConnectingData c = new ConnectingData();
                if (textBox3.Text != "")
                {//quantity
                    c.Inserts("update ingredients set itemsInStock = " + textBox3.Text + "where ingredientsID = " + textBox7.Text);
                }
                if (comboBox1.Text != "")
                {//measured in
                    c.Inserts("update ingredients set measuredIn = '" + comboBox1.Text + "' where ingredientsID = " + textBox7.Text);
                }
                if (textBox3.Text == "" && comboBox1.Text == "")
                {
                    MessageBox.Show("Specify value(s) to update.");
                }
            }
            else
            {
                MessageBox.Show("Enter ID of ingredient to update.");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete ingredient
            ConnectingData c = new ConnectingData();
            if (textBox4.Text == "")
            {
                MessageBox.Show("Enter ingredient ID");
            }
            else
            {
                c.Inserts("delete from ingredients where ingredientsID =" + textBox4.Text);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {// show all items with this ingredient
            ConnectingData c = new ConnectingData();
            if (textBox9.Text == "")
            {
                MessageBox.Show("Enter ingredient ID");
            }
            else
            {
                dataGridView1.DataSource = c.Select("select ingredientName as 'Ingredient', itemName as 'Food Item', quantity as 'Quantity Required', unitOfMeasurement as 'Unit of Measurement' from ingredients i inner join ingredients_for_fooditem fi on i.ingredientsID = fi.Ingredients_IngredientsID inner join fooditem f on fi.FoodItem_FoodItemID = f.FoodItemID where i.ingredientsID = " + textBox9.Text);
            }
        }
    }
}
