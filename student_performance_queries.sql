1. Rank all students by their overall average score. Shows the top-performing students across all subjects.

SELECT 
    *,
    ROUND((`Math_Score` + `Reading_Score` + `Writing_Score`) / 3.0, 2) AS avg_score,
    DENSE_RANK() OVER (ORDER BY 
        (`Math_Score` + `Reading_Score` + `Writing_Score`) / 3.0 DESC
    ) AS overall_rank
FROM 
    students_performance;



2. Compare each students math score with their group’s average (by gender). Shows over- or under-performance within gender.

SELECT 
    `Gender`,
    `Math_Score`,
    AVG(`Math_Score`) OVER (PARTITION BY `Gender`) AS avg_math_by_gender,
    `Math_Score` - AVG(`Math_Score`) OVER (PARTITION BY `Gender`) AS diff_from_gender_avg
FROM 
    students_performance;



3. Top-scoring student in each parental education group.

SELECT *
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY `Parental_Education`
            ORDER BY (`Math_Score` + `Reading_Score` + `Writing_Score`) DESC
        ) AS rank_within_group
    FROM students_performance
) AS ranked
WHERE rank_within_group = 1;



4. Most improved subject per student (relative to their lowest score). Shows who shows the biggest variation between subjects (strengths or weaknesses).
SELECT *,
    GREATEST("Math_Score", "Reading_Score", "Writing_Score") 
      - LEAST("Math_Score", "Reading_Score", "Writing_Score") AS subject_score_range
FROM students_performance
ORDER BY subject_score_range DESC
LIMIT 10;


5. Gender-wise performance gap in each subject. Quantifies performance gaps between genders across subjects.

SELECT 
    subject,
    MAX(CASE WHEN `Gender` = 'male' THEN avg_score ELSE NULL END) AS male_avg,
    MAX(CASE WHEN `Gender` = 'female' THEN avg_score ELSE NULL END) AS female_avg,
    MAX(CASE WHEN `Gender` = 'male' THEN avg_score ELSE NULL END) - 
    MAX(CASE WHEN `Gender` = 'female' THEN avg_score ELSE NULL END) AS gap
FROM (
    SELECT 'math score' AS subject, `Gender`, AVG(`Math_Score`) AS avg_score 
    FROM students_performance GROUP BY `Gender`
    
    UNION ALL
    
    SELECT 'reading score' AS subject, `Gender`, AVG(`Reading_Score`) AS avg_score 
    FROM students_performance GROUP BY `Gender`
    
    UNION ALL
    
    SELECT 'writing score' AS subject, `Gender`, AVG(`Writing_Score`) AS avg_score 
    FROM students_performance GROUP BY `Gender`
) AS gender_subject_scores
GROUP BY subject;



6. Subject-wise percentile rank of students. Shows how students stack up in each subject individually.

SELECT 
    `Math_Score`,
    `Reading_Score`,
    `Writing_Score`,
    PERCENT_RANK() OVER (ORDER BY `Math_Score`) AS math_percentile,
    PERCENT_RANK() OVER (ORDER BY `Reading_Score`) AS reading_percentile,
    PERCENT_RANK() OVER (ORDER BY `Writing_Score`) AS writing_percentile
FROM students_performance;



7. Average score by test preparation and lunch status (cross-category comparison). Shows how lunch quality + test prep interact to impact performance.

SELECT 
    `Test_Preparation`,
    `Lunch`,
    COUNT(*) AS students,
    ROUND(AVG(`Math_Score`), 2) AS avg_math,
    ROUND(AVG(`Reading_Score`), 2) AS avg_reading,
    ROUND(AVG(`Writing_Score`), 2) AS avg_writing
FROM 
    students_performance
GROUP BY 
    `Test_Preparation`, `Lunch`
ORDER BY 
    `Test_Preparation`, `Lunch`;