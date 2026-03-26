-- Вставляем базовые данные
INSERT INTO fact_sales (source_id, quantity, total_price)
SELECT id, sale_quantity, sale_total_price
FROM mock_data_raw;

-- Обновляем внешние ключи
UPDATE fact_sales f SET customer_id = c.customer_id FROM dim_customer c WHERE f.source_id = c.source_id;
UPDATE fact_sales f SET seller_id = s.seller_id FROM dim_seller s WHERE f.source_id = s.source_id;
UPDATE fact_sales f SET product_id = p.product_id FROM dim_product p WHERE f.source_id = p.source_id;
UPDATE fact_sales f SET store_id = st.store_id FROM dim_store st WHERE f.source_id = st.source_id;
UPDATE fact_sales f SET supplier_id = su.supplier_id FROM dim_supplier su WHERE f.source_id = su.source_id;
UPDATE fact_sales f SET date_id = d.date_id FROM mock_data_raw r JOIN dim_date d ON r.sale_date = d.full_date WHERE f.source_id = r.id;