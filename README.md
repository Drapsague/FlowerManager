# FlowerManager


In this project, I have developed a comprehensive system to manage various aspects of a flower shop's operations. Firstly, I established several database tables to store crucial information. The "Clients" table holds detailed records of our customers, including their names, contact details, and addresses. Another table, "EtatsCommande" (OrderStates), keeps track of the different stages an order can go through, while the "Commandes" table stores specific details about each order, such as the associated client, order status, and delivery information.

Furthermore, to facilitate the sale of both standard and custom bouquet arrangements, I created tables like "BouquetsStandards" and "Bouquets" to store information about these products, including their names, compositions, prices, and categories. Additionally, the "Fleurs" table records the available flower options that can be used in custom bouquet creations, and the "Stocks" table helps manage flower inventory by tracking stock levels and setting alert thresholds for reordering.

To interact with the database and perform various tasks, I modularized the C# code into different functions. These functions include opening and closing the database connection, updating the status of orders, verifying existing emails in the client database, displaying lists of orders, products, and clients, inserting new client records, placing new orders, inserting new bouquet records, and handling custom bouquet orders.

Overall, this project provides a robust framework for efficiently managing customer information, order processing, product inventory, and sales operations within the flower shop, enhancing productivity and customer satisfaction.
