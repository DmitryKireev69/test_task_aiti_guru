-- 2.1. Получение информации о сумме товаров заказанных под каждого клиента (Наименование клиента, сумма)

SELECT
    c.name AS "Наименование клиента",
    COALESCE(SUM(op_sum.total_sum), 0) AS "Сумма заказов"
FROM customers c
LEFT JOIN (
    SELECT
        o.customer_id,
        SUM(p.price) AS total_sum
    FROM orders o
    JOIN orders_products op ON o.id = op.order_id
    JOIN products p ON op.product_id = p.id
    WHERE o.status IN ('COMPLETED', 'PENDING')
    GROUP BY o.customer_id
) op_sum ON c.id = op_sum.customer_id
GROUP BY c.id, c.name
ORDER BY "Сумма заказов" DESC;
