# Pipeline documentation

Run id: `ca3b150bae48`

Agents run in sequence: DataLoaderAgent -> DataModelingAgent -> ModelAgent -> CRMCustomerProfileAgent -> AnalysisAgent -> InsightAgent -> FlowAnalysisAgent -> LLMInsightAgent -> BIExportAgent -> DocumentationAgent

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

## Flow analysis

{
  "available": true,
  "period": {
    "start": "1996-07-04",
    "midpoint": "1997-06-04",
    "end": "1998-05-06"
  },
  "first_half_revenue": 460262.14,
  "second_half_revenue": 805530.9,
  "revenue_change": 345268.76,
  "growth_pct": 75.0,
  "drivers": {
    "country": [
      {
        "name": "USA",
        "first_half_revenue": 73587.23,
        "second_half_revenue": 171997.39,
        "delta": 98410.16,
        "share_of_change": 0.285
      },
      {
        "name": "Germany",
        "first_half_revenue": 84790.69,
        "second_half_revenue": 145493.94,
        "delta": 60703.24,
        "share_of_change": 0.176
      },
      {
        "name": "Brazil",
        "first_half_revenue": 33192.46,
        "second_half_revenue": 73733.32,
        "delta": 40540.86,
        "share_of_change": 0.117
      },
      {
        "name": "Austria",
        "first_half_revenue": 49754.71,
        "second_half_revenue": 78249.13,
        "delta": 28494.42,
        "share_of_change": 0.083
      },
      {
        "name": "Sweden",
        "first_half_revenue": 14051.89,
        "second_half_revenue": 40443.24,
        "delta": 26391.35,
        "share_of_change": 0.076
      }
    ],
    "category": [
      {
        "name": "Dairy Products",
        "first_half_revenue": 82406.97,
        "second_half_revenue": 152100.32,
        "delta": 69693.36,
        "share_of_change": 0.202
      },
      {
        "name": "Seafood",
        "first_half_revenue": 36808.93,
        "second_half_revenue": 94452.81,
        "delta": 57643.89,
        "share_of_change": 0.167
      },
      {
        "name": "Beverages",
        "first_half_revenue": 106022.28,
        "second_half_revenue": 161845.9,
        "delta": 55823.62,
        "share_of_change": 0.162
      },
      {
        "name": "Meat/Poultry",
        "first_half_revenue": 56815.36,
        "second_half_revenue": 106207.0,
        "delta": 49391.64,
        "share_of_change": 0.143
      },
      {
        "name": "Produce",
        "first_half_revenue": 34406.56,
        "second_half_revenue": 65578.02,
        "delta": 31171.46,
        "share_of_change": 0.09
      }
    ],
    "customer_segment": [
      {
        "name": "High Value",
        "first_half_revenue": 307217.26,
        "second_half_revenue": 545444.5,
        "delta": 238227.25,
        "share_of_change": 0.69
      },
      {
        "name": "Low Value",
        "first_half_revenue": 45331.34,
        "second_half_revenue": 101073.04,
        "delta": 55741.7,
        "share_of_change": 0.161
      },
      {
        "name": "Medium Value",
        "first_half_revenue": 107713.54,
        "second_half_revenue": 159013.36,
        "delta": 51299.81,
        "share_of_change": 0.149
      }
    ],
    "product": [
      {
        "name": "Th\u00fcringer Rostbratwurst",
        "first_half_revenue": 22088.34,
        "second_half_revenue": 58280.33,
        "delta": 36191.99,
        "share_of_change": 0.105
      },
      {
        "name": "Raclette Courdavault",
        "first_half_revenue": 23184.7,
        "second_half_revenue": 47971.0,
        "delta": 24786.3,
        "share_of_change": 0.072
      },
      {
        "name": "Manjimup Dried Apples",
        "first_half_revenue": 12497.4,
        "second_half_revenue": 29322.25,
        "delta": 16824.85,
        "share_of_change": 0.049
      },
      {
        "name": "C\u00f4te de Blaye",
        "first_half_revenue": 62807.86,
        "second_half_revenue": 78588.88,
        "delta": 15781.01,
        "share_of_change": 0.046
      },
      {
        "name": "Uncle Bob's Organic Dried Pears",
        "first_half_revenue": 3211.8,
        "second_half_revenue": 18832.5,
        "delta": 15620.7,
        "share_of_change": 0.045
      }
    ]
  },
  "volume_vs_value": {
    "quantity_first_half": 20273.0,
    "quantity_second_half": 31044.0,
    "avg_discount_first_half": 0.056,
    "avg_discount_second_half": 0.057
  },
  "customer_concentration": {
    "top5_share_first_half": 0.311,
    "top5_share_second_half": 0.348
  }
}

## AI narrative

## Executive Summary  
The sales pipeline delivered a **75 % revenue surge**, rising from **$460,262** in the first half to **$805,531** in the second half (+$345,269). Growth was powered primarily by the **High‑Value customer segment** (69 % of the change) and strong performance in the **USA, Germany and Brazil** markets, while overall order volume increased by **53 %** with discounts remaining flat.

### Key Insights  
- **Revenue drivers:**  
  - High‑Value customers added **$238,227** (69 % of total change).  
  - Country gains: USA (+$98,410, 28.5 % of change), Germany (+$60,703, 17.6 %), Brazil (+$40,541, 11.7 %).  
  - Category gains: Dairy Products (+$69,693, 20.2 %), Seafood (+$57,644, 16.7 %), Beverages (+$55,824, 16.2 %).  
- **Top performers:**  
  - Product: *Côte de Blaye* led with **$141,397** sales; *Thüringer Rostbratwurst* grew fastest (+$36,192, 10.5 % of change).  
  - Customer: *QUICK* contributed **$110,277**; the top 5 customers’ share rose from **31.1 %** to **34.8 %** of total revenue.  
  - Country: USA topped with **$245,585** sales, followed by Germany (**$230,285**) and Austria (**$128,004**).  
- **Volume vs. value:** Units sold jumped from **20,273** to **31,044** (≈ 53 % increase) while average discount stayed essentially unchanged (5.6 % → 5.7 %).  
- **Customer health:** 73 customers are low‑risk, but there are **5 critical** and **4 high‑risk** accounts that could erode future growth.  
- **RFM segmentation:** 20 % of customers are “Champions” and 7 % “Loyal,” yet 21 % are classified as “Lost,” indicating upside for re‑engagement.

### Recommended Actions  
1. **Deepen engagement with High‑Value customers** and replicate successful tactics (product mix, pricing) in the Low‑ and Medium‑Value segments to lift their contribution.  
2. **Prioritize growth in the USA, Germany, and Brazil** by allocating additional sales resources and localized promotions, especially for top‑performing categories (Dairy, Seafood, Beverages).  
3. **Activate churn mitigation** for the 5 critical and 4 high‑risk accounts—run targeted retention campaigns and monitor their purchase patterns closely.  

*These steps aim to sustain the strong momentum while reducing concentration risk and protecting the pipeline from churn.*