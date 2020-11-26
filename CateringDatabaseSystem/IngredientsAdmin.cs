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
            c.Inserts("insert into ingredients (ingredientsID, ingredientName, itemsInStock) values ((select max(ingredientsID) from ingredients)+1, '" + textBox2.Text + "'," + textBox6.Text + ")");
        }

        private void button4_Click(object sender, EventArgs e)
        {// show all ingredients
             ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from ingredients");
        }

        private void button3_Click(object sender, EventArgs e)
        {//update ingredients
            ConnectingData c = new ConnectingData();
            c.Inserts("update ingredients set itemsInStock = " + textBox3.Text + "where ingredientsID = " + textBox7.Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete ingredient
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from ingredients where ingredientsID =" + textBox4.Text);
        }

        private void button6_Click(object sender, EventArgs e)
        {// show all items with this ingredient
            dataGridView1.DataSource = c.Select("select ingredientName as 'Ingredient', itemName as 'Food Item', quantity as 'Quantity Required' from ingredients i inner join ingredients_for_fooditem fi on i.ingredientsID = fi.Ingredients_IngredientsID inner join fooditem f on fi.FoodItem_FoodItemID = f.FoodItemID where i.ingredientsID = " + textBox9.Text);
        }
    }
}
