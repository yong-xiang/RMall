# A sample ecommerce website using .NET6 web api, identity and EF6

## Tools required
1. Visual Studio 2022
2. MSSQL Server 2019 or above

## Setting up
1. Create an MSSQL database [RMall]
2. Execute the mssql-db-script.sql targeting at the new database created
3. Update the ConnectionString found in RMall\RMallAPIs\appsettings.json
4. Run both (Ctrl+F5) RMallAPIs and RMall projects.

## Available features (Frontend Web UI)
1. Register new standard user account
2. Login
3. Logout
4. Search Products (search by product title)
5. My Cart (edit quantity)

## Available features (API)
1. All features for Frontend Web UI
2. Register admin user account
3. CRUD of products inventory (api/ProductInventory) for admin user only

## User accounts
1. Standard User (able to search products and add item to cart)
username: user
password: P@ssw0rd

2. Admin User (able to perform Standard User functions and invoke some other APIs)
username: admin
password: P@ssw0rd