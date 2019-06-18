// Require mySQL node package
var mysql = require('mysql');
var inquirer = require('inquirer');
require("console.table");

// Link to mySQL Database
var connection = mysql.createConnection({
    host: "localhost",
    port: 8889,
    user: "root", //Your username
    password: "root", //Your password
    database: "bamazon_DB"
});

// Callback function
// Connect to mySQL database
connection.connect(function (err) {
    if (err) throw err;
    getProductList();
});

function getProductList() {
    connection.query("SELECT * FROM products", function (err, res) {
        if (err) reject(err);
        console.table(res);
        buyProduct()
    });
};

function buyProduct() {
    // The app should prompt users with two messages.
    return inquirer.prompt([{
        // The first should ask them the ID of the product they would like to buy.
        name: 'product_id',
        message: 'What is the ID of the product you would like to buy?',
        type: 'input',
        validate: function (value) {
            if (isNaN(value) === false) {
                return true;
            } else {
                console.log('\nPlease enter a valid ID.');
                return false;
            }
        }
    }, {
        // The second message should ask how many units of the product they would like to buy.
        name: 'number_of_units',
        message: 'How many units would you like to buy?',
        type: 'input',
        validate: function (value) {
            if (isNaN(value) === false) {
                return true;
            } else {
                console.log('\nPlease enter a valid quantity.');
                return false;
            }
        }
    }]).then(function (answer) {
        return new Promise(function (resolve, reject) {
            // query for all items in products table where the item_id is what was chosen
            connection.query("SELECT * FROM products WHERE item_id=?", answer.product_id, function (err, res) {
                if (err) reject(err);
                resolve(res);
            });
        }).then(function (result) {
            // Once the customer has placed the order, your application should check if your store has enough of the product to meet the customer's request.
            // If not, the app should log a phrase like `Insufficient quantity!`, and then prevent the order from going through.
            if (answer.number_of_units > result[0].stock_quantity) {
                return "Insufficient quantity!";
            } else {
                // If your store does have enough of the product, you should fulfill the customer's order.
                var object = {};
                // Answer -> the users responses to the prompts
                object.answer = answer;
                // Result -> the results of the query
                object.result = result;
                return object;
            }
        }).catch(function (err) {
            console.log(err);
            connection.destroy();
        }).then(function (object) {
            if (object.answer) {
                var newQuantity = object.result[0].stock_quantity - object.answer.number_of_units;
                var product = object.answer.product_id;
                var totalCost = (object.result[0].price * object.answer.number_of_units).toFixed(2);
                // Updating the SQL database to reflect the remaining quantity.
                connection.query("UPDATE products SET stock_quantity=? WHERE item_id=?", [newQuantity, product], function (err, res) {
                    if (err) reject(err);
                    // Once the update goes through, show the customer the total cost of their purchase.
                    console.log('Your total cost is $' + totalCost);
                    getProductList()
                });
            } else {
                console.log(object);
                // destroy connection
                connection.destroy();
            }
        });
    });
}







