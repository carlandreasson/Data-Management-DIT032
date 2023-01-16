Begin;

CREATE TABLE DC_USER (
UserID int NOT NULL,
is_referred_by int NOT NULL UNIQUE,
PRIMARY KEY (UserID),
FOREIGN KEY(is_referred_by) references DC_USER(UserID));

CREATE TABLE DATA_CENTER (
Name CHAR (20) NOT NULL,
UserId int NOT NULL,
Capacity int,
City CHAR (20) NOT NULL,
Street CHAR (20),
Number int,
CHECK (Capacity > 0 AND Capacity < 10001),
PRIMARY KEY (Name),
FOREIGN KEY(UserID) references DC_USER(UserID));

CREATE TABLE SERVER (
ServerID int NOT NULL,
ServerName CHAR (20) NOT NULL UNIQUE,
Name CHAR (20) NOT NULL,
Hardware_Model CHAR (30) NOT NULL,
PRIMARY KEY (ServerID),
FOREIGN KEY(Name) references DATA_CENTER(Name));

CREATE TABLE SERVER_PROCESS (
ProcessID int NOT NULL UNIQUE,
ServerID int NOT NULL,
PRIMARY KEY(ProcessID, ServerID),
FOREIGN KEY(ServerID) references SERVER(ServerID));

CREATE TABLE VM (
ProcessID int,
ServerID int NOT NULL,
UserID int NOT NULL,
Mem int NOT NULL,
CPU CHAR (30) NOT NULL,
PRIMARY KEY(ProcessID, ServerID),
FOREIGN KEY(ProcessID, ServerID) references SERVER_PROCESS(ProcessID, ServerID));

CREATE TABLE DATABASE (
ProcessID int NOT NULL,
ServerID int NOT NULL,
DiscSpace int NOT NULL,
Type CHAR (20) NOT NULL,
PRIMARY KEY(ProcessID, ServerID),
FOREIGN KEY(ProcessID, ServerID) references SERVER_PROCESS(ProcessID, ServerID));

CREATE TABLE IS_MAN_BY (
DataCenter CHAR (20) NOT NULL,
UserName int NOT NULL UNIQUE,
PRIMARY KEY(DataCenter),
FOREIGN KEY(DataCenter) references DATA_CENTER(Name),
FOREIGN KEY(UserName) references DC_USER(UserID));

CREATE TABLE ROLE (
RoleID int NOT NULL,
UserID int NOT NULL,
RoleName CHAR (20) NOT NULL,
UserName int NOT NULL UNIQUE,
PRIMARY KEY(RoleID, UserID),
FOREIGN KEY(UserName) references IS_MAN_BY(UserName));


Commit;



INSERT INTO dc_user(userID, is_referred_by) VALUES(1, 'Sherlock');
INSERT INTO dc_user(userID, is_referred_by) VALUES(2, 'Jeff');
INSERT INTO dc_user(userID, is_referred_by) VALUES(420, 'Snoop');

INSERT INTO DATA_CENTER(Name, UserID, Capacity, City, Street, Number) VALUES('Microsoft', 1, 5000, 'London', 'BakerStreet', 221);
INSERT INTO DATA_CENTER(Name, UserID, Capacity, City, Street, Number) VALUES('Amazon', 2, 10000, 'HOLLYWOOD', 'SunsetBoulevard', 1);
INSERT INTO DATA_CENTER(Name, UserID, Capacity, City, Street, Number) VALUES('ThePirateBay', 420, 2000, 'Stockholm', 'Kungsgatan', 1);

INSERT INTO SERVER(ServerID, ServerName, Name, Hardware_model) VALUES(111, 'HelloWorld', 'Microsoft', 'DTF69');
INSERT INTO SERVER(ServerID, ServerName, Name, Hardware_model) VALUES(333, 'GoodbyeWorld', 'Amazon', 'DP420');
INSERT INTO SERVER(ServerID, ServerName, Name, Hardware_model) VALUES(666, 'SupWorld', 'ThePirateBay', 'DAP101');

INSERT INTO SERVER_PROCESS(ProcessID, ServerID) VALUES(3, 111);
INSERT INTO SERVER_PROCESS(ProcessID, ServerID) VALUES(6, 333);
INSERT INTO SERVER_PROCESS(ProcessID, ServerID) VALUES(9, 666);

INSERT INTO VM(ProcessID, ServerID, UserID, Mem, CPU) VALUES(3, 111, 1, 250, 'i5');
INSERT INTO VM(ProcessID, ServerID, UserID, Mem, CPU) VALUES(6, 333, 2, 365, 'i7');
INSERT INTO VM(ProcessID, ServerID, UserID, Mem, CPU) VALUES(9, 666, 420, 500, 'i9');

INSERT INTO DATABASE(ProcessID, ServerID, Discspace, type) VALUES(3, 111, 100, 'CentralisedDB');
INSERT INTO DATABASE(ProcessID, ServerID, Discspace, type) VALUES(6, 333, 200, 'PersonalDB');
INSERT INTO DATABASE(ProcessID, ServerID, Discspace, type) VALUES(9, 666, 300, 'NoSQLDB');

INSERT INTO ROLE(RoleID, UserID, Rolename, Username) VALUES(1, 1, 'Admin', 'Sherlock');
INSERT INTO ROLE(RoleID, UserID, Rolename, Username) VALUES(2, 2, 'User', 'Jeff');
INSERT INTO ROLE(RoleID, UserID, Rolename, Username) VALUES(1, 420, 'Admin', 'Snoop');

INSERT INTO IS_MAN_BY(Datacenter, Username) VALUES('Microsoft', 'Sherlock');
INSERT INTO IS_MAN_BY(Datacenter, Username) VALUES('Amazon', 'Jeff');
INSERT INTO IS_MAN_BY(Datacenter, Username) VALUES('ThePirateBay', 'Snoop');
