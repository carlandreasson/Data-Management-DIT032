2.1.
This query finds user with ID 1 and retrieves the information about that person. 
SELECT* 
FROM DC_USER 
WHERE UserID =1;

2.2.
This query returns the ProcessID, Memory and CPU of all VM with memory greater than 250GB. 
SELECT ProcessID, Mem, CPU 
FROM VM 
WHERE Mem> 250;

2.3.
This query returns information about VM where the capacity is greater than 250GB and put them in order by serverID . 
SELECT* 
FROM VM 
WHERE Mem>250 ORDER BY serverID;

2.4.
This query returns the type of database and the average DiscSpace. 
SELECT COUNT(type), AVG (discspace) 
FROM DATABASE 
GROUP BY(type);

2.5.
This query presents memory, CPU from vm, database and server where the tuples matched on their serverID. 
SELECT *
FROM DC_USER, SERVER, DATA_CENTER
WHERE DATA_CENTER.UserID = DC_USER.UserID AND SERVER.name = DATA_CENTER.name

2.6.
This query shows how much capacity each server can handle
SELECT ServerID, DiscSpace as ServerCapacity
FROM Database
UNION
SELECT ServerID, Mem
FROM VM;
