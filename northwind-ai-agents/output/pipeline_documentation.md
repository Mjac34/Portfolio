# Pipeline documentation

Agents run in sequence: DataLoaderAgent -> DataModelingAgent -> ModelAgent -> AnalysisAgent -> InsightAgent -> BIExportAgent -> DocumentationAgent

## Semantic model

{
  "business_name": "Northwind sales semantic model",
  "model_type": "star_schema",
  "fact_table": "order_details",
  "granularity": "order_line",
  "dimensions": [
    {
      "name": "dim_orders",
      "key": "orderID",
      "source_table": "orders"
    },
    {
      "name": "dim_products",
      "key": "productID",
      "source_table": "products"
    },
    {
      "name": "dim_customers",
      "key": "customerID",
      "source_table": "customers"
    },
    {
      "name": "dim_employees",
      "key": "employeeID",
      "source_table": "employees"
    },
    {
      "name": "dim_categories",
      "key": "categoryID",
      "source_table": "categories"
    },
    {
      "name": "dim_suppliers",
      "key": "supplierID",
      "source_table": "suppliers"
    },
    {
      "name": "dim_shippers",
      "key": "shipVia",
      "source_table": "shippers"
    }
  ],
  "measures": [
    {
      "name": "sales_amount",
      "type": "decimal",
      "definition": "unitPrice * quantity * (1 - discount)"
    },
    {
      "name": "order_quantity",
      "type": "integer",
      "definition": "SUM(quantity)"
    },
    {
      "name": "distinct_orders",
      "type": "integer",
      "definition": "DISTINCTCOUNT(orderID)"
    },
    {
      "name": "avg_line_value",
      "type": "decimal",
      "definition": "sales_amount / order_quantity"
    }
  ],
  "segmentations": [
    {
      "name": "customer_value_segment",
      "entity": "customer",
      "logic": "Based on total revenue per customer: High Value >= 75th percentile, Medium Value >= 50th percentile, Low Value else",
      "labels": [
        "High Value",
        "Medium Value",
        "Low Value"
      ]
    }
  ],
  "relationships": [
    {
      "fact_table": "order_details",
      "fact_key": "orderID",
      "dimension_table": "orders",
      "dimension_key": "orderID",
      "relationship_type": "one_to_many"
    },
    {
      "fact_table": "order_details",
      "fact_key": "productID",
      "dimension_table": "products",
      "dimension_key": "productID",
      "relationship_type": "one_to_many"
    }
  ]
}

## Summary

{
  "count": 2155,
  "min": 4.8,
  "max": 15810.0,
  "mean": 587.374960324826,
  "median": 337.75
}

## Insights

