DELIMITER $$
create procedure matricular(
	in n_cuenta nvarchar(20),
	in seccion nvarchar(20)
)
begin
	declare cant int;
    select count(*) into cant from seccion as s inner join aula as a on s.cod_aula = a.cod_aula;
    if cant 
	insert into alumno_seccion values (n_cuenta, seccion, '');
    update seccion set 
end;


#Apertura nueva seccion

DELIMITER $$
create procedure apertura_seccion(
	in id nvarchar(20),
	in seccion nvarchar(20),
    in asignatura nvarchar(20),
    in aula nvarchar(20),
    in docente nvarchar(20),
    in periodo nvarchar(20),
    in inicio time,
    in final time,
    in dias nvarchar(20)
)
begin
	insert into seccion values (id, seccion, asignatura, aula, docente, periodo, inicio, final, dias);
end;

call apertura_seccion(
	'45',
	'0800',
    'IS-411',
    'B2-201',
    '1',
    '201903',
    '08:00',
    '09:00',
    'LuMaMi')

#Matricular nuevo alumno

DELIMITER $$
create procedure matricular_nuevo(
	in dni varchar(20),
	in nom1 varchar(50),
    in nom2 varchar(50),
    in ape1 varchar(20),
    in ape2 varchar(20),
    in correo varchar(200),
    in cel varchar(8),
    in direc varchar(200),
    in fecha date,
    in cta nvarchar(20),
    in cod_car nvarchar(20)
)

begin
start transaction;
	insert into info_contacto values(dni, nom1, nom2, ape1, ape2, correo, cel, direc, fecha);
    insert into alumno values(cta, dni, cod_car);
end;

call matricular_nuevo('0102-2002-12354',
			'Pedro',
            'Augusto',
            'Padilla',
            'Medina',
            'pedro.medina@unah.hn',
            '98877445',
            'Brisas del Rio',
            '2002-12-24',
            '20201900030',
            'IS')


#cambiar jefe de carrera

DELIMITER $$
create procedure cambiar_jefe(
	in dni_a nvarchar(20),
	in dni_n nvarchar(20)
)
begin
	declare id_a, id_n, cod_ca nvarchar(20);
    
    select id_jefe into id_a from jefe_carrera where DNI = dni_a;
    select id_jefe into id_n from jefe_carrera where DNI = dni_n;
    
    update carrera
    set id_jefe = id_n
    where id_jefe = id_a;
end;


call cambiar_jefe(
	'0301-1988-02554',
    '0801-1985-00135')


#Agregar un decano

	