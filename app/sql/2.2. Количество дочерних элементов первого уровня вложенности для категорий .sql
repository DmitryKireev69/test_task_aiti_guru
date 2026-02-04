-- 2.2. Найти количество дочерних элементов первого уровня вложенности для категорий номенклатуры.

SELECT
    parent.id AS parent_id,
    parent.name AS parent_name,
    COUNT(child.id) AS child_count
FROM categories parent
LEFT JOIN categories child ON parent.id = child.parent_id
WHERE parent.parent_id IS NULL
GROUP BY parent.id, parent.name
ORDER BY child_count DESC;
