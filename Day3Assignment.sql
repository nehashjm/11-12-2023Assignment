create database ExerciseDb
on primary (name='Exercise_Db', Filename='D:\mphasis Simplilearn\Phase2\Day3\Exercise_Db.mdf')
log on (name='Customer_Db_log',filename='D:\mphasis Simplilearn\Phase2\Day3\Exercise_Db_log.ldf')
COLLATE SQL_Latin1_General_CP1_CI_AS
use ExerciseDb
create table ProductsTable
(Id int identity primary key,
PQ int,
PPrice float,
DiscountPercent float,
ManufacturingDate date )

insert into ProductsTable values (5,20000,2,'12/12/2011')
insert into ProductsTable values (3,10000,3,'11/11/2011'),
(4,20000,2,'10/10/2010'),
(2,30000,3,'09/09/2009'),
(5,20000,2,'08/08/2008')
select * from ProductsTable

create function DiscountPrice
(
@pp float,
@dp float
)
returns float
as 
begin 
return (@pp*(@dp/100))
end

select dbo.DiscountPrice(20000,10) as 'discount'

select Id as 'Pid',PPrice as 'Price' ,dbo.DiscountPrice(PPrice,DiscountPercent) as 'Discount',PPrice-dbo.DiscountPrice(PPrice,DiscountPercent)as 'Price after Discount' from ProductsTable 