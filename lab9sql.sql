CREATE TABLE IF NOT EXISTS role_type(
team_member char(20),
coach char(20),
assistant_coach char(20)
)

CREATE TABLE IF NOT EXISTS person(
pid int NOT NULL, 
first_name char(50) not null,
last_name char(50) not null,
address char(100) not null,
phone_number int not null,
primary key (pid)
)

create table if not exists players(
pl_id int not null,
pid int not null references person(pid),
birth_date date not null,
age_group char(20) NOT NULL,
primary key(pl_id,pid)
)

create table if not exists assistant_coaches(
aid int not null,
pid int not null references person(pid),
years_coaching int not null,
primary key (aid ,pid)
)

CREATE TABLE IF NOT EXISTS head_coaches(
hcid int not null,
pid int not null references person(pid),
years_coaching int not null,
primary key (hcid ,pid)
)

CREATE TABLE IF NOT EXISTS teams(
tid int NOT NULL,
pid int not null references person(pid),
age_group char(20) not null,
positions char(20) not null,
start_date date not null,
primary key (tid,pid)
)

CREATE TABLE IF NOT EXISTS leage(
lid int not null,
tid int not null,
PRIMARY KEY (lid)
)

insert into person (pid, first_name, last_name, address, phone_number)
VALUES('001', 'Johnny','Jackerson', '123 Sample Drive Example,Place 123456', '5555555')

insert into person (pid, first_name, last_name, address, phone_number)
VALUES('002', 'Hane','Hues', '456 Sample Drive Example,Place 123456', '1111111')
insert into person (pid, first_name, last_name, address, phone_number)
VALUES('003', 'Sally','Sommers', '789 Sample Drive Example,Place 123456', '2222222')
insert into person (pid, first_name, last_name, address, phone_number)
VALUES('004', 'Rick','Renoylds', '101 Sample Drive Example,Place 123456', '3333333')
insert into person (pid, first_name, last_name, address, phone_number)
VALUES('005', 'Sarah','Smith', '111 Sample Drive Example,Place 123456', '4444444')
insert into person (pid, first_name, last_name, address, phone_number)
VALUES('006', 'Ashley','Johnson', '121 Sample Drive Example,Place 123456', '5555555')


insert into players(pl_id, pid, birth_date, age_group)
VALUES ('001','003',DATE '2000-02-15','14 plus')
insert into players(pl_id, pid, birth_date, age_group)
VALUES ('002','002',DATE '2005-08-05','10 to 14')
insert into players(pl_id, pid, birth_date, age_group)
VALUES ('003','006',DATE '2011-10-22','Under 10')

INSERT INTO assistant_coaches(aid, pid, years_coaching)
VALUES('001','005', '5')
INSERT INTO assistant_coaches(aid, pid, years_coaching)
VALUES('002','004', '2')

INSERT INTO head_coaches(hcid, pid, years_coaching)
VALUES('001','001', '7')


