SELECT  title,
        user_id,
        score,
        ROUND(SUM(score) OVER(PARTITION BY user_id)::numeric / COUNT(id) OVER(PARTITION BY user_id::numeric), 0) AS post_mean
FROM    stackoverflow.posts
WHERE   title IS NOT NULL AND score != 0
ORDER BY user_id 
