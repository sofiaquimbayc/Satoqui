SELECT
    map_code,
    AVG(
        EXTRACT(HOUR FROM (endtime - starttime)) * 3600 +
        EXTRACT(MINUTE FROM (endtime - starttime)) * 60 +
        EXTRACT(SECOND FROM (endtime - starttime))
    ) AS avg_duration_seconds
FROM Game
GROUP BY map_code;