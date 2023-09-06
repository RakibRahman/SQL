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