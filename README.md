### This is a simple sandbox for learning dbt tools and some other cool stuff
This README file explains some configuration changes step by step. For version 1 there 
will be only configuration and testing iussues, for version 2 the basic integration with
the database and models are tested, on version 3 a complete solution proposed on class will
be used and modified for the same purpose.

On v3.0.1 the changes are:
- Complete model to be used, some names were changed for cenvention (i.e. location to geography)
- This version is set to replicate the environment, run the tests, and check the results.
- Some documentations was added and files replaced, but no model, snapshot, or database 
changes.
- There is a staging directory for transformations, as well as a seeds directory for external
data and complements, so any context change can be isolated and  controlled.

On v3.0.2 the changes are:
- Orders (source) changed to add a new column named referenceYEARMO an an integer, if null the
order still did not complete a payment, as the order is still being processed,
after they are resolved, this must be the same fiscal year and month.
- Some minor changes over files to be replaced on old directories

### (lines bellow as in the starter tutorial) Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
