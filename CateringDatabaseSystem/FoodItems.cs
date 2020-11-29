﻿using System;
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
            c.Inserts("insert into fooditem (fooditemID, itemName, Categories_CategoriesID, unitprice, unitquantity) values ((select max(fooditemID) from fooditem)+1 , '" + textBox2.Text + "', (select categoriesID from categories where categoryname = '" + comboBox2.Text + "'), " + textBox5.Text + ", " + textBox1.Text + ")");
            for (int i = 0; i < listView1.Items.Count; i++)
            {
                c.Inserts("insert into ingredients_for_fooditem (fooditem_fooditemID, ingredients_ingredientsID, quantity) values ("+textBox1.Text + ",(select ingredientsid from ingredients where ingredientname = '" + listView1.Items[i].Text + "')," + listView2.Items[i].Text + ")");
            }
            listView1.Clear();
            listView2.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {//delete food item
            ConnectingData c = new ConnectingData();
            c.Inserts("delete from ingredients_for_fooditem where fooditem_fooditemID =" + textBox4.Text);
            c.Inserts("delete from fooditem where fooditemID =" + textBox4.Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {//update food item
            ConnectingData c = new ConnectingData();
            if (textBox3.Text != "")
            {//updating unitprice
                c.Inserts("update fooditem set unitprice = " + textBox3.Text + "where fooditemID = " + textBox7.Text);
            }
            if (textBox8.Text != "")
            {//updating item name
                c.Inserts("update fooditem set itemName = '" + textBox8.Text + "' where fooditemID = " + textBox7.Text);
            }
            if (comboBox3.Text != "")
            {//updating item category
                c.Inserts("update fooditem set Categories_CategoriesID = (select categoriesID from categories where categoryname = '" + comboBox3.Text + "') where fooditemID = " + textBox7.Text);
            }
            if (textBox10.Text != "")
            {//updating item name
                c.Inserts("update fooditem set unitQuantity = " + textBox10.Text + " where fooditemID = " + textBox7.Text);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {//show all food items
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select fooditemID as 'ID', itemname as 'Item', categoryname as 'Category', unitquantity as 'Unit Quantity', measuredin as 'Measured In', unitprice as 'Unit Price (Rs.)' from fooditem f inner join categories c on f.Categories_CategoriesID = c.CategoriesID");
        }

        private void button7_Click(object sender, EventArgs e)
        {//show ingredients for selected food item
            ConnectingData c = new ConnectingData();
            dataGridView1.DataSource = c.Select("select itemname as 'Food Item', ingredientname as 'Ingredients', Quantity from fooditem f inner join ingredients_for_fooditem fi on f.fooditemid = fi.fooditem_fooditemID inner join ingredients i on i.ingredientsid = fi.ingredients_ingredientsid where f.fooditemid = " + textBox9.Text + "order by itemname");
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void FoodItems_Load(object sender, EventArgs e)
        {
            //populating categories combobox with values from the database (categories table)
            ConnectingData c = new ConnectingData();
            DataTable ds = c.Select("Select CategoriesID, CategoryName from Categories");
            DataRow row = ds.NewRow(); //adding default null value as first element in combobox
            row[0] = 0;
            row[1] = "";
            ds.Rows.InsertAt(row, 0);

            comboBox2.DataSource = ds;
            comboBox2.DisplayMember = "CategoryName";
            comboBox2.ValueMember = "CategoriesID";
            comboBox3.DataSource = ds;
            comboBox3.DisplayMember = "CategoryName";
            comboBox3.ValueMember = "CategoriesID";

            //populating ingredients combobox with values from the database (categories table)
            ConnectingData c2 = new ConnectingData();
            DataTable ds2 = c2.Select("Select IngredientsID, IngredientName from Ingredients");
            DataRow row2 = ds2.NewRow(); //adding default null value as first element in combobox
            row2[0] = 0;
            row2[1] = "";
            ds2.Rows.InsertAt(row2, 0);

            comboBox1.DataSource = ds2;
            comboBox1.DisplayMember = "IngredientName";
            comboBox1.ValueMember = "IngredientsID";
        }
    }
}
