--Create Courses Table--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);

--Insert Data in to Courses-
insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

--Testing data in Courses-
select * 
from courses
order by num ASC;

--Create Prerequisites Table-
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

--Insert values into Prerequisites table--
insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

--Test data in Prerequisites--
select *
from Prerequisites
order by courseNum DESC;


 

--Premade Stored Procedure--
create or replace function get_courses_by_credits(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from   courses
       where  credits >= num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select get_courses_by_credits(0, 'results');
Fetch all from results;

--PreReqs For Stored Procedure --
create or replace function preresfor(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
	select courseNum  
	FROM prerequisites 
       where  preReqNum = num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select preresfor(120, 'results');
Fetch all from results;

--Is Pre Req For For Stored Procedure --
create or replace function isprereqfor(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
	select preReqNum  
	FROM prerequisites 
       where  courseNum = num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select isprereqfor(499, 'results');
Fetch all from results;

