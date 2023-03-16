#This is a sandbox project, with superstore theme, for testing and learning

## VERSION 2.4.2

 ISSUES:

- SCD2 for location and date not suported (suposed not to change), need to fix
timestamps as in other SCD2 if this should be able to change.

- "Date" table still does not use the correct granularity as on early versions, 
could run for unique dates, or use an YEARMODA format transformation to generate a 
key, or build an external source with date key names and other info as a calendar
and converted YEARMODA for key.

- The fact table for order got source placed on "norm" schema with o relationships, 
even it "Orders" was not in NF, still tracking why "original" schema could not 
be reached by DBT.

- Normalized table city_id and name seems to use some external source, or have
serial IDs from a combination of other location variables for its key.

- Order data from "original" source for testing, they have maximum granularity (order
rows, not orders), it could be reconstructed from normalized schema as other dimensions,
but any normalization transformation may impact on norm->DW, and that could not be 
tracked without a original->DW.

## The general model

 This project deals only with order related granularity tables on a superstore 
model, like other learning material on the superstore scenario, using 
synthetic data with some error injections for testing.

 The data sources came from 3 tables, the main one is named “orders”, but it is 
not a order table as the name infers, since they have a fine granularity, each 
line represents an “order row”, so, for each group of products (their quantity 
may vary) that is present in a single order, a order row is generated, as a 
sample: If someone buy 2 tables and 4 chairs on the same order, it will probably 
generate 2 order rows for tables and chairs, if all tables and chairs are 
exactly the same.

 The order table on the source have an “order ID” that refers to the same order, 
the unique main key for the order source table is named “row” and it is a serial 
integer. Other information on this table is dates and shipment information, 
customer information, geographic information, product information and financial 
data.

 There are also 2 other complementary source tables, with no relationship with 
each other, the “people” table have information about the names of salesperson 
related to “region” variable on the geographic information present on the order 
table, but nothing more (no keys or complements), and the “returns” table with 
information about orders that have returned, with a single state variable 
“returned” to check when the order already returned (all of then is “Yes”) and an 
order ID that is the same as in “orders” table, but this table also have no keys 
or other information, the same order can be “returned” more than once.

 In addition to this data, there is a normalized database (on PostgreSQL) with 
seems to be in 3rd normal form, and is supposed to be used on the superstore 
operations.

 The idea of this exercise is to use DBT to implement a full DW solution (except 
for orchestration beyond snapshots) that organize the data to be consumed for a 
general data science team, for time constraints, some of the tools may be in 
deliverable condition.

## The solution

 To address this project objective, 3 different proposals will be proposed, but 
only the first one will be implemented beyond direct database tests, this one is 
supposed to be fully implemented using DBT tools, only using the PostgreSQL 
environment to load the source data and configure the credentials.

 The first solution is a direct DW answer using fact and dimension model where the 
“orders” are one fact table and some of the other information are dimension tables 
related to the first one, for this design we will address only “customer”, 
“location" and may be “date” dimensions, since all other potential dimensions could 
be completed with better data sources (like an order status dimension, with only full 
returned status available, data from “people” table since there is the same granularity 
as “region” which is part of geography , or any potential “product” or “logistics” 
tables for stock control and the like).

 The second solution is complex, as it focus in the date dimension, with financial 
focus, the idea is to have a maximal granularity dimension (day granularity) and a 
monthly balance granularity, and create a “reference month” granularity where all 
financial data with a “reference month” not null is already consolidated in the 
superstore finance for a given month, and any correction that may occur (like refunds 
or month-long return states) must be placed on subsequent months as new entries.

 The third solution is called “The One Table”, and it simply feed a BigQuery with 
“orders” source table for order row granularity with special care for other granularity 
defining potential variables (all dimensions) that can be used by a data team to build 
direct queries, some table partitions may be designed for performance, the idea of this 
approach is that it keeps its replications as it is not normalized at all, but on other 
hand, it can benefit with parallel processing, since there is no sequential dependency 
on this model, and data teams could materialize aggregations on the run as it is needed.

## The first solution

 On the first solution, 4 models will be created, the main one is the order model that 
builds a fact table for orders, the other 3 are dimensions: customer, location and date 
models, as those could be potential aggregators for orders.

 The employee dimension that is used to test the model will be kept on the DW level, but 
it could be replicated on location dimension using region as a proxy, for the SCD2 data 
of employee, the “date” dimension on “orders” table and all other aggregations by time, 
could not represent the intent of a specific employee granularity, since the dates on 
employee table are effective immediately, and on order table this is not true. Thais is 
one argument for the second solution that focuses on “date” dimension, because by using 
a “month of reference” granularity it is supposed that the majority of the delay on the 
order-to-profit chain will be addressed, this is because we have, for orders, only 
“order date” and “ship date” at day granularity, and a returned flag without a date, which 
is supposed to came from a new “order date” for each “returned” entry under the same 
order ID, if the order was not cancelled, lost or refunded, if that is even a possibility.

### Resources – dbt help:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
