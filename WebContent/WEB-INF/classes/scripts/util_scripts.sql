select CONCAT('RENAME TABLE ', table_name, ' TO ', UPPER(table_name),';') from information_schema.tables where table_schema = 'madone0401';