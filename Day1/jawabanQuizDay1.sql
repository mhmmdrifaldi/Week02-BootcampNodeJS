-- Soal 1
/* Buat sintak untuk create table yang memiliki relasi many to many antara table employees dan
 table projects. */
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

-- Soal 2
/* Buat sintak untuk menambahkan kolom berikut di table projects
• proj_description varchar(255)
• proj_status varchar(15)
• proj_amount number  */
alter table projects add column proj_description varchar(255),
	add column proj_status varchar(15),
	add column proj_amount numeric

-- Soal 3
/* Buat sintak untuk menambahkan kolom proj_account_mgr dengan tipe data integer dan buat
juga constraint foreign key antara table projects dan employees.  */
alter table projects add column proj_account_mgr varchar(255),
	add column employee_id integer,
	add constraint project_employee_id_fk foreign key(employee_id) references employees(employee_id)

-- Soal 4
/* Buat sintak insert ke table projects minimal 3 record, kolom proj_account_mgr hanya bisa diisi
value oleh employee yang memiliki jabatan manager. */
insert into projects values (1, 'E-COMMERCE', '2021-09-14', '2021-12-13', 'TELKOMSEL', NULL, 'INPROGRESS', 35000.00, NULL, 105),
	(2, 'TRAVELOKA', '2021-09-14', '2021-12-13', 'XL', NULL, 'INPROGRESS', 25000.00, NULL, 110),
	(3, 'TIKET.COM', '2021-09-14', '2021-12-13', 'INDOSAT', NULL, 'INPROGRESS', 15000.00, NULL, 115)

-- Soal 5
/* Buat sintak insert ke table project_assignment dengan value seperti di table, dengan employee
yang ada di department IT. */
insert into project_assignment values (1, 104, '2021-09-14', NULL, 'ASSIGNED'),
	(1, 105, '2021-09-14', '2021-09-17', 'COMPLETED'),
	(1, 106, '2021-09-14', NULL, 'INPROGRESS'),
	(2, 104, '2021-09-14', NULL, 'ASSIGNED'),
	(2, 105, '2021-09-14', '2021-09-17', 'COMPLETED'),
	(2, 106, '2021-09-14', '2021-09-17', 'INPROGRESS')

-- Soal 6
/* Tampilkan employee yang pras_status nya sudah completed di tiap project.  */
select * from project_assignment where pras_status = 'COMPLETED'