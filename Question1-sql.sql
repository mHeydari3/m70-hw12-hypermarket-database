CREATE DATABASE hypermarket;
CREATE TABLE `hypermarket`.`employees_tbl` ( 
    
    `id` INT NOT NULL AUTO_INCREMENT ,
    `employeescode` INT NOT NULL , 
    `name` VARCHAR(80) NOT NULL , 
    `family` VARCHAR(120) NOT NULL , 
    `salary` FLOAT NOT NULL , 
    `officeid` INT NOT NULL , 
    PRIMARY KEY (`id`)
    
    ) ENGINE = InnoDB;


CREATE TABLE `hypermarket`.`offices_tbl` ( 
    `id` INT NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(255) NOT NULL , 
    `descunittasks` TEXT NOT NULL , 
    `branchid` INT NOT NULL , 
    PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;


CREATE TABLE `hypermarket`.`branches_tbl` ( 
    `id` INT NOT NULL AUTO_INCREMENT ,
    `name` VARCHAR(255) NOT NULL , 
    `foundationdate` DATE NOT NULL , 
    `city` VARCHAR(255) NOT NULL , 
    PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;

INSERT INTO `branches_tbl` (`id`, `name`, `foundationdate`, `city`) 
    VALUES 
    (NULL, 'Hypermarket Shahrake Qarb', '2020-07-10', 'Tehran'), 
    (NULL, 'Hypermarket Naghshjahan- Isfahan', '2018-08-24', 'Isfahan');


INSERT INTO `offices_tbl` (`id`, `name`, `descunittasks`, `branchid`) 
    VALUES 
    (NULL, 'Financial Office', 'doing financial tasks every month', '1'), 
    (NULL, 'Human Resource', 'Handling human resources perfectly', '1');

INSERT INTO `offices_tbl` (`id`, `name`, `descunittasks`, `branchid`) 
    VALUES 
    (NULL, 'Learning Office', 'Handle stuffes like teaching and graduating inside organize courses.', '1'),
    (NULL, 'Network section', 'Networking computers and buildings inside branch', '1');


INSERT INTO `offices_tbl` (`id`, `name`, `descunittasks`, `branchid`) 
    VALUES 
    (NULL, 'Sale department', 'Making sales and handling customers', '1'),
    (NULL, 'Accounting Office', 'The office to do accounting related to sales and suppliers', '1');


INSERT INTO `employees_tbl` (`id`, `employeescode`, `name`, `family`, `salary`, `officeid`) 
    VALUES 
    (NULL, '1111', 'Mohmmad', 'Heydari', '6200', '1'), 
    (NULL, '1112', 'Majid', 'Amini', '3500', '1'), 
    (NULL, '1113', 'Hasan', 'Mehrabadi', '500', '1'), 
    (NULL, '1114', 'Seyed Hossein', 'Barzegari', '740', '1'), 
    (NULL, '1115', 'Reyhane', 'Hosseini', '1200', '1');

INSERT INTO `employees_tbl` (`id`, `employeescode`, `name`, `family`, `salary`, `officeid`) 
    VALUES 
    (NULL, '1116', 'Asghar', 'Shiravani', '6200', '0'), 
    (NULL, '1117', 'Mohsen', 'Fouladi', '3500', '0'), 
    (NULL, '1118', 'Amir', 'Tabrizi', '500', '0'), 
    (NULL, '1119', 'Naser', 'Yazdi', '740', '0'), 
    (NULL, '1120', 'Reza', 'Yousefi', '1200', '0');

SELECT name, family FROM employees_tbl WHERE salary < 1000

SELECT name, family , offices_tbl.name FROM employees_tbl 
JOIN offices_tbl ON offices_tbl.id  = officeid

SELECT AVG(salary) FROM employees_tbl 
JOIN offices_tbl ON offices_tbl.id  = employees_tbl.officeid
GROUP BY offices_tbl.id;

SELECT offices_tbl.name FROM offices_tbl 
JOIN branches_tbl ON branches_tbl.city LIKE '%Isfahan%';

SELECT branches_tbl.name COUNT(branches_tbl.name) FROM branches 
JOIN offices_tbl ON offices_tbl.branchid = branches_tbl.id

SELECT employees_tbl.name , offices_tbl.name FROM employees_tbl
JOIN offices_tbl ON employees.officeid = offices_tbl.officeid

SELECT AVG(employees_tbl.salary) FROM employees_tbl
JOIN offices_tbl ON offices_tbl.branchid = branches_tbl.id
WHERE employees_tbl.officeid = offices_tbl.officeid AND branches_tbl.city LIKE '%Isfahan%'


