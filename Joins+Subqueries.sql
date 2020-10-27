--Question 01
SELECT part_name,
    part_unit_cost
FROM part
GROUP BY part_name
HAVING AVG(Part_unit_cost) > (
        SELECT AVG(Part_unit_cost)
        FROM part
    );
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
--Question 03
SELECT *
FROM contact
    INNER JOIN company_contact ON contact.Contact_ID = company_contact.Contact_ID
WHERE Contact_First_Name LIKE 'Jessica'
    AND Contact_Last_Name LIKE 'Rabbit';
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
WHERE dlr.Dealer_Town LIKE 'Kidderminster';