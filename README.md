# SQL
SQL is a programming language designed to manipulate and manage data stored in relational databases.

`CREATE TABLE` creates a new table.
```

CREATE TABLE languages (
id INTEGER,
name TEXT
);

```
`INSERT INTO` adds a new row to a table.
```
INSERT INTO languages
VALUES (1,'JS');

INSERT INTO languages
VALUES (2,'Python');

```
`SELECT` queries data from a table.
```
SELECT * FROM languages // returns all columns

SELECT id from languages // returns only id column
```
`ALTER TABLE` statement is used to add, delete, or modify columns in an existing table.
```
ALTER TABLE languages
ADD COLUMN year INTEGER; // add a column named year to languages table

RENAME COLUMN old_name to new_name; //rename a column
DROP COLUMN column_name; // Drop a column
```
`UPDATE` edits a row in a table.
```
UPDATE languages 
SET year = 1997 
WHERE id = 1; 

UPDATE languages
SET year = 2000
WHERE id = 2;
```
`DELETE FROM` deletes rows from a table
```
DELETE FROM languages
WHERE id = 3;
```

# Constraints
Constraints that add information about how a column can be used are invoked after specifying the data type for a column. They can be used to tell the database to reject inserted data that does not adhere to a certain restriction. The statement below sets constraints on the celebs table.

```
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);

```


1. PRIMARY KEY columns can be used to uniquely identify the row. Attempts to insert a row with an identical value to a row already in the table will result in a constraint violation which will not allow you to insert the new row.

2. UNIQUE columns have a different value for every row. This is similar to PRIMARY KEY except a table can have many different UNIQUE columns.

3. NOT NULL columns must have a value. Attempts to insert a row without a value for a NOT NULL column will result in a constraint violation and the new row will not be inserted.

4. DEFAULT columns take an additional argument that will be the assumed value for an inserted row if the new row does not specify a value for that column.

---

# DISTINCT
`DISTINCT` is used to return unique values in the output. It filters out all duplicate values in the specified column(s).
```
SELECT DISTINCT tools 
FROM inventory;

SELECT DISTINCT course_id, exercise_id FROM courses;
```
---
# WHERE
The `WHERE` clause filters the result set to only include rows where the following condition is true.
```
SELECT *
FROM students
WHERE age > 8;
```

Comparison operators used with the WHERE clause are:

    = equal to
    != not equal to
    > greater than
    < less than
    >= greater than or equal to
    <= less than or equal to

---

# LIKE
`LIKE` is a special operator used with the `WHERE` clause to search for a specific pattern in a column.
```
SELECT * from names;
WHERE first_name LIKE 'r_b' //it will look for columns whrer name starts with 'r' and ends with 'b'
```
_ means you can substitute any individual character.

% is a wildcard character that matches zero or more missing letters in the pattern. For example:

    A% matches all movies with names that begin with letter ‘A’
    %a matches all movies that end with ‘a’
```
SELECT * 
FROM movies
WHERE name LIKE 'A%'
```
We can also use % both before and after a pattern:

```
SELECT * 
FROM movies 
WHERE name LIKE '%man%';
```
if a patterns contains '%' or '_' , we can use escape character \ to include it
```
SELECT *
FROM books
WHERE title LIKE '% 100\%';
```
Here, any movie that contains the word ‘man’ in its name will be returned in the result.
---

# Is Null
Unknown or missing values are indicated by NULL.It is not possible to test for NULL values with comparison operators, such as = and !=. 

to test for NULL values we can use:

    IS NULL // contains value
    IS NOT NULL //value is missing
```
SELECT name
FROM people 
WHERE address IS NOT NULL;
```
---


# BETWEEN

The `BETWEEN` operator is used in a WHERE clause to filter the result set within a certain range.

```
SELECT * FROM students
WHERE year BETWEEN 1990 AND 1999;
WHERE name BETWEEN 'A' AND 'J'; // in this statement BEETWEEN filters the result set only to include names that begin with 'A' ,upto but not including 'J'. 

```
---

