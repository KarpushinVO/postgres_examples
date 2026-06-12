--Ежедневный прирост новых пользователей в ноябре 2008 года.
WITH users_per_day AS   (
                        SELECT  EXTRACT(DAY FROM creation_date::date) AS day_num,
                                COUNT(id) OVER (PARTITION BY EXTRACT(DAY FROM creation_date::date)) as u_amount
                        FROM    stackoverflow.users
                        WHERE   EXTRACT(YEAR FROM creation_date) = 2008 AND
                                EXTRACT(MONTH FROM creation_date) = 11
                        ORDER BY day_num, u_amount
                        ),
sorted_users_per_day AS(       
                        SELECT  *
                        FROM users_per_day
                        GROUP BY day_num, u_amount
                        )
SELECT  *,
        SUM(u_amount) OVER(ORDER BY day_num)::numeric AS plus_users
FROM sorted_users_per_day
