### This is the seeds directory READ ME

 On this directory any start database or complementary files will be stored, 
for this project the Date dimension needs a day key to organize orders, as well 
as the corresponding schema.

 Also as a seed, order_cycles files is a complement of order as it initializes
the orders as already done, so complete is "1" and incomplete is "0", as
a test rule we can state that reference month is last shipment month for that
order (if any avaiable, seems like it is not registered separated from the
first order cycle), if shipment was processed on day 27 or earlier, or next 
month if shipment date is 28 or later, if order was incomplete, reference
month should be null.

 A bettrer way to design this is with another SCD2 for "order status" with at 
last states "ordered", "shipped", "paid", "refered", "special" as follows:
"ordered" for orders already made but without shipping needs and not paid yet.
"shipped" for orders already made and shipped, but not paid yet.
"paid" for orders of any kind already paid.
"refered" for paid orders already with a reference month.
"special" for reinbursements, order loss, warranty reversal, etc...
 But for this a better order date control is needed.

This is a date dimension replica of https://github.com/jpseverance/DateAndTimeDimensionBuilders/blob/master/csvfiles/dimdate1850-2015.csv
From march 2023