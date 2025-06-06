/*Getting the first 20 rows of the data*/
select * from hr_attrition
limit 20;

/*Getting distinct employees*/
select count(distinct(employee_number)) as Total_employees
from hr_attrition;

 /*Getting the attrition */
select attrition ,
       count(attrition)
from hr_attrition
group by attrition;

/*getting churn rate*/
with t1(attrition,counts)
as(
    select attrition ,
       count(attrition)
    from hr_attrition
    group by attrition)
select attrition , 
       round((counts ::decimal / sum(counts) over())*100,1)
from t1;