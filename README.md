# Project_002 – Students Performance Analysis 📊

## Project Overview

Let's assume we're part of an educational data team aiming to assess student performance, learning trends, and institutional effectiveness across subjects and demographics. Our goal is to derive insights that can guide curriculum changes, targeted support, and performance optimization.

---

## Objectives

- Clean and preprocess real-world student data
- Explore performance trends across different demographics
- Visualize the effects of test prep and education level
- Derive actionable insights for educators and policymakers

---

## Technologies Used

- *Python (Pandas, NumPy)*
- *SQL (SQLite / PostgreSQL / MySQL)*
- *Matplotlib & Seaborn*
- *Jupyter Notebook*
- *GitHub*

---

## Part 1: Data Preparation (Pandas)

- Removed missing values and duplicates
- Standardized column names
- Checked for outliers and invalid entries

📁 File: student_performance_cleaned.csv

---

## Part 2: EDA, Visualization and Insight Generation

Performed detailed EDA using Pandas and created insightful visualizations using Matplotlib and Seaborn:

- Gender-based score comparison
- Score trends by parental education level
- Impact of lunch type on academic scores
- Test preparation course effectiveness
- Correlation analysis between math, reading, and writing

📁 File: student_perfrormace.ipynb

---

## Part 3: SQL-Based Business Insights

Using SQL queries on the cleaned data, we answered:

1. Rank all students by their overall average score.
2. Compare each student's math score with their group’s average (by gender).
3. Top-scoring student in each parental education group.
4. Most improved subject per student (relative to their lowest score).
5. Gender-wise performance gap in each subject.
6. Subject-wise percentile rank of students.
7. Average score by test preparation and lunch status (cross-category comparison).

📁 File: studentd_performance_queries.sql

---



## Key Findings

- Females outperform males in Reading and Writing.
- Males slightly outperform females in Math.
- Students who completed the test preparation course score significantly higher across all subjects.
- Group E performs the best on average across all subjects.
- Group A performs the lowest, suggesting potential educational inequality.
- Students with parents holding Master’s or Bachelor’s degrees have higher average scores.
- Educational background of parents appears to have a strong positive influence.
- Students with standard lunch consistently score higher than those with free/reduced lunch, possibly indicating socio-economic influence.
- Math Scores (t=5.38, p<0.001)
- Males scored significantly higher in Math than females (strong statistical evidence).
- The large positive t-statistic (5.38) means the male average was much higher.

---

## Team Contributions

- *Data Cleaning & Preprocessing:* Deepak
- *SQL Queries & Business Insights:* Niharika
- *Visualization & EDA:* Pranay
- *Presentation, Github & Documentation:* Niharika , Pranay and Deepak

---

## Project Video Presentation

📽 *Watch here*: [Video Presentation Link](https://drive.google.com/file/d/1O-mMHYyqXwW3KyGEcE7M64zGRp1ujXRt/view?usp=sharing)

---

 
## Contact

For questions, contact any of the team members via email or raise an issue in this repository.

---
