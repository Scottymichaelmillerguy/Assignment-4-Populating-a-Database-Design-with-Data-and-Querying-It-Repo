# Assignment-4-Populating-a-Database-Design-with-Data-and-Querying-It-Repo

In this assignment we will be building off of what we did in Assignment 3: Data Model to Database Design (Forward Engineering) Using Oracle Data Modeler . In that assignment we built a data model (logical design), forward engineered it to a database design (hardware/relational design), then exported it to DDL (create table statements).

In this assignment we will

Create a database design, either using Oracle Data Modeler or by writing SQL DDL by hand , or a combination of the two
In past semesters, it seems like DDL by hand is the easiest, most straightforward option and gives the most experience with SQL.
Load the DDL as a script to SQL Developer
Populate it with some made-up data using INSERT statements
Query and modify it with things we've learned in the past chapters
Like the past two assignments, the goal is to get you to use the tools and actively learn with low stakes (if you do the assignment according to the instructions/requirements, you will get full credit).  Below are the requirements

Create at least two tables/entities with a relationship between them. Of course just two tables isn't very interesting, but for students who are new to databases it may be good to keep it simple.  Some students used Assignment 3 to try out final project ideas and that is fine for this assignment too. However, don't-over think it: focus on the minimum requirements and make it more elaborate if you have time.
Populate the tables with at least 10 rows total (e.g. if there are two tables, one could have 4 and the other could have 6). Again, this is a minimum, you may choose to add more.  See below for tools that might help.
Show an example of the following commands/queries
A SELECT statement with a JOIN
An UPDATE statement
A DELETE or UPDATE statement that is prevented or cascaded by a foreign key constraint
A CREATE VIEW statement
An ALTER TABLE statement
Beyond these requirements, please feel free to experiment and have fun learning, but focus on the minimum requirements first.

For submission, submit a txt/sql, Word, and/or PDF file with the following:

A description of the design and narrative explaining any challenges or extra experiments that were tried (5 points): what was the design about (what was the domain?), how did you model it (what were the entities, their attributes/columns, and their relationship(s)?), how did you run/test it (did you use LiveSQL or SQL Developer? Did you use other tools like Mockaroo, Data Modeler, etc.?), did you run into any issues, etc.
the DDL statements to create the database (5 points): make sure these meet the requirements and run without errors.
the five example queries with comments to clarify which is which (10 points, 2 each): 
make sure these meet the requirements and run without errors.
To create data, the default simplest option is to just write INSERT statements.  If you want to try loading CSV you have some other options to populate your tables:

Use SQL Developer to load CSVLinks to an external site.
csv to sql converterLinks to an external site.
sqlfiddleLinks to an external site. , has a csv to sql converter (text to DDL) and other features as well but seems to be slow
MockarooLinks to an external site.
