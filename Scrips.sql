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
cod_seccion nvarchar(20) primary key,
CONSTRAINT fk_asignatura FOREIGN KEY (cod_asignatura) REFERENCES asignatura,
CONSTRAINT fk_aula FOREIGN KEY (cod_aula) REFERENCES aula,
hora_inicio varchar(20), hora_final varchar(20), dias varchar(20),
CONSTRAINT fk_docente FOREIGN KEY (cod_docente) REFERENCES docente,
CONSTRAINT fk_periodo FOREIGN KEY (cod_periodo) REFERENCES preiodo
);

create table alumno_asignatura (
ncuenta nvarchar(20) primary key,
CONSTRAINT fk_asignatura FOREIGN KEY (cod_asignatura) REFERENCES asignatura,
calificacion int

);