create table aula(
cod_aula nvarchar(20) Primary Key, 
CONSTRAINT fk_edificio FOREIGN KEY (cod_edificio) REFERENCES edificio,
capacidad nvarchar(20)
);


create table periodo(
cod_periodo nvarchar(20) Primary key,
numero int, 
año int, inicio int, final int
);


create table solicitud (
id_solicitud nvarchar(20) primary key,
fecha_solicitud varchar(100),
motivo varchar(100),
dictamen varchar(100),
fecha_dictamen varchar(100),
CONSTRAINT fk_alumno FOREIGN KEY (ncuenta) REFERENCES alumno,
CONSTRAINT fk_coor_carrera FOREIGN KEY (id_coordinador) REFERENCES coor_carrera,
CONSTRAINT fk_carrera FOREIGN KEY (cod_carrera) REFERENCES carrera
);


create table seccion (
cod_seccion nvarchar(20),
cod_asignatura nvarchar(20),
cod_aula nvarchar(20),
cod_docente nvarchar(20),
cod_periodo nvarchar(20),
hora_inicio time,
hora_final time,
dias varchar (20),
primary key (cod_seccion,cod_asignatura,cod_periodo),
FOREIGN KEY (cod_asignatura) REFERENCES asignatura(cod_asignatura),
FOREIGN KEY (cod_aula) REFERENCES aula(cod_aula),
FOREIGN KEY (cod_docente) REFERENCES docente (id_docente),
FOREIGN KEY (cod_periodo) REFERENCES periodo (cod_periodo)
);

create table alumno_asignatura (
ncuenta nvarchar(20) primary key,
CONSTRAINT fk_asignatura FOREIGN KEY (cod_asignatura) REFERENCES asignatura,
calificacion int

);