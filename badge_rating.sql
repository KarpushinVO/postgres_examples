WITH rating AS (
                    SELECT  DISTINCT user_id AS user,
                            COUNT(id) AS badge_amount
                    FROM    stackoverflow.badges
                    WHERE creation_date::date BETWEEN '2008.11.15' AND '2008.12.15'
                    GROUP BY user_id
                    ORDER BY badge_amount DESC, user_id
                )

SELECT  *,
        DENSE_RANK() OVER(ORDER BY rating.badge_amount DESC)
FROM    rating
LIMIT 10
