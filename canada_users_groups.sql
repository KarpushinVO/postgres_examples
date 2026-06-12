SELECT  id,
        views,
        CASE
            WHEN views >= 350 THEN 1
            WHEN views < 350 AND views >= 100 THEN 2
            WHEN views < 100 THEN 3
        END
FROM stackoverflow.users
WHERE views > 0 AND location LIKE '%Canada%';
