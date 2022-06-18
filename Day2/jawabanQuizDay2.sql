-- Soal 1
select regions.region_id, regions.region_name, countries.country_id, countries.country_name
	from regions join countries on regions.region_id = countries.region_id

-- Soal 2
select regions.region_id, regions.region_name, count(countries.country_id)total_countries 
	from regions join countries on regions.region_id = countries.region_id
	group by regions.region_id

-- Soal 3
select c.country_id, c.country_name, l.location_id, l.street_address, l.postal_code, l.city, l.state_province
	from regions r join countries c on r.region_id = c.region_id
	join locations l on c.country_id = l.country_id where r.region_name = 'Europe'

-- Soal 4
select d.department_id, d.department_name, l.location_id
	from regions r join countries c on r.region_id = c.region_id
	join locations l on c.country_id = l.country_id
	join departments d on l.location_id = d.location_id where r.region_name = 'Americas'

-- Soal 5
select r.region_name, count(l.location_id)total_department
	from regions r join countries c on r.region_id = c.region_id
	join locations l on c.country_id = l.country_id
	join departments d on l.location_id = d.location_id
	group by r.region_name

-- Soal 6
select c.country_name, count(d.location_id)total_department
	from countries c join locations l on c.country_id = l.country_id
	join departments d on l.location_id = d.location_id
	group by c.country_name

-- Soal 7
select c.country_name, count(d.location_id)total_department
	from countries c join locations l on c.country_id = l.country_id
	join departments d on l.location_id = d.location_id
	group by c.country_name
	having count(d.location_id) > 5

-- Soal 8
select d.department_id, d.department_name, count(e.employee_id)total_emps
	from departments d join employees e on d.department_id = e.department_id
	group by d.department_id
	order by count(e.employee_id) asc

-- Soal 9
select d.department_id, d.department_name, count(e.employee_id)total_emps
	from regions r join countries c on r.region_id = c.region_id
	join locations l on c.country_id = l.country_id
	join departments d on l.location_id = d.location_id 
	join employees e on d.department_id = e.department_id where r.region_name = 'Americas'
	group by d.department_id
	order by count(e.employee_id) asc

-- Soal 10
select employee_id, first_name, last_name, salary, extract(year from age(now(), hire_date))masa_kerja,
	case 
		when extract(year from age(now(), hire_date)) >= 25 then salary * 5
		else salary * 3
	end bonus
	from employees

-- Soal 11
select extract(year from age(now(), hire_date))masa_kerja,
	sum(case 
		when extract(year from age(now(), hire_date)) >= 25 then salary * 5
		else salary * 3
	end) bonus_per_masa_kerja
	from employees
	group by masa_kerja
	order by masa_kerja

-- Soal 12
select
sum(coalesce(data1,0))"15<=masakerja<=25",
sum(coalesce(data2,0))"25<=masakerja<=30",
sum(coalesce(data3,0))"30<=masakerja<=35"
	from (select case
		when masa_kerja >= 15 and masa_kerja <= 25 then count(1)
	end data1,
	case
		when masa_kerja > 25 and masa_kerja <= 30 then count(1)
	end data2,
	case
		when masa_kerja > 30 and masa_kerja <= 35 then count(1)
	end data3
	from (select extract(year from age(now(), hire_date))masa_kerja
		  from employees
		  )a group by masa_kerja
	)a

-- Soal 13
select department_id, department_name,
sum(coalesce(data1,0))"15<=masakerja<=25",
sum(coalesce(data2,0))"25<=masakerja<=30",
sum(coalesce(data3,0))"30<=masakerja<=35"
	from (select department_id, department_name,
	case
		when masa_kerja >= 15 and masa_kerja <= 25 then count(1)
	end data1,
	case
		when masa_kerja > 25 and masa_kerja <= 30 then count(1)
	end data2,
	case
		when masa_kerja > 30 and masa_kerja <= 35 then count(1)
	end data3
	from (select employees.department_id, departments.department_name,
		  extract(year from age(now(), hire_date))masa_kerja
		  from employees join departments on employees.department_id = departments.department_id
		  )a group by masa_kerja, department_id, department_name
	)a group by department_id, department_name
	order by department_name