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
    public partial class FoodItems : Form
    {
        public FoodItems()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {//add ingredient from combobox to listview
            listView1.Items.Add(comboBox1.Text);
            listView2.Items.Add(textBox6.Text);

        }

        private void button1_Click(object sender, EventArgs e)
        {//adding each item to fooditems table, and adding itemid and ingid to junction table
            //int i = listView1.Items.Count;
            ConnectingData c = new ConnectingData();
            c.Inserts("insert into fooditem (fooditemID, itemName, Categories_CategoriesID, unitprice) values (" + textBox1.Text + ", '" + textBox2.Text + "', (select categoriesID from categories where categoryname = '" + comboBox1.Text + "'), " + textBox5.Text + ")");
            for (int i = 0; i < listView1.Items.Count; i++)
            {
                c.Inserts("insert into ingredients_for_fooditem (ingredients_ingredientsID, fooditem_fooditemID, quantity) values ((select ingredientsid from ingredients where ingredientname = '" + listView1.Items[i] + "')," + textBox1.Text + "," + listView2.Items[i] + ")");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete food item
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from fooditem where fooditemID =" + textBox4.Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {//update food item
            ConnectingData c = new ConnectingData();
            c.Inserts("update fooditem set unitprice = " + textBox3.Text + "where fooditemID = " + textBox7.Text);
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all food items
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select * from fooditem");
        }
    }
}
