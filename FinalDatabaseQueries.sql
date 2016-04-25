
CREATE TABLE IF NOT EXISTS people(
pid int not null,
first_name varchar(50) not null,
last_name varchar(50) not null,
address varchar(100) not null,
jobtitle char(10),
PRIMARY KEY(pid)
);

INSERT INTO people (pid, first_name, last_name, address)
VALUES(1, 'Jane', 'Doe', '"123 Example Drive NYC, NY 12500')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(2,'John','Doe','456 Sample Street Albany, NY 12700')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(3,'John','Doe','789 Placeholder Ave Yonkers, NY 12810')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(4,'Melanie','Sutherland','5877 8th Street South Stillwater, MN 55082')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(5,'Jane','Bower','2787 William Street Olive Branch, MS 38654')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(6,'Angela','Metcalfe','1254 Myrtle Avenue Mountain View, CA 94043')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(7,'Lewis','DeMona','5012 Woodrow Lane, Chicago,IL , 50291')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(8,'Madeleine','Peake','62 North Street Bradenton, FL 34203')
INSERT INTO people (pid, first_name, last_name, address)
VALUES(9,'Rachel','Robertson','435 Catherine Street East Hartford, CT 06118')

CREATE TABLE IF NOT EXISTS cashiers(
cid int not null,
pid int not null references people(pid),
jobtitle varchar(50) default ('cashiers'),
PRIMARY KEY(cid)
);

INSERT INTO cashiers (cid , pid)
VALUES(2, 2) 
INSERT INTO cashiers (cid , pid)
VALUES(4, 4)

CREATE TABLE IF NOT EXISTS attendants(
aid int not null,
pid int not null references people(pid),
jobtitle varchar(50) default ('attendants'),
PRIMARY KEY(aid)
);

INSERT INTO cashiers (aid , pid)
VALUES(1, 1) 
INSERT INTO cashiers (aid , pid)
VALUES(3, 3)

CREATE TABLE IF NOT EXISTS mechanics(
mid int not null,
pid int not null references people(pid)
jobtitle varchar(50) default ('mechanics'),
PRIMARY KEY(mid)
);

INSERT INTO mechanics (mid , pid)
VALUES(5, 5) 
INSERT INTO cashiers (mid , pid)
VALUES(8, 8)

CREATE TABLE IF NOT EXISTS logged_time(
tid int not null,
pid int not null references people(pid),
cid int references cashiers(cid),
mid int references mechanics(mid),
start_time timestamp,
end_time timestamp, 
day_logged day,
shift_number int,
aid int references assistants(aid)
PRIMARY KEY(tid,pid)
)

INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number)
VALUES(1,5,TIMESTAMP'2016-04-08 08:23:54',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')
INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number)
VALUES(2,2,TIMESTAMP'2016-04-08 08:23:54',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')
INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number)
VALUES(4,4,TIMESTAMP'2016-04-08 08:23:54',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')
INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number
VALUES(5,3,TIMESTAMP'2016-04-18 09:23:54',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')
INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number)
VALUES(3,3,TIMESTAMP'2016-04-08 08:23:54',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')
INSERT INTO logged_time (tid , pid, start_time,end_time,day_logged,shift_number)
VALUES(6,8,TIMESTAMP'2016-04-07 07:30:14',TIMESTAMP'2016-04-08 16:05:00' date'2016-04-08')


CREATE TABLE IF NOT EXISTS product_types(
pr_type_id int NOT NULL,
pr_types varchar(50) NOT NULL,
PRIMARY KEY(pr_type_id)
)

INSERT INTO product_types (pr_type_id,pr_types)
values (1,'snack')
INSERT INTO product_types (pr_type_id,pr_types)
values (2,'drink')
INSERT INTO product_types (pr_type_id,pr_types)
values (3,'gas')
INSERT INTO product_types (pr_type_id,pr_types)
values (4,'food')
INSERT INTO product_types (pr_type_id,pr_types)
values (5,'meat')
INSERT INTO product_types (pr_type_id,pr_types)
values (6,'parishables')
INSERT INTO product_types (pr_type_id,pr_types)
values (7,'pastries')

create table IF NOT EXISTS gas_type(
gas_id int not null,
g_type varchar(50) not null,
pr_type_id int not null,
PRIMARY KEY(gas_id, g_type)
)

INSERT INTO gas_type (gas_id,g_type, pr_type)
values (1,'premium',3 )
INSERT INTO gas_type (gas_id,g_type, pr_type)
values (2,'regular',3 )
INSERT INTO gas_type (gas_id,g_type, pr_type)
values (3,'diesel',3 )
INSERT INTO gas_type (gas_id,g_type, pr_type)
values (4,'ethanol',3 )
INSERT INTO gas_type (gas_id,g_type, pr_type)
values (5,'Octane 78',3 )

CREATE TABLE IF NOT EXISTS products(
pr_id int not null,
pr_type_id int not null references gas_type(pr_type_id),
title char(50) not null,
qty int not null,
PRIMARY KEY(pr_id)
 )
 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 1, 1, 'chips', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 4, 4, 'jerkey', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 2, 2, 'mountain dew', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 7, 7, 'donuts', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 6, 6, 'milk', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 5, 5, 'hotdogs', 50) 
 INSERT INTO products(pr_id,pr_type_id,title,qty)
 values( 3, 3, 'gas', 50)
 

CREATE TABLE IF NOT EXIST gas(
gid int not null,
g_type varchar(50)not null,
primary key(gid)
)

INSERT INTO gas (gid, g_type)
values (1,2)
INSERT INTO gas (gid, g_type)
values (2,1)
INSERT INTO gas (gid, g_type)
values (3,2)
INSERT INTO gas (gid, g_type)
values (4,5)
INSERT INTO gas (gid, g_type)
values (5,3)

CREATE TABLE IF NOT EXISTS maintenance_logs(
maint_id int not null,
mid int not null references mechanics(mid),
last_filled timestamp not null,
primary key (maint_id)
)

INSERT INTO maintenance_logs (maint_id,mid,last_filled)
values(1,5, TIMESTAMP'2016-07-26 09:15:00')
INSERT INTO maintenance_logs (maint_id,mid,last_filled)
values(2,8, TIMESTAMP'2016-10-16 15:50:29')

CREATE TABLE IF NOT EXISTS gas_pumps(
gid int not null,
maint_id int not null references maintenance_logs(maint_id),
last_operated_on timestamp not null,
primary key(gid, maint_id)
)

insert into gas_pumps( gid, maint_id, last_operated_on)
values(1,1,TIMESTAMP'2016-07-26 13:30:12')
insert into gas_pumps( gid, maint_id, last_operated_on)
values(2,2,TIMESTAMP'2016-07-26 13:30:12')

CREATE TABLE IF NOT EXISTS gas_robots(
rid int not null,
maint_id int not null references maintenance_logs(maint_id),
last_operated_on timestamp not null,
primary key(rid)
)

Insert into gas_robots( gid, maint_id, last_operated_on)
values(1,2,TIMESTAMP'2016-01-25 17:12:29')
insert into gas_robots( gid, maint_id, last_operated_on)
values(2,1,TIMESTAMP'2016-01-25 17:12:29')

CREATE VIEW StaffFilledPositions AS
SELECT p.pid, p.first_name, last_name, m.jobtitle from people p
INNER JOIN mechanics m on p.pid=m.pid
Union 
SELECT p.pid, p.first_name, last_name, a.jobtitle from people p
INNER JOIN attendants a on p.pid=a.pid
Union 
SELECT p.pid, p.first_name, last_name, c.jobtitle from people p
INNER JOIN cashiers c on p.pid=c.pid
order by pid asc

CREATE VIEW product_info AS
select t.pr_type_id, p.title, t.pr_types, p.qty
FROM product_types t
LEFT JOIN products p on p.pr_type_id=t.pr_type_id 

create or replace function getEmployeeTotalHours(int, REFCURSOR) returns refcursor as 
$$
declare

   user_pid int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
   
	select p.pid, p.first_name, p.last_name,start_time, end_time, day_logged, shift_number,(end_time - start_time )as total_hours_worked 
	from logged_time lt
	LEFT JOIN people p on p.pid=lt.pid
       where  user_pid >=p.pid;
   return resultset;
end;
$$ 
language plpgsql;


CREATE ROLE manager_admin;
GRANT ALL ON ALL TABLES in schema public
TO manager_admin

CREATE ROLE mechanic_admin;
GRANT SELECT, UPDATE, INSERT on maintenance_logs, gas_pumps, gas_robots TO mechanic_admin;


CREATE ROLE cashier_employee;
GRANT SELECT, INSERT, UPDATE on logged_hours TO cashier_employee; 


CREATE ROLE attendant_employee;
GRANT SELECT, INSERT, UPDATE on logged_time TO attendant_employee;

CREATE TRIGGER viewEmployeeHours 
AFTER UPDATE ON logged_time 
FOR EACH ROW EXECUTE PROCEDURE getEmployeeTotalHours ();


select ml.maint_id, p.first_name, p.last_name, ml.mid as mechanic_id, gp.last_operated_on as gas_pump_last_maintained_date, gr.last_operated_on as gas_pump_last_maintained_date FROM maintenance_logs ml
INNER JOIN gas_pumps gp on gp.maint_id=ml.maint_id
INNER JOIN gas_robots gr on gr.maint_id=ml.maint_id
INNER JOIN mechanics m on m.mid=ml.mid
inner join people p on p.pid=m.pid


