# 🎬 Netflix Data Analysis Using SQL  

![Netflix Dashboard](https://github.com/uniyalsarthak/Netflix-Data-Analysis/blob/main/netflix_img.jpg)

## 📌 Project Overview  
This project explores and analyzes Netflix’s catalog data using **PostgreSQL**.  

The main goal of this project is to answer **15 real-world business questions** using SQL queries — covering data cleaning, aggregation, string and date functions, and analytical problem-solving.  

---

## 🗂️ Dataset Structure  

The dataset was loaded into a single table named `netflix` with the following structure:

| Column | Description |
|---------|--------------|
| `show_id` | Unique ID for each show |
| `type` | Indicates if it’s a *Movie* or *TV Show* |
| `title` | Name of the show/movie |
| `director` | Director(s) of the title |
| `casts` | List of main cast members |
| `country` | Country where it was produced |
| `date_added` | Date when added to Netflix |
| `release_year` | Original release year |
| `rating` | Content rating (e.g., PG, TV-MA) |
| `duration` | Runtime for movies or seasons for TV shows |
| `listed_in` | Genre or category |
| `description` | Short summary of the content |

---

## ⚙️ Database Setup  

```sql
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix
(
    show_id      VARCHAR(6),
    type         VARCHAR(10),
    title        VARCHAR(200),
    director     VARCHAR(350),
    casts        VARCHAR(1050),
    country      VARCHAR(250),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

## 🧠 Business Problems Solved (15 SQL Queries)

1. Count the number of Movies vs TV Shows  
2. Find the most common rating for movies and TV shows  
3. List all movies released in a specific year (e.g., 2020)  
4. Find the top 5 countries with the most content  
5. Identify the longest movie  
6. Find content added in the last 5 years  
7. Find all the movies/TV shows by a specific director (e.g., Ashwiny Iyer Tiwari)  
8. List all TV shows with more than 5 seasons  
9. Count the number of content items in each genre  
10. Find the average number of Indian movies released per year and top 5 years with highest content release  
11. List all movies that are documentaries  
12. Find all content without a director  
13. Find how many movies actor ‘Salman Khan’ appeared in over the last 10 years  
14. Find the top 10 actors with the highest number of Indian movies  
15. Categorize content as *Good* or *Bad* based on violent keywords in descriptions  

---

## 📊 Key Insights & Findings  

Here’s what the analysis reveals about Netflix’s content trends and strategies 👇  

### 🎞️ Content Composition
- **Movies dominate Netflix’s library**, forming around **70–75% of total titles**, while TV shows make up the rest.  
- This reflects Netflix’s emphasis on short-form, easily consumable entertainment for a global audience.

### 📅 Content Growth Over Time
- The number of titles added has **steadily increased after 2015**, with a major spike around **2019–2020**, possibly due to increased digital consumption during the pandemic.  
- New additions have slowed slightly in recent years, suggesting a shift toward **quality curation over quantity**.

### 🌍 Top Countries
- **United States, India, United Kingdom, Canada, and France** are the top 5 contributors of Netflix content.  

### 🇮🇳 Indian Market Insights
- On average, **India releases 162 titles per year** on Netflix.  
- The **most active years** were **2019–2021**, aligning with Netflix’s regional production and original content expansion in India.

### 🎬 Genres
- **Dramas, International Movies, and Comedies** dominate the Netflix library.  

### 🎭 Top Actors
- Frequent appearances in Indian Cinema include **Anupam Kher, Shah Rukh Khan, Naseeruddin Shah, and Akshay Kumar**, highlighting Netflix’s collaboration with well-known Indian cinema figures.

### ⚔️ Content Categorization (Sentiment)
- Using keyword-based classification (`kill`, `violence`, `blood`, `murder`, etc.), around **8–10% of titles were labeled as “Bad”**, while the rest were “Good.”  
- This suggests Netflix’s strong presence in **thriller and crime genres**, mixed with a majority of family-safe entertainment.

---

## 🧰 SQL Features Used  

- **String Functions:** `SPLIT_PART`, `STRING_TO_ARRAY`, `TRIM`, `UNNEST`  
- **Date Functions:** `TO_DATE`, `EXTRACT`, `CURRENT_DATE`, `INTERVAL`  
- **Aggregations:** `COUNT`, `MAX`, `ROUND`, `AVG`  
- **Conditional Logic:** `CASE`, `ILIKE`, `NULL` handling  
- **CTEs & Subqueries:** Used for layered and readable analysis  
- **Window Functions:** `RANK()` to identify the most frequent ratings  

---

## 📈 Tools & Environment  

- **Database:** PostgreSQL  
- **Editor:** pgAdmin  
- **Dataset Source:** Netflix Titles Dataset (Kaggle)

---

## 📚 Learning Outcomes  

- Learned to design and execute **complex analytical queries** on real-world datasets.  
- Gained hands-on experience with **PostgreSQL string and date operations**.  
- Practiced **conditional categorization** and keyword-based classification using `CASE` and `ILIKE`.  
- Strengthened understanding of **CTEs, subqueries, grouping, and aggregation logic**.  
- Extracted **business insights** from raw structured data using only SQL.

---

## 🧩 How to Run  

1. Clone the repository  
2. Import `netflix_db_project.sql` into your PostgreSQL environment  
3. Run the queries sequentially  
4. Explore the outputs and modify filters (e.g., year, country, or genre) for deeper insights  

---

## 🏁 Final Note  

This project demonstrates how powerful **SQL** alone can be in uncovering insights from large datasets.  
It bridges the gap between **data engineering and analytics**, showing how to transform raw Netflix data into **meaningful business intelligence**.  