# AND & OR Operator
 To combine multiple conditions in a `WHERE`clause to make the result set more specific and useful we can use `AND` or `OR`  operator.

 With `AND`, both conditions must be true for the row to be included in the result.
 `OR` operator displays a row if any condition is true.

 ```
SELECT * FROM results
WHERE year BETWEEN 1990 AND 1999 AND grade = 'a+';

SELECT * FROM schools
WHERE year < 1985 AND type = 'public';



SELECT *
FROM students
WHERE year > 2014
   OR grade = 'D';
 ```
 ---

# IN Operator
The IN operator allows the user to specify multiple values in the WHERE clause.
```
SELECT *
FROM inventory
WHERE item_name IN ('plunger', 'soap', 'wipes'); // this statement will return result set where item_name is equal to  'plunger', 'soap', 'wipes'.


SELECT *
FROM customers
WHERE country IN (
  SELECT country
  FROM suppliers
);


```
---

 # ORDER BY
`ORDER BY` clause is used to sort the results.
```
SELECT *
FROM students
ORDER BY name; // sort every from A through Z by students name;

SELECT *
FROM students
WHERE grade = 'A+'
ORDER BY pass_year DESC;


SELECT year, name
FROM students
ORDER BY year ASC, name DESC; // with multiple columns?
```

`DESC` is a keyword used in ORDER BY to sort the results in descending order (high to low or Z-A).

`ASC` is a keyword used in ORDER BY to sort the results in ascending order (low to high or A-Z).


---

# LIMIT
`LIMIT` is a clause that lets you specify the maximum number of rows the result set will have.

```
SELECT *
FROM students
LIMIT 10;
```

# CASE
A `CASE` statement allows us to create different outputs based on condition. It's the if-else of SQL.

```
select name,
CASE
  WHEN grade = 'A+' THEN 'Fantastic' 
  WHEN grade = 'F' THEN 'Fail'
  ELSE 'Absent'
END // The CASE statement must end with END.
END AS 'Review' //rename column
FROM students;
```

# Aggregate Functions
Calculations performed on multiple rows of a table are called `aggregates`.
some important aggregates:

- COUNT(): count the number of rows
   ```
   SELECT COUNT (*) FROM fake_apps // * - count every row
   WHERE price = 0.0;

   COUNT() is used to take a name of a column, and counts the number of non-empty values in that column
   ```
- SUM(): the sum of the values in a column
   ```
   SELECT SUM(downloads)
   FROM fake_apps;

    use COUNT() when you want to count how many rows contain a non-empty value for a specified column. Use SUM() when you want to get the total sum of all values in a column.
   ```
- MAX()/MIN(): the largest/smallest value
   ```
   SELECT MAX(downloads)
   FROM fake_apps;

   SELECT MIN(downloads)
   FROM fake_apps;
   ```
- AVG(): the average of the values in a column
   ```
   SELECT AVG(downloads)
   FROM fake_apps;
   ```
- ROUND(): round the values in the column

`ROUND()` function takes two arguments inside the parenthesis:

- a column name
- an integer
It rounds the values in the column to the number of decimal places specified by the integer. 
   ```
SELECT ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;

   ```

# GROUP BY
GROUP BY is a clause in SQL that is used with aggregate functions. It is used in collaboration with the SELECT statement to arrange identical data into groups.

The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.

```
SELECT year,
   AVG(price)
FROM app_list
GROUP BY year
ORDER BY year;

SELECT price, COUNT(*) 
FROM fake_apps
GROUP BY price; //The result contains the total number of apps for each price.

SELECT category, SUM(downloads) 
FROM fake_apps
GROUP BY category; // calculates the total number of downloads for each category.
```

# HAVING
`HAVING` clause  allows you to filter which groups to include and which to exclude.

- When we want to limit the results of a query based on values of the individual rows, use WHERE.
- When we want to limit the results of a query based on an aggregate property, use HAVING.

`HAVING` statement always comes after GROUP BY, but before ORDER BY and LIMIT.

```
SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;

<!-- WHERE & HAVING -->

SELECT genre, ROUND(AVG(score))
FROM students
WHERE bill > 500000 
GROUP BY class
HAVING COUNT(*) > 5;
```