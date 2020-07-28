-- This seeds the initial mySQL db 'budget'
-- It has four tables - settings, categories, ranges, transactions

-- clear out the db tables if they exist to start fresh...
drop table if exists settings;
drop table if exists transactions;
drop table if exists ranges;
drop table if exists categories;

-- settings table holds a single row - the project income for the month
create table settings (
    id INTEGER PRIMARY KEY auto_increment,
    income DECIMAL(8,2)
);

-- maps categories to identifiers
create table categories (
    id INTEGER PRIMARY KEY auto_increment,
    category TEXT

);

-- Place to specify low-high percent ranges
create table ranges (
    id INTEGER PRIMARY KEY auto_increment,
    category INTEGER NOT NULL,
    low FLOAT NOT NULL,
    high FLOAT NOT NULL,
    FOREIGN KEY (category) REFERENCES categories (id)
);

-- Place to list transactions
create table transactions (
    id INTEGER PRIMARY KEY auto_increment,
    category INTEGER NOT NULL,
    date DATE NOT NULL,
    amount DECIMAL(8,2),
    remarks TEXT,
    FOREIGN KEY (category) REFERENCES categories (id)
);

-- seed initial household income to some number
insert into settings (income) values (60000.00);

-- Seed initial category types
insert into categories (category) values ('Transportation');
insert into categories (category) values ('Food');
insert into categories (category) values ('Health');
insert into categories (category) values ('Tithe');
insert into categories (category) values ('Home');
insert into categories (category) values ('Utilities');
insert into categories (category) values ('Clothing');
insert into categories (category) values ('Recreation');
insert into categories (category) values ('Personal');
insert into categories (category) values ('Insurance');
insert into categories (category) values ('Savings');
insert into categories (category) values ('Income');