{
  "top_n": [
    {
      "orderID": "10981",
      "productID": "38",
      "unitPrice": "263.50",
      "quantity": "60",
      "discount": "0",
      "orderDate": "1998-03-27 00:00:00.000",
      "customerID": "HANAR",
      "customerName": "Hanari Carnes",
      "shipCountry": "Brazil",
      "shipCity": "Rio de Janeiro",
      "employeeID": "1",
      "employeeName": "Nancy Davolio",
      "productName": "C\u00f4te de Blaye",
      "categoryID": "1",
      "categoryName": "Beverages",
      "supplierID": "18",
      "supplierName": "Aux joyeux eccl\u00e9siastiques",
      "shipperName": "United Package",
      "sales_amount": 15810.0,
      "_score": 15810.0,
      "customer_segment": "High Value"
    },
    {
      "orderID": "10865",
      "productID": "38",
      "unitPrice": "263.50",
      "quantity": "60",
      "discount": "0.05",
      "orderDate": "1998-02-02 00:00:00.000",
      "customerID": "QUICK",
      "customerName": "QUICK-Stop",
      "shipCountry": "Germany",
      "shipCity": "Cunewalde",
      "employeeID": "2",
      "employeeName": "Andrew Fuller",
      "productName": "C\u00f4te de Blaye",
      "categoryID": "1",
      "categoryName": "Beverages",
      "supplierID": "18",
      "supplierName": "Aux joyeux eccl\u00e9siastiques",
      "shipperName": "Speedy Express",
      "sales_amount": 15019.5,
      "_score": 15019.5,
      "customer_segment": "High Value"
    },
    {
      "orderID": "10417",
      "productID": "38",
      "unitPrice": "210.80",
      "quantity": "50",
      "discount": "0",
      "orderDate": "1997-01-16 00:00:00.000",
      "customerID": "SIMOB",
      "customerName": "Simons bistro",
      "shipCountry": "Denmark",
      "shipCity": "Kobenhavn",
      "employeeID": "4",
      "employeeName": "Margaret Peacock",
      "productName": "C\u00f4te de Blaye",
      "categoryID": "1",
      "categoryName": "Beverages",
      "supplierID": "18",
      "supplierName": "Aux joyeux eccl\u00e9siastiques",
      "shipperName": "Federal Shipping",
      "sales_amount": 10540.0,
      "_score": 10540.0,
      "customer_segment": "High Value"
    },
    {
      "orderID": "10889",
      "productID": "38",
      "unitPrice": "263.50",
      "quantity": "40",
      "discount": "0",
      "orderDate": "1998-02-16 00:00:00.000",
      "customerID": "RATTC",
      "customerName": "Rattlesnake Canyon Grocery",
      "shipCountry": "USA",
      "shipCity": "Albuquerque",
      "employeeID": "9",
      "employeeName": "Anne Dodsworth",
      "productName": "C\u00f4te de Blaye",
      "categoryID": "1",
      "categoryName": "Beverages",
      "supplierID": "18",
      "supplierName": "Aux joyeux eccl\u00e9siastiques",
      "shipperName": "Federal Shipping",
      "sales_amount": 10540.0,
      "_score": 10540.0,
      "customer_segment": "High Value"
    },
    {
      "orderID": "10897",
      "productID": "29",
      "unitPrice": "123.79",
      "quantity": "80",
      "discount": "0",
      "orderDate": "1998-02-19 00:00:00.000",
      "customerID": "HUNGO",
      "customerName": "Hungry Owl All-Night Grocers",
      "shipCountry": "Ireland",
      "shipCity": "Cork",
      "employeeID": "3",
      "employeeName": "Janet Leverling",
      "productName": "Th\u00fcringer Rostbratwurst",
      "categoryID": "6",
      "categoryName": "Meat/Poultry",
      "supplierID": "12",
      "supplierName": "Plutzer Lebensmittelgro\u00dfm\u00e4rkte AG",
      "shipperName": "United Package",
      "sales_amount": 9903.2,
      "_score": 9903.2,
      "customer_segment": "High Value"
    }
  ],
  "message": "Top 5 items by _score",
  "top_products": [
    {
      "product": "C\u00f4te de Blaye",
      "sales_amount": 141396.73
    },
    {
      "product": "Th\u00fcringer Rostbratwurst",
      "sales_amount": 80368.67
    },
    {
      "product": "Raclette Courdavault",
      "sales_amount": 71155.7
    },
    {
      "product": "Tarte au sucre",
      "sales_amount": 47234.97
    },
    {
      "product": "Camembert Pierrot",
      "sales_amount": 46825.48
    }
  ],
  "top_customers": [
    {
      "customer": "QUICK",
      "sales_amount": 110277.31
    },
    {
      "customer": "ERNSH",
      "sales_amount": 104874.98
    },
    {
      "customer": "SAVEA",
      "sales_amount": 104361.95
    },
    {
      "customer": "RATTC",
      "sales_amount": 51097.8
    },
    {
      "customer": "HUNGO",
      "sales_amount": 49979.91
    }
  ],
  "top_countries": [
    {
      "country": "USA",
      "sales_amount": 245584.61
    },
    {
      "country": "Germany",
      "sales_amount": 230284.63
    },
    {
      "country": "Austria",
      "sales_amount": 128003.84
    },
    {
      "country": "Brazil",
      "sales_amount": 106925.78
    },
    {
      "country": "France",
      "sales_amount": 81358.32
    }
  ]
}

## AI narrative

## Executive Summary  
The Northwind pipeline processed **2,155** transactions with an average score of **587.37** (median = 337.75). Sales are heavily concentrated among a few products, customers, and regions—​the top 5 products alone generated **≈ $382k**, and the top 5 customers accounted for **≈ $521k** of revenue. While most customers are low‑risk for churn (73 of 89), a small but critical segment (5 customers) requires immediate attention.

### Key Insights  
- **Product concentration:** The leading product, *Côte de Blaye*, contributed **$141,396.73**, representing over **37%** of the top‑5 product sales.  
- **Customer concentration:** The top three customers (*QUICK, ERNSH, SAVEA*) together generated **$319,514.24**, roughly **61%** of the top‑5 customer revenue.  
- **Geographic focus:** The United States and Germany dominate sales, delivering **$245,584.61** and **$230,284.63** respectively—together accounting for **≈ 78%** of the top‑5 country sales.  
- **RFM segmentation:** Only **27** customers are classified as “Champions” or “Loyal,” while **21** are already “Lost,” indicating a sizable at‑risk base.  
- **Churn risk:** Although **73** customers are low‑risk, **5** are flagged as **Critical**, representing **≈ 5.6%** of the total customer base.

### Recommended Actions  
1. **Deep‑dive on high‑value accounts:** Conduct account reviews for the top 5 customers and the 5 critical‑risk customers to identify upsell opportunities and retention tactics.  
2. **Diversify product mix:** Develop promotions for mid‑tier products to reduce reliance on the top 3 sellers and broaden revenue sources.  
3. **Targeted regional campaigns:** Allocate additional marketing spend to the USA and Germany while launching growth pilots in under‑penetrated markets such as Brazil and Austria.