BEGIN
  FOR cur_rec IN (SELECT table_name
                  FROM user_tables) -- Replace with appropriate schema if needed
  LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
END;
/