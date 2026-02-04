-- 2.3.1. Написать текст запроса для отчета (view) «Топ-5 самых покупаемых
-- товаров за последний месяц» (по количеству штук в заказах).
-- В отчете должны быть: Наименование товара, Категория 1-го уровня, Общее количество проданных штук.

-- Создание VIEW для отчета
CREATE OR REPLACE VIEW top_5_products_last_month AS
SELECT
    p.name AS "Наименование товара",
    root_category.name AS "Категория 1-го уровня",
    SUM(1) AS "Общее количество проданных штук"
FROM orders o
JOIN orders_products op ON o.id = op.order_id
JOIN products p ON op.product_id = p.id
JOIN categories category ON p.category_id = category.id
-- Получаем корневую категорию (1-го уровня)
LEFT JOIN LATERAL (
    -- Рекурсивно поднимаемся до корневой категории
    WITH RECURSIVE category_hierarchy AS (
        SELECT id, name, parent_id
        FROM categories
        WHERE id = category.id

        UNION ALL

        SELECT c.id, c.name, c.parent_id
        FROM categories c
        INNER JOIN category_hierarchy ch ON c.id = ch.parent_id
    )
    SELECT name
    FROM category_hierarchy
    WHERE parent_id IS NULL
    LIMIT 1
) root_category ON true
WHERE o.status IN ('COMPLETED', 'PENDING')  -- Только активные заказы
    AND o.create_at >= timezone('utc', now()) - interval '1 month'
GROUP BY p.id, p.name, root_category.name
ORDER BY "Общее количество проданных штук" DESC
LIMIT 5;

-- Комментарий к VIEW
COMMENT ON VIEW top_5_products_last_month IS 'Топ-5 самых покупаемых товаров за последний месяц';