--Week 06
--Question 01
SELECT part_name,
    part_unit_cost
FROM part
WHERE Part_unit_cost > (
        SELECT AVG(Part_unit_cost)
        FROM part
    );
----------------------------------------------------------------------------------------------------
--Question 02
SELECT Vehicle_ID,
    Vehicle_Model,
    vehicle_make
FROM vehicle
WHERE Vehicle_ID = (
        SELECT Vehicle_stock_vehicle_ID
        FROM vehicle_stock
        WHERE Vehicle_Stock_Retail_Price = (
                SELECT MAX(Vehicle_Stock_Retail_Price)
                FROM vehicle_stock
            )
    );
----------------------------------------------------------------------------------------------------
--Question 03
SELECT *
FROM contact
    INNER JOIN company_contact ON contact.Contact_ID = company_contact.Contact_ID
WHERE Contact_First_Name LIKE 'Jessica'
    AND Contact_Last_Name LIKE 'Rabbit';
----------------------------------------------------------------------------------------------------
--Question 04
SELECT sp.Supplier_Name,
    sp.Supplier_Street,
    dlr.Dealer_Name,
    dlr.Dealer_Town,
    pt.part_name
FROM supplier sp
    INNER JOIN part pt ON sp.supplier_ID = pt.Part_Supplier_ID
    INNER JOIN part_stock pts ON pt.Part_ID = pts.Part_Stock_Part_ID
    INNER JOIN dealer dlr ON pts.Part_Stock_Dealer_ID = dlr.Dealer_ID
WHERE dlr.Dealer_Town LIKE 'Kidd%'
GROUP BY sp.Supplier_Name;
-- 0.0022 seconds
----------------------------------------------------------------------------------------------------
--Question 05
SELECT concat(c.Contact_First_Name, ' ', c.Contact_Last_Name) AS fullName,
    v.Vehicle_Make,
    v.Vehicle_Model
FROM contact c
    INNER JOIN vehicle_owner vo ON c.Contact_ID = vo.Contact_ID
    INNER JOIN vehicle v ON vo.Vehicle_ID = v.Vehicle_ID
WHERE v.vehicle_make LIKE 'ford';
-- 0.0020 seconds
----------------------------------------------------------------------------------------------------
--Question 06
SELECT co.Company_Name,
    n.Note_Contact_Type
FROM company co
    INNER JOIN company_contact cc ON co.Company_ID = cc.Company_ID
    INNER JOIN contact c ON cc.Contact_ID = c.Contact_ID
    INNER JOIN note n ON c.Contact_ID = n.Note_Contact_ID
WHERE n.Note_Contact_Type like '%sale%';
-- 0.0021 seconds
----------------------------------------------------------------------------------------------------
-- Question 07
SELECT sp.supplier_ID,
    sp.Supplier_Name,
    sp.Supplier_Street
FROM supplier sp
WHERE sp.supplier_ID IN (
        SELECT pt.Part_supplier_ID
        FROM part pt
        WHERE pt.Part_ID IN (
                SELECT pts.Part_Stock_Part_ID
                FROM part_stock pts
                WHERE pts.Part_Stock_Dealer_ID IN (
                        SELECT dlr.Dealer_ID
                        FROM dealer dlr
                        WHERE dlr.Dealer_Town LIKE 'Kidd%'
                    )
            )
    );
-- 0.0021 seconds
----------------------------------------------------------------------------------------------------
--Question 08
SELECT concat(c.Contact_First_Name, ' ', c.Contact_Last_Name) AS fullName
FROM contact c
WHERE c.Contact_ID IN(
        SELECT vo.Contact_ID
        FROM vehicle_owner vo
        WHERE vo.vehicle_ID IN (
                SELECT v.Vehicle_ID
                FROM vehicle v
                WHERE v.Vehicle_Make LIKE 'ford'
            )
    );
-- 0.0018 seconds
----------------------------------------------------------------------------------------------------
--Question 09
SELECT co.Company_Name
FROM company co
WHERE co.Company_ID IN (
        SELECT cc.Company_ID
        FROM company_contact cc
        WHERE cc.Contact_ID IN (
                SELECT c.Contact_ID
                FROM contact c
                WHERE c.Contact_ID IN (
                        SELECT n.Note_Contact_ID
                        FROM note n
                        WHERE n.Note_Contact_Type like '%sale%'
                    )
            )
    );
--0.0024 seconds
----------------------------------------------------------------------------------------------------
--Question 10
SELECT co.company_Name AS Name,
    co.Company_Town AS Town
FROM company co
WHERE co.Company_Town like 'worc%'
UNION
SELECT sp.Supplier_Name,
    sp.Supplier_Town
FROM supplier sp
WHERE sp.Supplier_Town like 'worc%';
----------------------------------------------------------------------------------------------------
--Question 11
SELECT co.Company_Name AS Name,
    co.Company_Town AS Town
FROM company co
WHERE co.Company_Town NOT LIKE '%worcester%'
UNION
SELECT concat(c.Contact_First_Name, ' ', c.Contact_Last_Name) AS fullName,
    c.contact_town
FROM contact c
WHERE c.contact_town NOT LIKE '%worcester%'
ORDER BY Name;
----------------------------------------------------------------------------------------------------