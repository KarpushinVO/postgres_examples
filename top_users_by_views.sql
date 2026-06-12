--Лидеры каждой группы — пользователи, которые набрали максимальное число просмотров в своей группе. 
--Нужны поля с идентификатором пользователя, группой и количеством просмотров. 
WITH v_max_groups AS (
WITH v_groups AS (
        SELECT  id,
                views,
                CASE 
                    WHEN views >= 350 THEN 1
                    WHEN views < 350 AND views >= 100 THEN 2
                    WHEN views < 100 THEN 3
                END AS G_VIEW
        FROM stackoverflow.users
        WHERE views > 0 AND location LIKE '%Canada%'
        ORDER BY views DESC)

SELECT  DISTINCT id,
        g_view,
        views,
        MAX(views) OVER(partition by g_view) AS max_view
FROM v_groups)

SELECT  id,
        g_view,
        views
FROM v_max_groups
WHERE views = max_view
ORDER BY views DESC, id
