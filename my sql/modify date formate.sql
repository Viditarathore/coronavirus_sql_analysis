select * from mytable;

ALTER TABLE mytable
MODIFY COLUMN Date DATE;

update mytable
set Date =str_to_date(Date,'%d-%m-%Y');