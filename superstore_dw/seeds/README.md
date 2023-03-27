### This is the seeds directory READ ME

 On this directory any start database or complementary files will be stored, 
for this project the Date dimension needs a day key to organize orders, as well 
as the corresponding schema.

 Also as a seed, order_cycles.csv is a complement of order as it initializes
the orders as already refered, so complete, as "1" and incomplete as "0", as
a test rule we can state that reference month is last shipment month for that
order (if any avaiable, seems like it is not registered separated from the
first order cycle) if shipment was processed on day 19 or earlier, or next 
month if shipment date is 20 or later, if order was incomplete, reference
mont should be null.

This is a date dimension replica of https://github.com/jpseverance/DateAndTimeDimensionBuilders/blob/master/csvfiles/dimdate1850-2015.csv
From march 2023