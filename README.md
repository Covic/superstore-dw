Welcome to your new dbt project!

### This is a simple sandbox for learning dbt tools and some other cool stuff, I will use
this README file to explain some configuration changes step by step. For version 1 there 
will be only configuration and testing iussues, for version 2 on the README will be
placed on the project folder.

The first task on dbt will be to change dbt_project.yml to change the working directoty
from root (default) to superstore_dw, after that perform a dbt test and dbt run to Check 
if everything is fine.

On v1.0.1 the changes are:
- To name the project as superstore_dw
- To change root to -\superstore_dw
- To test if everything is fine

On v1.0.2 the changes are:
- Setting up subdirectory on dbt account setting for the project.
- Update schema.yml inside models directory to check model effects upon database
- Obs. stg_employee is materialized as a view, not a table, on the dw schema

On v1.0.3 (wrong name as v1.3) the changes are:
- Checking if the subdirectory change is properly done.
- Create an OLD directory and sanitize all tutorial templates
- Test some DB and DW changes and check if all is working well, even on error simulated cases.

On v1.0.4
- Just renaming the version and updating this readme file.

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
