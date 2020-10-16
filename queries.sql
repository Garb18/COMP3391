--Question 01
select *
from ctransaction
where quarter(DateEnd) = 3 --Question 02
select *
from staff
where RoleID = "R006" --Question 03
select Product
from suppliesatdepot
where qty >= 10 --Question 04
select max(qty)
from suppliesatdepot --Question 05
select min(qty)
from suppliesatdepot --Question 06
select *
from vehicle
where servicedate < Sysdate() --Question 07
SELECT COUNT(TranID),
    Service
FROM ctransaction
GROUP BY Service
ORDER BY COUNT(TranID) DESC
LIMIT 3 --Question 08
select count(*)
from client --Question 09
select avg(datediff(dateleave, datearrive))
from accommodation --Question 10
select sum(quote)
from ctransaction --Question 11
select company,
    email
from supplier
order by length(email) DESC
LIMIT 1 --Question 12
SET @stay = 0;
SELECT Location,
    @stay := datediff(dateleave, datearrive) AS Stay,
    @stay * accommodation.Acc_Cost_PP_PN AS Cost
FROM accommodation --Question 13
select (datediff(datearrive, dateleave)) as travelTime
from travel
where destination = "Kleeve" --Question 14
select FirstName,
    LastName,
    Mobile,
    Postcode
from staff
where Postcode like 'b%' --Question 15
select service,
    sum(quote)
from ctransaction
group by service
order by sum(quote) DESC --Question 16
select *
from client
where CompOrg is not NUll --Question 17
select Product,
    (price_per_unit * qty) as totalValue
from suppliesatdepot
group by product
order by totalValue DESC --Question 18
select sum(price_per_unit * qty) as totalValue
from suppliesatdepot