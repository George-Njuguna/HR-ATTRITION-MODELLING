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

/*Education*/
select education , count(education)
from hr_attrition
group by education;

with t1(education,attrition,counts)
as(
    select education ,attrition, count(education)
    from hr_attrition
    group by education,attrition
)
select a.education as education,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.education = b.education
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*Job level*/
select job_level , count(job_level)
from hr_attrition
group by job_level;

with t1(job_level,attrition,counts)
as(
    select job_level ,attrition, count(job_level)
    from hr_attrition
    group by job_level,attrition
)
select a.job_level as job_level,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.job_level = b.job_level
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*Job involvement*/
select job_involvement , count(job_involvement)
from hr_attrition
group by job_involvement;

with t1(job_involvement,attrition,counts)
as(
    select job_involvement ,attrition, count(job_involvement)
    from hr_attrition
    group by job_involvement,attrition
)
select a.job_involvement as job_involvement,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.job_involvement = b.job_involvement
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*Job satisfaction*/
select job_satisfaction , count(job_satisfaction)
from hr_attrition
group by job_satisfaction;

with t1(job_satisfaction,attrition,counts)
as(
    select job_satisfaction ,attrition, count(job_satisfaction)
    from hr_attrition
    group by job_satisfaction,attrition
)
select a.job_satisfaction as job_satisfaction,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.job_satisfaction = b.job_satisfaction
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*relationship satisfaction*/
select relationship_satisfaction , count(relationship_satisfaction)
from hr_attrition
group by relationship_satisfaction;

with t1(relationship_satisfaction,attrition,counts)
as(
    select relationship_satisfaction ,attrition, count(relationship_satisfaction)
    from hr_attrition
    group by relationship_satisfaction,attrition
)
select a.relationship_satisfaction as relationship_satisfaction,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.relationship_satisfaction = b.relationship_satisfaction
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*work life balance*/
select work_life_balance , count(work_life_balance)
from hr_attrition
group by work_life_balance;

with t1(work_life_balance,attrition,counts)
as(
    select work_life_balance ,attrition, count(work_life_balance)
    from hr_attrition
    group by work_life_balance,attrition
)
select a.work_life_balance as work_life_balance,
    round((a.counts::decimal/sum(a.counts)over())*100,2) as rate0,
    round((b.counts::decimal/sum(b.counts)over())*100,2) as rate1
from t1 a 
join t1 b 
    on a.work_life_balance = b.work_life_balance
where a.attrition = 'No' and 
    b.attrition = 'Yes';

/*grouping the Ages*/
with t1 (attrition,grouped_ages)
    as (
        select attrition , 
            case
                when age < 30 then '<29'
                when age >=30 and age < 50 then '30-49'   /*grouping ages*/
                when age >=50 and age < 60 then '50-59'
                when age >=60 then '>60'
                end as grouped_age
        from hr_attrition
    ),
    t2(attrition,grouped_ages,counts)
    as (
        select attrition ,grouped_ages, count(grouped_ages)
        from t1 
        group by grouped_ages,attrition
    )
select a.attrition , a.grouped_ages,
        round((a.counts::decimal/(a.counts+b.counts))*100,2) as rate0,
        round((b.counts::decimal/(a.counts+b.counts))*100,2) as rate1
from t2 a
join t2 b
    on a.grouped_ages=b.grouped_ages
where a.attrition = 'No' and b.attrition='Yes';

/*grouping the Monthly Income*/
with t1 (attrition,grouped_monthly_income)
    as (
        select attrition , 
            case
                when monthly_income <=5000 then '<5000'
                when monthly_income >5000 and monthly_income <= 10000 then '5000-10000'   /*grouping monthly income*/
                when monthly_income >10000 then '>10000'
                end as grouped_monthly_income
        from hr_attrition
    ),
    t2(attrition,grouped_monthly_income,counts)
    as (
        select attrition ,grouped_monthly_income, count(grouped_monthly_income)
        from t1 
        group by grouped_monthly_income,attrition
    )
select a.attrition , a.grouped_monthly_income,
        round((a.counts::decimal/(a.counts+b.counts))*100,2) as rate0,
        round((b.counts::decimal/(a.counts+b.counts))*100,2) as rate1
from t2 a
join t2 b
    on a.grouped_monthly_income=b.grouped_monthly_income
where a.attrition = 'No' and b.attrition='Yes';

/*grouping the daily rate*/
with t1 (attrition,grouped_daily_rate)
    as (
        select attrition , 
            case
                when daily_rate <=500 then '<500'
                when daily_rate >500 and daily_rate <= 1000 then '500-1000'   /*grouping monthly income*/
                when daily_rate >1000 then '>1000'
                end as grouped_daily_rate
        from hr_attrition
    ),
    t2(attrition,grouped_daily_rate,counts)
    as (
        select attrition ,grouped_daily_rate, count(grouped_daily_rate)
        from t1 
        group by grouped_daily_rate,attrition
    )
select a.attrition , a.grouped_daily_rate,
        round((a.counts::decimal/(a.counts+b.counts))*100,2) as rate0,
        round((b.counts::decimal/(a.counts+b.counts))*100,2) as rate1
from t2 a
join t2 b
    on a.grouped_daily_rate=b.grouped_daily_rate
where a.attrition = 'No' and b.attrition='Yes';