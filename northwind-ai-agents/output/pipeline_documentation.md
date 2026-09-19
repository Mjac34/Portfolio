# Pipeline documentation

Run id: `79b7198a1f30`

Agents run in sequence: DataLoaderAgent -> DataModelingAgent -> ModelAgent -> CRMCustomerProfileAgent -> AnalysisAgent -> InsightAgent -> FlowAnalysisAgent -> LLMInsightAgent -> NarrativeCheckAgent -> BIExportAgent -> DocumentationAgent

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
    "net_price_first_half": 22.7,
    "net_price_second_half": 25.95,
    "volume_effect": 244536.25,
    "price_mix_effect": 100732.51,
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
Revenue surged 75 % in the second half of the period, rising from **$460,262** to **$805,531** (+$345,269). The uplift was driven primarily by the **High‑Value customer segment** (69 % of the change) and strong performance in the **USA** and **Germany** markets, while both volume and price mix contributed positively.

### Key Insights  
- **Customer segment impact:** High‑Value customers generated a $238,227 increase (≈ 69 % of total growth); Low‑ and Medium‑Value segments added $55,742 and $51,300 respectively.  
- **Geographic drivers:** USA contributed $98,410 (28.5 % of change) and Germany $60,703 (17.6 %). Brazil, Austria, and Sweden together added another ~ 27 % of the lift.  
- **Category performance:** Dairy Products (+$69,693, 20.2 % of change) and Seafood (+$57,644, 16.7 %) were the top‑growing categories, followed closely by Beverages and Meat/Poultry.  
- **Product mix:** Thüringer Rostbratwurst (+$36,192, 10.5 % of change) and Raclette Courdavault (+$24,786, 7.2 %) were the biggest product contributors to the revenue jump.  
- **Volume vs. price:** Quantity rose from 20,273 to 31,044 units; average net price increased from $22.70 to $25.95. The volume effect ($244,536) outweighed the price‑mix effect ($100,733).  
- **Customer concentration:** The top‑5 customers’ share grew from **31.1 %** to **34.8 %**, indicating rising reliance on a small group.  
- **Churn risk:** While 73 customers are low‑risk, 16 are Medium, High, or Critical, representing a potential revenue threat.

### Recommended Actions  
1. **Deepen engagement with High‑Value customers** in the USA, Germany, Brazil, and Austria through tailored promotions and loyalty programs to sustain the momentum.  
2. **Mitigate concentration risk** by cross‑selling high‑growth products (e.g., Thüringer Rostbratwurst, Raclette Courdavault) to mid‑tier and at‑risk accounts, and by developing new accounts in under‑penetrated regions.  
3. **Continue price optimization** while keeping discounts stable (≈ 5.6 % both halves); monitor price‑mix effects and explore modest price adjustments for top‑performing categories.

## Narrative check

29/31 numbers matched; unmatched: 27 %, 16