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
