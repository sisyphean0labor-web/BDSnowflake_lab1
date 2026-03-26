-- Заполнение dim_customer
INSERT INTO dim_customer (source_id, first_name, last_name, age, email, country, postal_code, pet_type, pet_name, pet_breed)
SELECT id, customer_first_name, customer_last_name, customer_age, customer_email, 
       customer_country, customer_postal_code, customer_pet_type, customer_pet_name, customer_pet_breed
FROM mock_data_raw
ON CONFLICT (source_id) DO NOTHING;

-- Заполнение dim_seller
INSERT INTO dim_seller (source_id, first_name, last_name, email, country, postal_code)
SELECT id, seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code
FROM mock_data_raw
ON CONFLICT (source_id) DO NOTHING;

-- Заполнение dim_product
INSERT INTO dim_product (source_id, name, category, price, weight, color, size, brand, material, rating, reviews, release_date, expiry_date, pet_category, description)
SELECT id, product_name, product_category, product_price, product_weight, product_color, 
       product_size, product_brand, product_material, product_rating, product_reviews, 
       product_release_date, product_expiry_date, pet_category, product_description
FROM mock_data_raw
ON CONFLICT (source_id) DO NOTHING;

-- Заполнение dim_store
INSERT INTO dim_store (source_id, name, location, city, state, country, phone, email)
SELECT id, store_name, store_location, store_city, store_state, store_country, store_phone, store_email
FROM mock_data_raw
ON CONFLICT (source_id) DO NOTHING;

-- Заполнение dim_supplier
INSERT INTO dim_supplier (source_id, name, contact, email, phone, address, city, country)
SELECT id, supplier_name, supplier_contact, supplier_email, supplier_phone, 
       supplier_address, supplier_city, supplier_country
FROM mock_data_raw
ON CONFLICT (source_id) DO NOTHING;