# ShopEase: Online Shopping Database

A database design project for an online shopping platform, built for the **Introduction to Database** course at Umm Al-Qura University.

## Overview

ShopEase lets customers register, browse a product catalog, add items to a personal cart, and place orders that include one or more products. Each order is delivered through a shipment that links the customer, the order, and the products being delivered.

## What the project covers

- **Scenario**: a written description of how the platform works
- **ER diagram**: entities, relationships, keys, and attributes
- **Relational schema**: the ER diagram mapped to relational tables
- **SQL implementation**: tables with primary and foreign keys, sample data, and queries, written in MySQL

## Database design

The schema has 9 tables:

| Table | Purpose |
|-------|---------|
| User | Customer account information |
| User number | Phone numbers of each user |
| Cart | A user's shopping cart |
| Product | Products in the catalog |
| Order | Orders placed by users |
| Order_Item | Individual items inside an order |
| Contain | Links orders to their items |
| Includes | Links items to products |
| Shipment | Delivery of an order to a user |

## Files

- `ShopEase_Database_Project.pdf`: project presentation with the scenario, ER diagram, schema, and SQL screenshots

## Tools

- MySQL
- ER diagram and schema design

## Team

- Lamar Alshaikhi
- Lamar Alkhairy
- Mays Alshaikhi
- Manar Alzubaidi
