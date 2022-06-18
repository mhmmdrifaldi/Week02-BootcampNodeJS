-- Struktur tabel
create table t_agent(
	agent_code varchar(5) primary key,
	agent_name varchar(25),
	agent_office varchar(15),
	bassic_commision numeric(82)
)

create table t_client(
	client_number varchar(5) primary key,
	client_name varchar(25),
	birth_date date
)

create table t_policy(
	policy_number serial primary key,
	policy_submit_date date,
	premium numeric(82),
	discount numeric(3),
	commision numeric(82),
	client_number varchar(5),
	agent_code varchar(5),
	policy_status varchar(15),
	policy_due_date date,
	foreign key(client_number) references t_client(client_number) on update cascade on delete cascade,
	foreign key(agent_code) references t_agent(agent_code) on update cascade on delete cascade
)

-- Data tabel
insert into t_client values('CL001', 'WAYNE ROONEY', '11/5/1956'), ('CL002', 'RYAN GIGGS', '3/9/1972'),
	('CL003', 'DAVID BECKHAM', '3/9/1985'), ('CL004', 'MICHAEL OWEN', '3/9/2012')

insert into t_agent(agent_code, agent_name, agent_office) values('AG001', 'LIDYA', 'JAKARTA'), 
	('AG002', 'RUDI', 'BALI'), ('AG003', 'DICKY', 'BALI'), ('AG004', 'DAVID', 'SURABAYA'), 
	('AG005', 'FARIZ', 'SURABAYA')

insert into t_policy(policy_number, policy_submit_date, premium, discount, commision, client_number, agent_code, policy_status)
	values(001, '5/1/2018', 18600000.00, '10', '930000.00', 'CL001', 'AG001', 'INFORCE'), 
	(002, '5/1/2018', 2500000.00, '10', '125000.00', 'CL002', 'AG002', 'INFORCE'), 
	(003, '10/1/2018', 2500000.00, '10', '125000.00', 'CL003', 'AG003', 'TERMINATE'), 
	(004, '25/1/2018', 4000000.00, '10', '200000.00', 'CL003', 'AG002', 'PROPOSAL'), 
	(005, '25/1/2018', 2625000.00, '10', '131250.00', 'CL004', 'AG002', 'PROPOSAL')

-- Jawaban A
select p.policy_number, p.policy_submit_date, p.premium, p.discount, p.commision, p. client_number, p.agent_code, p.policy_status, c.birth_date
	from t_policy p join t_client c on p.client_number = c.client_number
	where p.policy_submit_date > '15/1/2018' and date_part('month', c.birth_date) = 9

-- Jawaban B
select p.policy_number, p.policy_submit_date, p.premium, p.discount, p.commision, p.client_number, p.agent_code, p.policy_status, a.agent_office
	from t_policy p join t_agent a on p.agent_code = a.agent_code
	where p.policy_status = 'INFORCE' and a.agent_office = 'JAKARTA'

-- Jawaban C
select a.agent_code, p.premium, p.commision, (p.commision/p.premium)*100 as basic_commision 
	from t_agent a join t_policy p on a.agent_code = p.agent_code

-- Jawaban D
select policy_number, policy_submit_date, policy_submit_date + interval '30 day' as policy_due_date from t_policy

-- Jawaban E
select agent_code, policy_number, client_number, premium, premium - ((premium * discount) /100) as hasil
from (select a.agent_code, p.policy_number, c.client_number, p.premium, p.discount, p.premium - ((p.premium * p.discount) /100) as hasil
	from t_agent a join t_policy p on a.agent_code = p.agent_code
	join t_client c on p.client_number = c.client_number
	)a where hasil < 1000000