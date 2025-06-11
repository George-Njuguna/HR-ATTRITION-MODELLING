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

 /* Getting the attrition rates*/
/*Gender*/
with t1(gender,counts,attrition)
as(
    select gender , 
       count(gender),
       attrition
    from hr_attrition
    group by gender , attrition)
select a.gender,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.gender=b.gender
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Marital status*/
with t1(marital_status,counts,attrition)
as(
    select marital_status , 
       count(marital_status),
       attrition
    from hr_attrition
    group by marital_status , attrition)
select a.marital_status,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.marital_status=b.marital_status
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Business Travel*/
with t1(business_travel,counts,attrition)
as(
    select business_travel , 
       count(business_travel),
       attrition
    from hr_attrition
    group by business_travel , attrition)
select a.business_travel,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.business_travel=b.business_travel
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Department*/
with t1(department,counts,attrition)
as(
    select department , 
       count(department),
       attrition
    from hr_attrition
    group by department , attrition)
select a.department,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.department=b.department
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Education Field*/
with t1(education_field,counts,attrition)
as(
    select education_field , 
       count(education_field),
       attrition
    from hr_attrition
    group by education_field , attrition)
select a.education_field,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.education_field=b.education_field
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Job Role*/
with t1(job_role,counts,attrition)
as(
    select job_role , 
       count(job_role),
       attrition
    from hr_attrition
    group by job_role , attrition)
select a.job_role,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.job_role=b.job_role
where a.attrition = 'No' and
b.attrition = 'Yes';

/*Overtime*/
with t1(Overtime,counts,attrition)
as(
    select Overtime , 
       count(Overtime),
       attrition
    from hr_attrition
    group by Overtime , attrition)
select a.Overtime,
       round((a.counts::decimal/sum(a.counts)over())*100,1) as retention_rate,
       round((b.counts::decimal/sum(b.counts)over())*100,1) as attrition_rate
from t1 a
join t1 b 
    on a.Overtime=b.Overtime
where a.attrition = 'No' and
b.attrition = 'Yes';


