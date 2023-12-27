-- create a join table
SELECT * FROM absenteeism_at_work a
	LEFT JOIN compensation b ON a.ID = b.ID
    left join reasons r
    on a.`Reason for absence` = Number;
    
--- find the healthiest,
	SELECT * FROM absenteeism_at_work 
		Where `Social drinker` = 0 and `Social smoker` = 0 and `Body mass index` <25 and `Absenteeism time in hours` < (SELECT AVG(`Absenteeism time in hours`) FROM absenteeism_at_work); 
	
---- Compensation rate increase for non-smokers/ budget $983,221 s0 0.68 increase per hour/ $1,414.4 per year
	SELECT count(*) FROM absenteeism_at_work 
	where `Social smoker` = 0;
    
---- optimize this query 
SELECT a.ID, Reason, `Month of absence`, `Body mass index`, `Transportation expense`, `Distance from Residence to Work`,
CASE
	when `Body mass index` <18.5 then 'underweight'
	when `Body mass index` between 18.5 and 24.9 then 'healthy weight'
	when `Body mass index` between 25 and 30 then 'overweight'
	when `Body mass index` >30.5 then 'obese'
	ELSE 'unkown' end as BMI_category,
CASE
	when `Month of absence` in (12,1,2) then 'winter'
    when `Month of absence` in (3,4,5) then 'spring'
	when `Month of absence` in (6,7,8) then 'summer'
        when `Month of absence` in (9, 10, 11) then 'fall'
        Else 'unkown' END as seasons_names, 
CASE 
	WHEN `Distance from Residence to Work` <19.9 then 'close'
    WHEN `Distance from Residence to Work` between 20 and 49.9 then 'moderate'
    WHEN `Distance from Residence to Work` >50 then 'far' 
     Else 'unkown'END as Distance_category,
CASE 
	WHEN `Transportation expense` <149.9 then 'Low Expense'
	WHEN `Transportation expense` between 150 and 249.9 then 'Moderate Expense'
	WHEN `Transportation expense` between 250 and 349.9 then 'High Expense'
    WHEN `Transportation expense` >350 then 'Very High Expense'
	Else 'unkown' END as Transportation_Expense_category,
    
        `Month of absence`, `Day of the week`, Education, Son, 
        `Social drinker`, `Social smoker`, Pet, `Disciplinary failure`, 
        Age, `Work load Average/day`, `Absenteeism time in hours`
	FROM absenteeism_at_work a
	LEFT JOIN compensation b ON a.ID = b.ID
    left join reasons r
    on a.`Reason for absence` = Number;