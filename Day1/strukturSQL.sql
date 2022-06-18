-- Tabel regions
create table regions(
	region_id serial primary key,
	region_name varchar(25)
)

-- Tabel countries
create table countries(
	country_id character(2) primary key,
	country_name varchar(40),
	region_id integer not null,
	foreign key(region_id) references regions(region_id) on update cascade on delete cascade
)

-- Tabel locations
create table locations(
	location_id serial primary key,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) not null,
	state_province varchar(25),
	country_id character(2),
	foreign key(country_id) references countries(country_id) on update cascade on delete cascade
)

-- Tabel departments
create table departments(
	department_id serial primary key,
	department_name varchar(30) not null,
	location_id integer,
	foreign key(location_id) references locations(location_id) on update cascade on delete cascade
)

-- Tabel jobs
create table jobs(
	job_id serial primary key,
	job_title varchar(35) not null,
	min_salary numeric(82),
	max_salary numeric(82)
)

-- Tabel employees
create table employees(
	employee_id serial primary key,
	first_name varchar(20),
	last_name varchar(25) not null,
	email varchar(100) not null,
	phone_number varchar(20),
	hire_date date not null,
	job_id integer not null,
	salary numeric(82) not null,
	manager_id integer,
	department_id integer,
	foreign key(job_id) references jobs(job_id) on update cascade on delete cascade,
	foreign key(manager_id) references employees(employee_id) on update cascade on delete cascade,
	foreign key(department_id) references departments(department_id) on update cascade on delete cascade
)

-- Tabel dependents
create table dependents(
	dependent_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	relationship varchar(25) not null,
	employee_id integer,
	foreign key(employee_id) references employees(employee_id) on update cascade on delete cascade
)

-- Tabel Project
create table projects(
	proj_id serial primary key,
	proj_name varchar(100),
	proj_createdon date,
	proj_duedate date,
	proj_cust_name varchar(100)
)

-- Tabel project_assigment
create table project_assignment(
	pras_proj_id integer,
	pras_employee_id integer,
	pras_startdate date,
	pras_enddate date,
	pras_status varchar(15),
	constraint pk_project_assignment primary key(pras_proj_id, pras_employee_id),
	foreign key(pras_proj_id) references projects(proj_id) on update cascade on delete cascade,
	foreign key(pras_employee_id) references employees(employee_id) on update cascade on delete cascade
)