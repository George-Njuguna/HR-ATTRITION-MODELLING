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

/*getting attrition rate*/
with t1(attrition,counts)
as(
    select attrition ,
       count(attrition)
    from hr_attrition
    group by attrition)
select attrition , 
       round((counts ::decimal / sum(counts) over())*100,1) as rate 
from t1;

/*Getting the Oldest And Youngest ages*/
select age
from hr_attrition
order by age  desc
limit 1;

select age
from hr_attrition
order by age  ASC
limit 1;

/*Business Travel*/
with t1(business_travel,counts)
as(
    select business_travel ,
       count(business_travel) as counts
    from hr_attrition
    group by business_travel)
select * ,
      round((counts/sum(counts)over())*100,2) as percent
from t1;

/*Daily rate*/
select daily_rate 
from hr_attrition
order by daily_rate asc
limit 1;

select daily_rate 
from hr_attrition
order by daily_rate desc
limit 1;

/*department*/
select department , count(department)
from hr_attrition
GROUP BY department;

with t1(department,counts)
as(
    select department ,
       count(department) as counts
    from hr_attrition
    group by department)
select * ,
      round((counts/sum(counts)over())*100,2) as percent
from t1;

/*Education Field*/
select education_field , count(education_field)
from hr_attrition
GROUP BY education_field;

with t1(education_field,counts)
as(
    select education_field ,
       count(education_field) as counts
    from hr_attrition
    group by education_field)
select * ,
      round((counts/sum(counts)over())*100,2) as percent
from t1;

/*marital Status*/
select marital_status , count(marital_status)
from hr_attrition
GROUP BY marital_status;

with t1(marital_status,counts)
as(
    select marital_status ,
       count(marital_status) as counts
    from hr_attrition
    group by marital_status)
select * ,
      round((counts/sum(counts)over())*100,2) as percent
from t1;

/*gender*/
select gender , count(gender)
from hr_attrition
GROUP BY gender;

with t1(gender,counts)
as(
    select gender ,
       count(gender) as counts
    from hr_attrition
    group by gender)
select * ,
      round((counts/sum(counts)over())*100,2) as percent
from t1;