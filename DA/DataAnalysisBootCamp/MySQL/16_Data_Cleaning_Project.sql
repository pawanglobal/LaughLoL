-- Data Cleaning Project

-- Data which I am using
-- https://www.kaggle.com/datasets/swaptr/layoffs-2022

SELECT *
FROM layoffs;

-- When we do data cleaning we usually follow a few steps:

-- 1. Remove Duplicates
-- 2. Standardize the data (Spelliing, etc.)
-- 3. Null values or Blank values
-- 4. Remove any unnecessary Columns, or Rows - few steps

-- Step 1.
-- Remove Duplicates
-- Create a copy of Data, or Staging data, to perform Data Cleaning

-- COPY OF TABLE

CREATE TABLE layoffs_staging
LIKE layoffs;

-- INSERTING VALUES

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

-- First remove Duplicates
-- We don't have any id's, means uninqueness to see Duplicate
-- So we will use CTE

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

-- Now wee need to find row_num where it is 2 or greater than
-- For duplicates
-- We will use CTE for this

WITH duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,
funds_raised_millions) AS row_num # Sometimes we only select few columns to work fast, make sure you are not deleting any legitimate data
FROM layoffs_staging # Safe zone; try to select all columns
)

SELECT *
FROM duplicate_CTE
WHERE row_num >= 2;

-- After getting the duplicates, try to double check wheter they are duplicate or not

SELECT *
FROM layoffs_staging
WHERE company = 'Yahoo';

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- Confirmed these are the duplicates

-- We can't perform any update on CTE directly
-- DELETE is like an update

WITH duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,
funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_CTE
WHERE row_num > 1;

-- So we will create a new table to remove the duplicates

CREATE TABLE `layoffs_staging_1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- see the table

SELECT *
FROM layoffs_staging_1;

-- Now put the data

INSERT INTO layoffs_staging_1
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,
funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging_1
WHERE row_num >=2;

DELETE
FROM layoffs_staging_1
WHERE row_num > 1;

-- If you are unable to update the table then
-- Go to Edit > Preferences > SQL Editor > remove the tick from safe updates

SELECT *
FROM layoffs_staging_1
WHERE row_num > 1;

-- STEP 2.
-- Standardizing the Data

SELECT DISTINCT company
FROM layoffs_staging_1
WHERE company LIKE ' %' OR NULL;

-- As we can see there is some space in front of some companies
-- To remove it

SELECT company, TRIM(company)
FROM layoffs_staging_1;

-- UPDATE the tabel

UPDATE layoffs_staging_1
SET company = TRIM(company);

-- Now look at next column

SELECT DISTINCT industry
FROM layoffs_staging_1
ORDER BY 1;

-- IF we see the Industry column then Crypto is written with different names
-- We need a simimlar name, or unique value for crypto
-- So let's update it
-- Why? To analyze the data correctly, we need to group these rows together

SELECT DISTINCT industry
FROM layoffs_staging_1
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging_1
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Now let's look at location

SELECT DISTINCT location
FROM layoffs_staging_1
ORDER BY 1;

-- move on to country

SELECT DISTINCT country
FROM layoffs_staging_1
ORDER BY 1;

-- One issue with the 'United States'
-- We have some 'United States', and some 'United States.'
-- Two ways to correct it

SELECT DISTINCT country, Trim(TRAILING '.' FROM country)
FROM layoffs_staging_1
ORDER BY 1;

-- FIRST METHOD

UPDATE layoffs_staging_1
SET country = Trim(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- SECOND METHOD

UPDATE layoffs_staging_1
SET country = 'United States'
WHERE country LIKE 'United States%';

-- If we see the date's data type is 'text'
-- To analyse data correctly first we need to change it into correct format
-- For that we can use 'STR_TO_DATE' method

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging_1;

UPDATE layoffs_staging_1
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging_1;

-- As we can see the Date cloumn type is still 'TEXT', but it is in correct format
-- Now let's change into 'Date' data type
-- Try to do it on staging data, not on raw data

ALTER TABLE layoffs_staging_1
MODIFY COLUMN `date` DATE;

-- STEP 3.
-- NULL VALUES, BLANK VALUES

SELECT *
FROM layoffs_staging_1;

SELECT total_laid_off, percentage_laid_off
FROM layoffs_staging_1
WHERE total_laid_off IS NULL # We can  remove both; it would not make any sense in analysis
AND percentage_laid_off IS NULL; # both are importatnt factors in analysis, we will get back on this in our Step 4.

-- We can populate values in 'industry'

SELECT company, industry
FROM layoffs_staging_1
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging_1
WHERE company = 'Airbnb'
ORDER BY 2;

-- We can see Airbnb insustry is 'Travel' -> by looking at industry column values
-- So we can populate each company's industry where it is empty

SELECT t1.industry, t2.industry
FROM layoffs_staging_1 t1
JOIN layoffs_staging_1 t2
	ON t1.company = t2.company
    WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- Now, let's update it

UPDATE layoffs_staging_1 t1
JOIN layoffs_staging_1 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- There are still missing values
-- I think the problem is t1.industry = ''
-- let's give the empty value, a null value

UPDATE layoffs_staging_1
SET industry = NULL
WHERE industry = '';

-- After this run our modified query

UPDATE layoffs_staging_1 t1
JOIN layoffs_staging_1 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Let's check again everything

SELECT *
FROM layoffs_staging_1
WHERE industry IS NULL
OR industry = '';

-- It's like 'Bally's Interactive' has still NULL values
-- That's why our previous queries didn't work out
-- Let's check this one also

SELECT *
FROM layoffs_staging_1
WHERE company = "Bally's Interactive"
ORDER BY 1;

-- Look at Null Values

-- The null values in total_laid_off, percentage_laid_off, and funds_raised_millions all look normal.
-- I don't think I want to change that
-- I like having them null because it makes it easier for calculations during the EDA phase

-- so there isn't anything I want to change with the null values

-- Now let's move back to which rows we can delete

-- STEP 4.
-- Remove unnecessary Columns or Rows

-- Now let's move back to which rows we can delete

SELECT *
FROM layoffs_staging_1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging_1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_1;

-- Drop the row_num column, we don't need it

ALTER TABLE layoffs_staging_1
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging_1
ORDER BY 1;
