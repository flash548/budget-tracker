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
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-10-01',
                199.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2019-10-01',
                150.00,
                'Tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-10-01',
                133.00,
                'Wedding Personals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-01',
                6.76,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-01',
                8.00,
                'Wife lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-02',
                40.00,
                'Wife car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-02',
                9.00,
                'Mcdonalds breakfast');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-03',
                22.63,
                'Brixx');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-10-03',
                10.00,
                'Wife razor');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-03',
                12.09,
                'Breakfast');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-10-03',
                30.00,
                'Hotel Incidentals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-03',
                40.00,
                'Wife car - charlotte');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-03',
                12.36,
                'Moes - charlotte');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-03',
                72.00,
                'Wife car x 2');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-03',
                72.00,
                'Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-03',
                16.00,
                'chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-04',
                120.00,
                'Lowes Home Depot');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-05',
                8.00,
                'Wendys');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-09',
                69.00,
                'Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-10-10',
                15.00,
                'Haircut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-10',
                5.00,
                'Dowel Rod');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-10',
                27.00,
                'Monicals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-10',
                37.00,
                'Wife car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-10',
                8.00,
                'Jimmy Johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-10',
                1065.00,
                'Mortgage');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-10',
                10.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-15',
                7.78,
                'cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-15',
                6.79,
                'lunch drill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-15',
                53.00,
                'truck');\

INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-16',
                30.00,
                'Wifes grandparents');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-16',
                47.00,
                'Paint');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-16',
                5.79,
                'cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-16',
                7.79,
                'Subway');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-16',
                50.00,
                'Lowes Home Depot');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-16',
                25.00,
                'El Rodeo');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-20',
                40.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-10-20',
                57.61,
                'Wife grocery Saturday');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-20',
                10.00,
                'Screen from hardware store');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-10-20',
                10.00,
                'Beer for party');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-10-20',
                106.00,
                'Republic Trash -- initial and 3mos');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-20',
                70.00,
                'Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-20',
                13.00,
                'Car Wash Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-10-31',
                54.00,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-10-31',
                13.00,
                'Lowes -- Paint');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-10-31',
                700.00,
                'Truck Tires');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-02',
                38.00,
                'Wife car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-11-01',
                40.00,
                'Pizza Train / Dinner');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-03',
                65.00,
                'Truck Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-03',
                25.00,
                'Lunch + Friends Lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-03',
                47.00,
                'Wife Kroger + Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2019-11-03',
                205.00,
                'Tricare Monthly');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-04',
                215.00,
                'Beck Chimney');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-11-06',
                73.70,
                'Gymies Initial');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-11-06',
                107.00,
                'Wife hair');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-05',
                10.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-11-06',
                20.00,
                'Wife jcpenny');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-24',
                1065.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-11-05',
                5.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-11-15',
                19.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-11-07',
                200.00,
                'Verizon + Overage');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-07',
                5.38,
                'Monicals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-11-07',
                1.61,
                'Redbox');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-08',
                40.00,
                'Décor');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-10',
                4.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-11-08',
                40.00,
                'Dinner out with K');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-11-10',
                35.00,
                'Late Bill for Apt IPL Power');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-11',
                63.00,
                'Home depot');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-11',
                58.00,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-14',
                39.00,
                'Gas Car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-11-14',
                30.00,
                'Wife makeup');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-17',
                88.00,
                'Grocery');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-15',
                65.00,
                'Gas truck drill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-15',
                5.00,
                'mcdonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-15',
                44.00,
                'Miejer');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-14',
                74.00,
                'TJ MAXX');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-15',
                45.00,
                'Lowes Spray Paint & Bedroom paint');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-11-18',
                16.00,
                'Sick supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-21',
                65.00,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-23',
                178.00,
                'Power Bill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-11-23',
                100.00,
                'Target Card');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-11-23',
                56.00,
                'Internet x2 mos (Nov-Dec)');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-11-24',
                5.00,
                'BC');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-11-24',
                42.01,
                'Target Card');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-11-25',
                31.82,
                'Dinner Out');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-25',
                34.49,
                'Wife Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-11-26',
                16.00,
                'Mcdonalds and redbox');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-11-23',
                10.00,
                'Softener Salt');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-11-23',
                30.00,
                'Car windshield wipers');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-12-01',
                53.02,
                'C supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-01',
                55.03,
                'C Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-03',
                79.33,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-03',
                41.68,
                'Food');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-03',
                7.63,
                'C lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-12-01',
                7.48,
                'driveway salt');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-01',
                8.23,
                'date night');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-12-01',
                0.25,
                'movie');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Clothing'),
                '2019-12-08',
                31.57,
                'jacket');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-08',
                32.51,
                'H gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-08',
                265.32,
                'C BMV');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-08',
                5.86,
                'C mcdonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-08',
                5.69,
                'dinner out');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-08',
                58.38,
                'C Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-12-08',
                1.28,
                'Redbox');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-05',
                6.20,
                'C Flight Dinner');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-05',
                7.63,
                'C Lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-04',
                41.27,
                'H Supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-04',
                16.00,
                'C Haircut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-04',
                3.49,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-08',
                54.48,
                'Aldi');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-10',
                6.38,
                'C Flight Dinner');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-10',
                52.74,
                'C Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2009-12-11',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2009-12-11',
                1065.62,
                'mortgage');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2009-12-11',
                19.00,
                'Gymmies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2009-12-11',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2009-12-11',
                4.51,
                'C Beer');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-15',
                20.00,
                'Mother bears');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-14',
                17.73,
                'Izzy and Eddys');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-15',
                31.10,
                'Gas Car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-18',
                51.80,
                'Gas Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-12-18',
                89.72,
                'Stools, etc');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2019-12-15',
                58.15,
                'minute clinic');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-12-18',
                265.06,
                'Power Bill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-18',
                83.80,
                'Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-18',
                10.79,
                'Krogers');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-18',
                43.90,
                'Truck oil change/tires');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-18',
                16.35,
                'Chiptotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-16',
                6.38,
                'Subway -- flying');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-19',
                45.84,
                'Wife target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-19',
                26.02,
                'C wonder');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2019-12-20',
                4.02,
                'Caulk');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2019-12-20',
                100.00,
                'Wife Xmas and Date');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-20',
                15.00,
                'Onstar');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2019-12-22',
                34.99,
                'Internet');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2019-12-22',
                59.82,
                'Life ins');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-23',
                43.00,
                'H haircut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-27',
                36.36,
                'Gas Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2019-12-28',
                24.80,
                'Gas Car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2019-12-26',
                50.31,
                'Food');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-30',
                44.00,
                'Date night + parking');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2019-12-31',
                13.00,
                'Meijers for new years supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-01',
                30.33,
                'Out with Friends');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-04',
                23.66,
                'Car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-07',
                45.91,
                'Truck Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-07',
                6.38,
                'subway');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-06',
                6.20,
                'mcds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-09',
                18.26,
                'mcalisters');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-09',
                49.47,
                'gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-09',
                82.48,
                'aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-09',
                39.28,
                'Friends gift');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-09',
                55.60,
                'Target supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-01-09',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-01-09',
                1065.62,
                'mortgage');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-01-09',
                19.00,
                'Gymmies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-01-09',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-01-09',
                35.00,
                'Internet');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-15',
                8.50,
                'JJs work');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-09',
                8.50,
                'H chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-01-02',
                20.54,
                'R Bday');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-15',
                12.65,
                'M & B Mail target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-14',
                30.00,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-15',
                26.00,
                'Best Buy');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-01-16',
                23.00,
                'Movie');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-01-16',
                22.00,
                'Izkaya');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-16',
                7.85,
                'Sn sheak snak');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-18',
                13.00,
                'car wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-18',
                24.60,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-18',
                15.83,
                'aldi');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-19',
                13.00,
                'truck wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-01-19',
                307.00,
                'Target late supply');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-20',
                14.21,
                'Krogers');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-01-21',
                297.00,
                'Power Bill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-01-21',
                11.30,
                'Me Tricare Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-01-21',
                28.95,
                'Wife Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-22',
                47.29,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-22',
                7.95,
                'JJs');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-01-22',
                10.99,
                'Me haircut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Clothing'),
                '2020-01-22',
                21.20,
                'Target sweater');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-23',
                7.00,
                'subway fri night');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-24',
                2.19,
                'speedway coffee');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-24',
                5.35,
                'Wendys drill');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-29',
                37.95,
                'K dinner');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-27',
                42.90,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-26',
                5.81,
                'DQ');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-28',
                25.00,
                'Mex');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-01-30',
                27.96,
                'Monicals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-01-31',
                27.72,
                'Car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-01-31',
                73.76,
                'Trash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-02-02',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-02-02',
                1065.62,
                'mortgage-check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-02-02',
                19.00,
                'Gymmies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-02-02',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-02-02',
                35.00,
                'Internet check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-02',
                46.45,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-02-03',
                73.76,
                'Check 1024- Trash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-02',
                10.22,
                'Mcalisters');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-02',
                6.57,
                'Cracker Barrell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-01',
                25.00,
                'Sephora');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-06',
                26.23,
                'Gas car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-06',
                77.54,
                'Aldi');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-05',
                13.03,
                'taco bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-05',
                9.08,
                'cvs');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-02-05',
                19.25,
                'Hobby lobby');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-05',
                29.24,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-04',
                2.04,
                'mcdonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-08',
                54.01,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-08',
                2.04,
                'mcdonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-11',
                22.86,
                'EL camino');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-12',
                11.84,
                'Applebees');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-12',
                49.30,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-13',
                26.00,
                'Truck/car car wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-02-14',
                17.00,
                'Chases wrestling meet');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-16',
                12.00,
                'Chris-Hair cut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-16',
                25.89,
                'Ulta');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-16',
                22.27,
                'Food-Walmart');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-17',
                7.32,
                'Cicero Market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-17',
                42.61,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-15',
                76.00,
                'Andy Mohr serive');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-19',
                11.94,
                'Dominos');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-19',
                26.00,
                'Car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-20',
                37.98,
                'Red robin');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-20',
                110.00,
                'Food');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-23',
                50.00,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-23',
                4.08,
                'McFlurrys');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-02-25',
                222.20,
                'Duke');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-24',
                7.72,
                'Wendys');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-24',
                29.14,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-24',
                8.50,
                'Chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-24',
                5.00,
                'Pizza Wife');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-26',
                10.81,
                'jimmy johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-02-27',
                51.55,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-02-27',
                37.98,
                'Date night');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-02-25',
                10.70,
                'Wife');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Clothing'),
                '2020-02-27',
                72.00,
                'Wife Clothing date');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-03-03',
                11.30,
                'Me Tricare Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-03-03',
                28.95,
                'Wife Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-03-03',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-03-03',
                1065.62,
                'check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-03-03',
                19.00,
                'Gymmies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-03-03',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-03-03',
                35.00,
                'frontier check 1036');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-03',
                15.02,
                'jimmy johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-03-03',
                11.00,
                'meet');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-05',
                50.00,
                'gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-06',
                105.18,
                'groceries');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-03-05',
                19.25,
                'Hobby Lobby Pillow');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-03',
                27.28,
                'gas car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-05',
                28.95,
                'Sister bday gift');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-05',
                17.41,
                'Dave and Busters');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-04',
                5.53,
                'Wendys flght cxl');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-06',
                6.33,
                'Subway');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-07',
                11.80,
                'Mexican - lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-11',
                29.81,
                'el camino');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-11',
                12.83,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-08',
                25.37,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-08',
                13.00,
                'truck car wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-08',
                50.01,
                'truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-09',
                4.27,
                'Container store');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-03-13',
                55.00,
                'Wife Eye appt fee');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-13',
                16.00,
                'Me hair cut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-03-13',
                35.00,
                'Ace hardware');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-03-13',
                4.00,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-03-13',
                1.29,
                'Redbox');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-11',
                45.00,
                'Truck oil change + tires');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-03-14',
                145.00,
                'AAA exterminator');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-15',
                16.19,
                'Dominos Mom/Dad');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-16',
                25.78,
                'Sunrise café');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-16',
                45.87,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-16',
                3.50,
                'speedway chocolate');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-18',
                4.08,
                'mcflurries');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-03-20',
                299.49,
                'duke check 1034');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-03-20',
                94.58,
                'check 1035');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-20',
                26.50,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-20',
                51.45,
                'truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-20',
                16.35,
                'Chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-19',
                33.00,
                'Wife Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-21',
                21.78,
                'Moms bday');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-11',
                26.91,
                'Wife Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-25',
                50.53,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-25',
                2.68,
                'Cokes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-25',
                14.40,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-03-24',
                31.50,
                'Sephora');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-23',
                51.27,
                'Walmart groceries');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-23',
                48.57,
                'Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-26',
                5.00,
                'McFlurry + Redbox');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-29',
                30.00,
                'El camino');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-30',
                14.00,
                'Taco bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-03-30',
                7.00,
                'Starbucks');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-03-30',
                91.00,
                'Andy mohr car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-04-01',
                11.30,
                'Me Tricare Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-04-01',
                28.95,
                'Wife Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-04-01',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-04-01',
                1065.62,
                'check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-04-01',
                19.00,
                'Gymmies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-04-01',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-04-01',
                35.00,
                'frontier check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-01',
                50.13,
                'gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-02',
                5.75,
                'cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-03',
                65.65,
                'Food');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-03',
                23.29,
                'Mexican');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Tithe'),
                '2020-04-05',
                200.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-04',
                8.80,
                'Cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-05',
                16.19,
                'pizza');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-05',
                16.00,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-09',
                51.00,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-11',
                67.34,
                'Izakaya Extravanganza');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-07',
                8.16,
                'Taco');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-07',
                52.43,
                'Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-08',
                3.76,
                'Starbucks');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-04',
                9.46,
                'paradise');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-04',
                29.00,
                'Car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-11',
                14.13,
                'McDonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-11',
                41.73,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-11',
                10.89,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-11',
                14.74,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-04-12',
                12.49,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-13',
                10.97,
                'Cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-16',
                26.68,
                'Monicals');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-16',
                57.90,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-17',
                9.44,
                'Taco Bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-04-17',
                47.88,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-18',
                37.15,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-04-18',
                41.11,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-18',
                33.01,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-15',
                12.13,
                'Wife mex');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-18',
                46.99,
                'Aldi grocery');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Tithe'),
                '2020-04-19',
                200.00,
                '');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-04-20',
                15.21,
                'CVS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-04-20',
                149.00,
                'Power bill-check 1045');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-22',
                30.46,
                'cvs Wife');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Tithe'),
                '2020-04-22',
                35.00,
                'st. jude-check 1047');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-23',
                6.58,
                'cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-23',
                13.00,
                'Me haircut');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-23',
                60.94,
                'Me gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-04-24',
                35.32,
                'mellow mushroom');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-04-25',
                28.75,
                'Wife gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-04-25',
                4.37,
                'starbucks');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-04-25',
                6.29,
                'mcdonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-26',
                26.24,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-04-26',
                55.69,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-04-30',
                39.66,
                'Uptown');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-03',
                11.00,
                'Chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-05-03',
                71.03,
                'Republic Trash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-04',
                68.48,
                'Supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-05',
                28.00,
                'Eating out');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-05',
                56.86,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-06',
                233.10,
                'Home Depot');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-06',
                12.00,
                'Auto Zone K&N');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-06',
                38.00,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-07',
                59.76,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-08',
                14.31,
                'Dad Lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-08',
                48.11,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-08',
                5.31,
                'Lawnmower Gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-08',
                19.55,
                'Funnel / STP');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-08',
                60.77,
                'Starbucks gift cards');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-08',
                50.00,
                'Wife car fix');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-10',
                15.00,
                'Dominos');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-10',
                36.63,
                'CVS/Minute Clinic');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-13',
                8.00,
                'Jimmy johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-14',
                107.00,
                'Target groceries');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-14',
                20.96,
                'El Caminos');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-14',
                32.40,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-16',
                5.99,
                'Cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-16',
                59.37,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-17',
                11.00,
                'Taco bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Tithe'),
                '2020-05-17',
                148.00,
                'Tithe');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-20',
                59.19,
                'Gas Truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-21',
                203.30,
                'Gravel');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-21',
                13.00,
                'Truch wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-22',
                17.23,
                'Cicero Market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-22',
                150.00,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-23',
                17.55,
                'Chiptole');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-24',
                16.76,
                'Eating out');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-24',
                28.02,
                'Home Depot');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-24',
                200.00,
                'Edinburgh outlets');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-25',
                14.81,
                'rosies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-26',
                47.96,
                'Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-26',
                12.00,
                'Haircu');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-26',
                50.00,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-27',
                6.32,
                'panda express');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-28',
                11.94,
                'Aldis pineapple juice');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-05-28',
                5.38,
                'Cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-28',
                43.31,
                'Lowes Security light');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-28',
                35.26,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-05-01',
                19.00,
                'Gym');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-01',
                1065.62,
                'check');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-05-01',
                11.30,
                'Me Tricare Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-05-01',
                28.95,
                'Wife Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-05-01',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-05-01',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-05-01',
                35.00,
                'frontier check 1049');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-25',
                167.00,
                'More gravel');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-05-29',
                6.94,
                'paper');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-05-31',
                16.00,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-05-31',
                65.84,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-06-01',
                11.30,
                'Tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-06-01',
                28.95,
                'Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-06-01',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-06-01',
                1065.62,
                'check 1109');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-06-01',
                19.00,
                'Gym');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-06-01',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-06-01',
                35.00,
                'frontier check 1110');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-01',
                8.90,
                'Walmart Food');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-01',
                42.58,
                'Truck oil change/tires');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-02',
                20.00,
                'Mcalisters');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-02',
                23.43,
                'Aldis');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-03',
                38.00,
                'CVS AT prep');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-04',
                16.00,
                'Jimmy Johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-04',
                3.23,
                'breadsticks');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-05',
                36.25,
                'Wife gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-05',
                97.26,
                'Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-06-06',
                22.81,
                'Salt-lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-09',
                3.23,
                'breadsticks');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Clothing'),
                '2020-06-10',
                65.26,
                'VS');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-10',
                69.02,
                'Supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-18',
                13.00,
                'steak n shake');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-05',
                5.98,
                'Wife taco bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-13',
                90.21,
                'Wife CVS/wedding gift');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-19',
                13.24,
                'jimmy johns');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-20',
                11.94,
                'chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-21',
                32.00,
                'car wash fathers day');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-21',
                65.00,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-21',
                14.00,
                'Noodles and company');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-10',
                7.09,
                'chipotle');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-24',
                3.23,
                'Wife');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-20',
                57.13,
                'Aldi groceries');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-18',
                8.92,
                'Wife noodles/co');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-17',
                40.16,
                'Gas car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-10',
                29.96,
                'Wife J crew');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-16',
                7.51,
                'Wife chick fil a');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-24',
                62.00,
                'Date Night');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-24',
                64.00,
                'father day kohls');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-06-24',
                82.50,
                'Duke energy');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-06-21',
                85.00,
                'AAA Exterminators');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-06-25',
                63.05,
                'Me Ins.');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-06-25',
                82.80,
                'Duke Energy check1111');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Recreation'),
                '2020-06-25',
                41.50,
                'Baby shower gifts');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-26',
                25.00,
                'Pizza');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-28',
                37.45,
                'Wife car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-06-28',
                134.00,
                'Birthday order');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-29',
                16.00,
                'Noodles and company');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-29',
                13.75,
                'Walmart');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-06-29',
                4.68,
                'Panera Bread');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-06-29',
                63.05,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-07-01',
                11.30,
                'Tricare Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-07-01',
                28.95,
                'Wife Dental');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Insurance'),
                '2020-07-01',
                204.56,
                'tricare');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-07-01',
                1065.62,
                'check 1109');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Health'),
                '2020-07-01',
                19.00,
                'Gym');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-07-01',
                150.00,
                'Verizon');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Utilities'),
                '2020-07-01',
                35.00,
                'frontier check 1110');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-01',
                12.19,
                'taco bell');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-01',
                120.00,
                'Groceris');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-01',
                4.79,
                'Arby lunch');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-01',
                16.04,
                'Frys');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-02',
                7.32,
                'McDonalds');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-02',
                13.00,
                'Truck wash');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-02',
                25.52,
                'Meijers - chair');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-07-02',
                62.34,
                'Lowes');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-07',
                70.44,
                'Wife Target');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-07',
                7.20,
                'Cicero market');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-07-07',
                63.22,
                'Truck gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-08',
                20.93,
                'EL Camino');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-08',
                106.00,
                'Baby shower gifts');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-08',
                41.47,
                'Anthropologie');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-05',
                24.57,
                'Supplies');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-09',
                18.00,
                'Jimmy Johns + Dq');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-07-03',
                449.00,
                'Wife car');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-10',
                25.00,
                'Brixx pizza');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-07-11',
                37.88,
                'car gas');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-11',
                32.00,
                'Dave bday gift');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Transportation'),
                '2020-07-15',
                60.22,
                'Gas truck');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Personal'),
                '2020-07-15',
                50.00,
                'aby shower');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-14',
                7.86,
                'Walmart');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Food'),
                '2020-07-13',
                18.38,
                'McAlisters');
INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = 'Home'),
                '2020-07-17',
                179.00,
                'HVAC visit');
