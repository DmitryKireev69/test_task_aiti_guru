INSERT INTO categories (id, name, parent_id, create_at) VALUES
(1, 'Электроника', null, timezone('utc', now())),
(2, 'Одежда и обувь', NULL, timezone('utc', now())),
(3, 'Книги', NULL, timezone('utc', now())),
(4, 'Спорт и отдых', NULL, timezone('utc', now())),
(5, 'Смартфоны и гаджеты', 1, timezone('utc', now())),
(6, 'Ноутбуки и компьютеры', 1, timezone('utc', now())),
(7, 'Бытовая техника', 1, timezone('utc', now())),
(8, 'Мужская одежда', 2, timezone('utc', now())),
(9, 'Женская одежда', 2, timezone('utc', now())),
(10, 'Детская одежда', 2, timezone('utc', now())),
(11, 'Художественная литература', 3, timezone('utc', now())),
(12, 'Научная литература', 3, timezone('utc', now())),
(13, 'Учебники', 3, timezone('utc', now())),
(14, 'Фитнес', 4, timezone('utc', now())),
(15, 'Туризм', 4, timezone('utc', now())),
(16, 'Велоспорт', 4, timezone('utc', now())),
(17, 'Смартфоны', 5, timezone('utc', now())),
(18, 'Планшеты', 5, timezone('utc', now())),
(19, 'Умные часы', 5, timezone('utc', now())),
(20, 'Игровые ноутбуки', 6, timezone('utc', now())),
(21, 'Офисные ноутбуки', 6, timezone('utc', now())),
(22, 'Компьютерные комплектующие', 6, timezone('utc', now())),
(23, 'Холодильники', 7, timezone('utc', now())),
(24, 'Стиральные машины', 7, timezone('utc', now())),
(25, 'Плиты и духовки', 7, timezone('utc', now()));

INSERT INTO customers (id, name, address, create_at) VALUES
(1, 'Иван Иванов', 'Москва, ул. Ленина, д. 1, кв. 10', timezone('utc', now())),
(2, 'ООО "Рога и копыта"', 'Санкт-Петербург, Невский пр., д. 25, офис 301', timezone('utc', now())),
(3, 'Мария Петрова', 'Екатеринбург, ул. Мира, д. 15, кв. 42', timezone('utc', now())),
(4, 'ИП Сидоров А.В.', 'Новосибирск, пр. Карла Маркса, д. 30, офис 5', timezone('utc', now())),
(5, 'Анна Смирнова', 'Казань, ул. Баумана, д. 20, кв. 7', timezone('utc', now())),
(6, 'ЗАО "ТехноПрофи"', 'Нижний Новгород, ул. Рождественская, д. 8', timezone('utc', now())),
(7, 'Дмитрий Кузнецов', 'Ростов-на-Дону, ул. Большая Садовая, д. 12, кв. 33', timezone('utc', now())),
(8, 'ООО "СтройГрад"', 'Волгоград, ул. Советская, д. 45, офис 210', timezone('utc', now()));


