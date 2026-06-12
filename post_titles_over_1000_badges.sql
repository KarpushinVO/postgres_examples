WITH big_users AS  (SELECT   user_id,
                            COUNT(id) AS badges_amount     
                    FROM    stackoverflow.badges
                    GROUP BY user_id
                    HAVING COUNT(id) > 1000
                    )
SELECT  title
FROM    stackoverflow.posts AS p
JOIN    big_users ON p.user_id = big_users.user_id
WHERE   p.title IS NOT NULL
