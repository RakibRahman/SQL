# Trigger

A trigger is a function invoked automatically when an INSERT, UPDATE, DELETE, or TRUNCATE occurs on a table.

- Following trigger atomically insets data to `employee_audits` table whenever data is inserted into `employee` table.

```
 <!-- First, create the function -->

CREATE OR REPLACE FUNCTION INSERT_EMPLOYEE_AUDIT () RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
BEGIN
insert into employee_audits (employee_id,last_name,changed_on)
	values(new.id,new.last_name,now());
return new;
END;
$$;

 <!-- Second, create the trigger -->
CREATE OR REPLACE TRIGGER AFTER_INSERT_EMPLOYEE
AFTER INSERT ON EMPLOYEES FOR EACH ROW
EXECUTE PROCEDURE INSERT_EMPLOYEE_AUDIT ();

<!-- FInally Insert data to employee table -->
INSERT INTO
	EMPLOYEES (FIRST_NAME, LAST_NAME)
VALUES
	('Nick', 'john');
```

- Following function inserts the old last name into the `employee_audits` table if `employees` last_name changes
- The OLD represents the row before the update while the NEW represents the new row that will be updated.
- Before the value of the last_name column is updated, the trigger function is automatically invoked to log the changes.

```
CREATE
OR REPLACE FUNCTION UPDATE_EMPLOYEE_AUDIT () RETURNS TRIGGER LANGUAGE PLPGSQL AS $$

	BEGIN
	if new.last_name <> old.last_name THEN
	INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
END if;

return NEW;
	END;

	$$;

create or replace trigger update_employee_name
BEFORE UPDATE on employees
 FOR EACH ROW
  EXECUTE PROCEDURE UPDATE_EMPLOYEE_AUDIT ();

UPDATE employees
SET last_name = 'jack'
WHERE ID = 4;

SELECT * FROM employees;
```

- Following trigger updates the last_name in `employee_audits` table if `employees` last_name is updated

  ```
  CREATE
  OR REPLACE FUNCTION UPDATE_EMPLOYEE_AUDIT () RETURNS TRIGGER LANGUAGE PLPGSQL AS $$

  	BEGIN
  	if new.last_name != old.last_name THEN
  	UPDATE employee_audits
  SET last_name = new.last_name
  WHERE ID = old.id;
  END if;
  ```

return NEW;
END;

$$
;

create or replace trigger update_employee_name
After UPDATE on employees
FOR EACH ROW
EXECUTE PROCEDURE UPDATE_EMPLOYEE_AUDIT ();

UPDATE employees
SET last_name = 'hammer'
WHERE ID = 4;

```

- Following code wraps the `CREATE FUNCTION` and `CREATE TRIGGER` commands in a transaction.
    - This ensures that if any of these commands fail, none of the changes are committed to the database, maintaining data integrity.



```
BEGIN;

CREATE
OR REPLACE FUNCTION INSERT_BOARD_USER () RETURNS TRIGGER AS
$$

          BEGIN
            INSERT INTO board_users (board_id, user_id, role)
            VALUES (NEW.id, NEW.creator_id, 'admin');

            RETURN NEW;
          END;
          $$ LANGUAGE PLPGSQL;

CREATE
OR REPLACE TRIGGER AFTER_INSERT_BOARDS
AFTER INSERT ON BOARDS FOR EACH ROW
EXECUTE PROCEDURE INSERT_BOARD_USER ();

COMMIT;

INSERT INTO
BOARDS (NAME, DESCRIPTION, CREATOR_ID)
VALUES
(
'board one',
'testing',
'297131bf-d3ad-484f-908b-ae9f8c43e3c1'
);

```


```