INSERT INTO products (id, name, title, count, price, category_id, create_at) VALUES
(1, 'iPhone 15 Pro', 'Смартфон Apple с процессором A17 Pro, 128GB', 25, 99990.00, 18, timezone('utc', now())),
(2, 'Samsung Galaxy S23', 'Смартфон Android с камерой 50MP, 256GB', 40, 79990.00, 18, timezone('utc', now())),
(3, 'MacBook Pro 14"', 'Ноутбук Apple с процессором M3, 512GB SSD', 10, 199990.00, 22, timezone('utc', now())),
(4, 'ASUS ROG Strix', 'Игровой ноутбук с RTX 4060, 16GB RAM', 8, 149990.00, 22, timezone('utc', now())),
(5, 'iPad Air', 'Планшет Apple с дисплеем 10.9", 64GB', 15, 64990.00, 19, timezone('utc', now())),
(6, 'Холодильник Samsung', 'Двухкамерный холодильник No Frost, 400л', 5, 69990.00, 8, timezone('utc', now())),
(7, 'Джинсы Levis 501', 'Классические мужские джинсы, синие', 50, 7990.00, 10, timezone('utc', now())),
(8, 'Куртка зимняя', 'Теплая зимняя куртка с мехом, черная', 30, 12990.00, 10, timezone('utc', now())),
(9, 'Платье вечернее', 'Вечернее платье для особых случаев, красное', 25, 15990.00, 11, timezone('utc', now())),
(10, 'Книга "Война и мир"', 'Роман Л.Н. Толстого в 4 томах', 20, 2990.00, 14, timezone('utc', now())),
(11, 'Учебник Python', 'Программирование на Python для начинающих', 35, 1890.00, 16, timezone('utc', now())),
(12, 'Наушники Sony', 'Беспроводные наушники с шумоподавлением', 45, 12990.00, 21, timezone('utc', now())),
(13, 'Микроволновка LG', 'Микроволновая печь с грилем, 25л', 30, 8990.00, 8, timezone('utc', now())),
(14, 'Футболка мужская', 'Хлопковая футболка, белая, размер M', 100, 1990.00, 10, timezone('utc', now())),
(15, 'Юбка офисная', 'Классическая юбка-карандаш, черная', 40, 3990.00, 11, timezone('utc', now()));


INSERT INTO orders (id, status, customer_id, create_at) VALUES
(1, 'COMPLETED', 1, timezone('utc', now() - interval '10 days')),
(2, 'COMPLETED', 2, timezone('utc', now() - interval '8 days')),
(3, 'PENDING', 3, timezone('utc', now() - interval '5 days')),
(4, 'COMPLETED', 4, timezone('utc', now() - interval '3 days')),
(5, 'PENDING', 5, timezone('utc', now() - interval '2 days')),
(6, 'CANCELLED', 6, timezone('utc', now() - interval '1 day')),
(7, 'COMPLETED', 7, timezone('utc', now() - interval '12 hours')),
(8, 'PENDING', 8, timezone('utc', now() - interval '6 hours')),
(9, 'COMPLETED', 1, timezone('utc', now() - interval '4 hours')),
(10, 'PENDING', 2, timezone('utc', now() - interval '2 hours'));


INSERT INTO orders_products (order_id, product_id, create_at) VALUES
-- Заказ 1
(1, 1, timezone('utc', now() - interval '10 days')),
(1, 5, timezone('utc', now() - interval '10 days')),
(1, 12, timezone('utc', now() - interval '10 days')),

-- Заказ 2
(2, 3, timezone('utc', now() - interval '8 days')),
(2, 6, timezone('utc', now() - interval '8 days')),
(2, 10, timezone('utc', now() - interval '8 days')),

-- Заказ 3
(3, 2, timezone('utc', now() - interval '5 days')),
(3, 7, timezone('utc', now() - interval '5 days')),
(3, 14, timezone('utc', now() - interval '5 days')),

-- Заказ 4
(4, 4, timezone('utc', now() - interval '3 days')),
(4, 8, timezone('utc', now() - interval '3 days')),
(4, 11, timezone('utc', now() - interval '3 days')),

-- Заказ 5
(5, 9, timezone('utc', now() - interval '2 days')),
(5, 13, timezone('utc', now() - interval '2 days')),
(5, 15, timezone('utc', now() - interval '2 days')),

-- Заказ 6 (отмененный)
(6, 1, timezone('utc', now() - interval '1 day')),
(6, 3, timezone('utc', now() - interval '1 day')),

-- Заказ 7
(7, 5, timezone('utc', now() - interval '12 hours')),
(7, 10, timezone('utc', now() - interval '12 hours')),

-- Заказ 8
(8, 7, timezone('utc', now() - interval '6 hours')),
(8, 12, timezone('utc', now() - interval '6 hours')),
(8, 14, timezone('utc', now() - interval '6 hours')),

-- Заказ 9
(9, 2, timezone('utc', now() - interval '4 hours')),
(9, 6, timezone('utc', now() - interval '4 hours')),

-- Заказ 10
(10, 4, timezone('utc', now() - interval '2 hours')),
(10, 9, timezone('utc', now() - interval '2 hours')),
(10, 13, timezone('utc', now() - interval '2 hours'));
