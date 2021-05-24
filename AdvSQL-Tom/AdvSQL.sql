
-- The BETWEEN statement

SELECT * FROM orders WHERE price >=50 and price <= 100;

-- Alternative

SELECT * FROM orders WHERE price BETWEEN 50 and 100;

SELECT * FROM orders WHERE price BETWEEN 50 and 100;

-- Examples

select * from players 
where weight >=100 and weight <= 200;

select * from players 
where weight between 100 and 200;

select * from players 
where weight not between 100 and 200;


select * from Store_Information where PurchaseDate
	between 'Jan-06-1999' and 'Jan-10-1999';


select * from players 
where birthdate between '01/01/1960' and '12/31/1969';


-- The IN statement

select * from orders where State = 'WA' or State = 'OR' or State = 'ID';

-- Alternative

select * from orders where State IN('OR','ID','WA');

select * from orders where State not in ('OR','ID','WA');

select * from players 
where birthstate in ('ID','WA','OR');

select * from players
where birthstate not in ('ID','WA','OR');

select * from orders where State IN (select distinct State from Customers);

select distinct birthstate from players
where ddeath <'01/01/1900' and birthstate is not null
order by birthstate;

select * from players where birthstate in (select distinct birthstate from players
where ddeath <'01/01/1900' and birthstate is not null);


-- Case - Power User

select Name,Address,City,State, CASE When IsMember=1 then
'Member' else 'Not Member' as 'Type' End from Membership;

-- Alternate

select Name,Address,city,State,Type=CASE when IsMember=1
then 'Member' else 'Not Member' end from Membership;

select name, don_amount,
case when don_amount < 100 then 'Minimal'
when don_amount < 1000 then 'Medium'
else 'Large' END DonationSize
from tblWADonations;

select namelast, namefirst , weight,
case when weight <150 then 'Light'
     when weight <200 then 'Medium'
     when weight <250 then 'Large'
     else 'Huge' end as Build
from players;


select namelast, namefirst, bats,
case when bats = 'L' then 'Left'
     when bats = 'R' then 'Right'
     when bats = 'B' then 'Swith'
     else 'Unk' end as NewBats
from players;



-- Like - Power User

select * from Customers where name LIKE 'A%';     -- In the beginning.

select * from Customers where City Like '%ANE';   -- At the end.

select * from Customers where City Like '%CITY%';  -- anywhere in the name.

select namelast, namefirst from players
where namelast like 'A%';


-- Like - Wildcard Operators

-- 1. Underscore _
-- 2. []  : in the range.
-- 3. [^] : not in the lange.



-- Alias Table Names

select NameLast + ',' + NameFirst as 'FullName';

Select Name, Address, City, State, Zip from Membership as T;



-- INTO - Creating a Spin-Off Table
-- spantshot of the table at the current moment.

select * into from battingBackup from batting;

select namelast, namefirst,
case when bats = 'L' then 'Left'
     when bats = 'R' then 'Right'
     when bats = 'B' then 'Swith'
     else 'Unk' end Bats

into battingBackup from players;


-- Views

-- Real-time data.

-- Complicated statements can be saved as view. Eg. JOIN statements etc.

Create view vwWACustomers as
 select * from Customer where State = 'WA';


select * from vwWACustomers;


create view vwTypeHitters as
select namelast,namefirst,
case when bats='L' then 'Left'
     when bats = 'R' then 'Right'
     when bats = 'B' then 'Both'
     else 'Unk' end Bats

from players;


select * from vwTypeHitters;
select lastname, Bats from vwTypeHitters;















































