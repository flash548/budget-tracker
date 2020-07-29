# budget-tracker
Full Stack Microservice project

# Description
This repo contains a React JS front-end, Spring back-end, and a mySQL DB that represents a "budget tracker"
for the React/Spring full stack group project.  This particular component will allow CRUD operations on a 
mySQL DB that will allow viewing, managing, creating a family's financial transactions over a given time period.

# Implementation
The implementation will be mock financial data into a mySQL DB which will then have a Spring Web layer on top of it
representing the API layer.  The API layer will provide the CRUDL endpoints via JSON requests/responses from the web frontend.
The web frontend will consist of a ReactJS SPA (bootstraped using create-react-app) using MaterialUI components. The endstate
will be all three of these layers containerized into a Docker service capable of running anywhere.

# Requirements
*Authentication will not be taken into account at this time*

* User shall be able to view financial transactions of the family (expenditures and deposits) over a selectable period of time.
* User shall be able to create new financial transactions that fit into a set number of categories.
* An entry shall consist of date (YYYY-MM-DD), Category, Amount ($$.$$), and optionally remarks.
* Default set of categories shall be:
    * Transportation
    * Food
    * Health
    * Tithe
    * Home
    * Utilities
    * Clothing
    * Recreation
    * Personal
    * Insurance
    * Savings
* User shall be able to add new categories
* User shall be able to specify each month's projected income (inbound cashflow)  to serve as a "target" to not exceeed for a months expenses
* User shall be able to specify their acceptable range of each months income percentage that should be alloted to a given category
    * e.g. 25 - 35% is OK (and expected) to go to HOME expenses for a given month.
* Each range's bounding percentages shall be displayed - as well as a "resolved" range - that is, the actual amount $$$.
* Each range shall list the actual percentage that category is at for the month
* Each range shall report itself as either GREEN (actual is below range), YELLOW (actual is between range), RED (actual is greater than range)
* The grand total for a given month (time period) shall be displayed
* The amount left over (not expended or committed) shall be displayed
* User shall be able to search over a given time period parametrically (by any combination of remarks, amount ranges, category) and be able to view those results.
* The results for this search shall be able to be viewed in the same view/summary as any other time period in order to see what the amounts were in each category etc in order to allow trends analysis.

# Mockup


![Image of Mock](https://github.com/flash548/budget-tracker/blob/master/mock.png)


# Entity Relationship Diagram

![Image of ERD](https://github.com/flash548/budget-tracker/blob/master/db/erd.png)


# API

The backend API consists of the following endpoints by-method:

## GET
* **/categories**

    * Lists all categories in the db

* **/income**

    * Returns the set income saved in the db (from the `settings` table)

* **/ranges**

    * Returns the user configured income/category ranges from the (`ranges`) table

## POST 
* **/transactions**
    * Returns all transactions matching requested criteria in POST body
    * Body format:
    ```
    {
        category: [ ..., ... ],
        fromAmount: X.yy,
        toAmount: X.yy,
        fromDate: YYYY-MM-DD,
        toDate: YYYY-MM-DD,
    }   
    ```
    * If any field is `null`, then that field is a "wildcard" (e.g. * for category would imply all categories, etc)
## PATCH

* **/categories/add/`category-name`**

    * Adds a new category, (API won't allow duplicate categories).  Returns new list of categories

* **/ranges/`category-name`/low-percent/high-percent**

    * Adds (or changes) the percentage range for a given category.  Returns new list of categories vs. ranges

* **/transactions/add**

    * Adds a transaction.  Request body has the following structure:
    
    ```
    {
        category: category-name,
        date: yyyy-MM-dd,
        amount: $.$$,
        remarks: ...
    }
    ```

## DELETE

* **/tranactions/remove/`transaction-id`**

    * Deletes a transaction from the db by its `transaction-id`

* **/categories/remove/`category-name`**

    * Deletes a category from the db and its associated range from the `ranges` table