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
    FOREIGN KEY (category) REFERENCES categories (id) ON DELETE CASCADE
);

-- Place to list transactions
create table transactions (
    id INTEGER PRIMARY KEY auto_increment,
    category INTEGER NOT NULL,
    date DATE NOT NULL,
    amount DECIMAL(8,2),
    remarks TEXT,
    FOREIGN KEY (category) REFERENCES categories (id) ON DELETE CASCADE
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
insert into ranges (category, low, high) values ((select id from categories where category = 'Recreation'), 7, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Personal'), 5, 10);
insert into ranges (category, low, high) values ((select id from categories where category = 'Insurance'), 10, 25);
insert into ranges (category, low, high) values ((select id from categories where category = 'Savings'), 10, 15);
