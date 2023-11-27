Practicing Data Retrieval
============================

1. Create a database (if not already created)

```
mysql -u root -pYOUR_PASSWORD -e "CREATE DATABASE Your_Database_Name"
```

2. Load the tables

```
mysql -u root -pYOUR_PASSWORD Your_Database_Name < 1_make_tables.sql
```

2. Load the dummy dataset

```
mysql -u root -pYOUR_PASSWORD Your_Database_Name < 2_load_data.sql
```


3. Practic data retrieval queries

Open the `3_practice.sql` try the queries.
Try changing conditions, orders, limits and do experiments yourself.