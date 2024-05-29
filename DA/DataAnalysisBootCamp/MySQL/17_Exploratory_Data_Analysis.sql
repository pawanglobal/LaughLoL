-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging_1;
 
SELECT MAX(total_laid_off), MAX(percentage_laid_off) # 1 represent 100%
FROM layoffs_staging_1;
 
SELECT *
FROM layoffs_staging_1
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
 
SELECT *
FROM layoffs_staging_1
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
 
SELECT company, SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY company
ORDER BY 2 DESC;
 
SELECT MIN(`DATE`), MAX(`DATE`)
FROM layoffs_staging_1;
 
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY country
ORDER BY 1 DESC;

SELECT `DATE`, SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY `DATE`
ORDER BY 1 DESC;

SELECT YEAR(`DATE`), SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY YEAR(`DATE`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging_1
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 DESC;

WITH Rolling_total AS
( SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging_1
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 DESC
)
SELECT `MONTH`, total_off, SUM(total_off) OVER (ORDER BY `MONTH`)
FROM Rolling_Total;

SELECT company, YEAR(`DATE`), SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY company, YEAR(`DATE`)
ORDER BY 3 DESC;

WITH Company_year(Company, years, total_laid_off) AS
(SELECT company, YEAR(`DATE`), SUM(total_laid_off)
FROM layoffs_staging_1
GROUP BY company, YEAR(`DATE`)
),
Company_year_rank AS
(SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_year
WHERE years IS NOT NULL
) # ORDER BY ranking ASC
SELECT *
FROM Company_year_rank
WHERE ranking <= 5;