-- Seed initial categorie ranges for a given month
insert into ranges (category, low, high) values ((select id from categories where category = 'Transportation'), 10, 15);
insert into ranges (category, low, high) values ((select id from categories where category = 'Food'), 5, 15);
insert into ranges (category, low, high) values ((select id from categories where category = 'Health'), 5, 15);
insert into ranges (category, low, high) values ((select id from categories where category = 'Tithe'), 10, 15);
insert into ranges (category, low, high) values ((select id from categories where category = 'Home'), 25, 30);
insert into ranges (category, low, high) values ((select id from categories where category = 'Utilities'), 5, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Clothing'), 5, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Recreation'), 7, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Personal'), 5, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Insurance'), 10, 25);
insert into ranges (category, low, high) values ((select id from categories where category = 'Savings'), 10, 15);

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-03',
        11.00,
        'Chipotle');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-05-03',
        71.03,
        'Republic Trash check 1050');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-04',
        68.48,
        'Supplies');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-05',
        28.00,
        'Eating out');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-05',
        56.86,
        'Target');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-06',
        233.10,
        'Home Depot');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-06',
        12.00,
        'Auto Zone K&N');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-06',
        38.00,
        'car gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-07',
        59.76,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-08',
        14.31,
        'Dad Lunch');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-08',
        48.11,
        'Lowes');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-08',
        5.31,
        'Lawnmower Gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-08',
        19.55,
        'Funnel / STP');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-08',
        60.77,
        'Starbucks gift cards');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-08',
        50.00,
        'Heather car fix');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-10',
        15.00,
        'Dominos');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-10',
        36.63,
        'CVS/Minute Clinic');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-13',
        8.00,
        'Jimmy johns');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-14',
        107.00,
        'Target groceries');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-14',
        20.96,
        'El Caminos');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-14',
        32.40,
        'car gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-16',
        5.99,
        'Cicero market');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-16',
        59.37,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-17',
        11.00,
        'Taco bell');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Tithe'),
        '2015-05-17',
        148.00,
        'Tithe');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-20',
        59.19,
        'Gas Truck');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-21',
        203.30,
        'Gravel');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-21',
        13.00,
        'Truch wash');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-22',
        17.23,
        'Cicero Market');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-22',
        150.00,
        'Lowes');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-23',
        17.55,
        'Chiptole');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-24',
        16.76,
        'Eating out');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-24',
        28.02,
        'Home Depot');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-24',
        200.00,
        'Edinburgh outlets');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-25',
        14.81,
        'rosies');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-26',
        47.96,
        'Aldis');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-26',
        12.00,
        'Haircu');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-26',
        50.00,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-27',
        6.32,
        'panda express');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-28',
        11.94,
        'Aldis pineapple juice');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-05-28',
        5.38,
        'Cicero market');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-28',
        43.31,
        'Lowes Security light');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-28',
        35.26,
        'car gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Health'),
        '2015-05-01',
        19.00,
        'Gym');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-01',
        1065.62,
        'check');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-05-01',
        11.30,
        'Chris Tricare Dental');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-05-01',
        28.95,
        'Heather Dental');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-05-01',
        204.56,
        'tricare');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-05-01',
        150.00,
        'Verizon');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-05-01',
        35.00,
        'frontier check 1049');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-25',
        167.00,
        'More gravel');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-05-29',
        6.94,
        'paper');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-05-31',
        16.00,
        'Lowes');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-05-31',
        65.84,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-06-01',
        11.30,
        'Tricare');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-06-01',
        28.95,
        'Dental');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-06-01',
        204.56,
        'tricare');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-06-01',
        1065.62,
        'check 1109');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Health'),
        '2015-06-01',
        19.00,
        'Gym');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-06-01',
        150.00,
        'Verizon');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-06-01',
        35.00,
        'frontier check 1110');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-01',
        8.90,
        'Walmart food');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-01',
        42.58,
        'Truck oil change/tires');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-02',
        20.00,
        'Mcalisters');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-02',
        23.43,
        'Aldis');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-03',
        38.00,
        'CVS AT prep');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-04',
        16.00,
        'Jimmy Johns');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-04',
        3.23,
        'breadsticks');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-05',
        36.25,
        'heather gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-05',
        97.26,
        'Target');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-06-06',
        22.81,
        'Salt-lowes');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-09',
        3.23,
        'breadsticks');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'clothing'),
        '2015-06-10',
        65.26,
        'VS');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-10',
        69.02,
        'Supplies');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-18',
        13.00,
        'steak n shake');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-05',
        5.98,
        'Heather taco bell');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-13',
        90.21,
        'Heather CVS/wedding gift');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-19',
        13.24,
        'jimmy johns');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-20',
        11.94,
        'chipotle');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-21',
        32.00,
        'car wash fathers day');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-21',
        65.00,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-21',
        14.00,
        'Noodles and company');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-10',
        7.09,
        'chipotle');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-24',
        3.23,
        'Heather');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-20',
        57.13,
        'Aldi groceries');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-18',
        8.92,
        'Heather noodles/co');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-17',
        40.16,
        'Gas car');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-10',
        29.96,
        'Heather J crew');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-16',
        7.51,
        'Heather chick fil a');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-24',
        62.00,
        'Date Night');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-24',
        64.00,
        'father day kohls');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-06-24',
        82.50,
        'Duke energy');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-06-21',
        85.00,
        'AAA Exterminators');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-06-25',
        63.05,
        'Chris Ins.');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-06-25',
        82.80,
        'Duke Energy check1111');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Recreation'),
        '2015-06-25',
        41.50,
        'Baby shower gifts');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-26',
        25.00,
        'Pizza');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-28',
        37.45,
        'Heather car gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-06-28',
        134.00,
        'Birthday order');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-29',
        16.00,
        'Noodles and company');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-29',
        13.75,
        'Walmart');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-06-29',
        4.68,
        'Panera Bread');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-06-29',
        63.05,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-07-01',
        11.30,
        'Tricare Dental');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-07-01',
        28.95,
        'Heather Dental');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Insurance'),
        '2015-07-01',
        204.56,
        'tricare');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-07-01',
        1065.62,
        'check 1109');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Health'),
        '2015-07-01',
        19.00,
        'Gym');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-07-01',
        150.00,
        'Verizon');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Utilities'),
        '2015-07-01',
        35.00,
        'frontier check 1110');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-01',
        12.19,
        'taco bell');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-01',
        120.00,
        'Groceris');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-01',
        4.79,
        'Arby lunch');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-01',
        16.04,
        'Frys');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-02',
        7.32,
        'McDonalds');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-02',
        13.00,
        'Truck wash');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-02',
        25.52,
        'Meijers - chair');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-07-02',
        62.34,
        'Lowes');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-07',
        70.44,
        'Heather Target');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-07',
        7.20,
        'Cicero market');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-07-07',
        63.22,
        'Truck gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-08',
        20.93,
        'EL Camino');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-08',
        106.00,
        'Baby shower gifts');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-08',
        41.47,
        'Anthropologie');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-05',
        24.57,
        'Supplies');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-09',
        18.00,
        'Jimmy Johns + Dq');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-07-03',
        449.00,
        'Heather car');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-10',
        25.00,
        'Brixx pizza');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-07-11',
        37.88,
        'car gas');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-11',
        32.00,
        'Dave bday gift');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Transportation'),
        '2015-07-15',
        60.22,
        'Gas truck');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Personal'),
        '2015-07-15',
        50.00,
        'aby shower');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-14',
        7.86,
        'Walmart');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Food'),
        '2015-07-13',
        18.38,
        'McAlisters');

INSERT INTO transactions (category, date, amount, remarks) 
    VALUES (
        (SELECT id FROM categories WHERE category = 'Home'),
        '2015-07-17',
        179.00,
        'HVAC visit');

