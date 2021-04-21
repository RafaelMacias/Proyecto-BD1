create database universidad;

use universidad;

create table info_contacto(
    DNI nvarchar(20) primary key,
    nombre1 nvarchar(50),
    nombre2 nvarchar(50),
    apellido1 nvarchar(50),
    apellido2 nvarchar(50),
    correo nvarchar(20),
    celular nvarchar(8),
    direccion nvarchar(200),
    fecha_nacimiento date
);

create table edificio (
    cod_edificio nvarchar (20) primary key,
    nombre nvarchar (20)
);

create table aula(
    cod_aula nvarchar(20) Primary Key,
    CONSTRAINT fk_edificio FOREIGN KEY (cod_edificio) REFERENCES edificio,
    capacidad nvarchar(20)
);

create table periodo(
    cod_periodo nvarchar(20) Primary key,
    numero int,
    año date,
    inicio date,
    final date
);

create table alumno(
    ncuenta nvarchar(20) primary key,
    CONSTRAINT fk_DNI FOREIGN KEY (DNI) REFERENCES info_contacto
);

create table decano(
    id_decano nvarchar(20) primary key,
    CONSTRAINT fk_DNI FOREIGN KEY (DNI) REFERENCES info_contacto
);

create table jefe_carrera(
    id_jefe nvarchar(20) primary key,
    CONSTRAINT fk_DNI FOREIGN KEY (DNI) REFERENCES info_contacto
);

create table coord_carrera (
    id_coordinador nvarchar (20) primary key,
    CONSTRAINT fk_DNI FOREIGN KEY (DNI) REFERENCES info_contacto
);

create table docente(
    id_docente nvarchar(20) primary key,
    CONSTRAINT fk_DNI FOREIGN KEY (DNI) REFERENCES info_contacto
);

create table facultad (
    cod_facultad nvarchar (20) primary key,
    nombre nvarchar (50),
    CONSTRAINT fk_edificio FOREIGN KEY (cod_edificio) REFERENCES edificio,
    CONSTRAINT fk_decano FOREIGN KEY (id_decano) REFERENCES decano
);

create table carrera (
    cod_carrera nvarchar (20) primary key,
    nombre nvarchar (50),
    CONSTRAINT fk_jefe FOREIGN KEY (id_jefe) REFERENCES jefe_carrera,
    CONSTRAINT fk_coor_carrera FOREIGN KEY (id_coordinador) REFERENCES coord_carrera,
    CONSTRAINT fk_edificio FOREIGN KEY (cod_edificio) REFERENCES edificio,
    CONSTRAINT fk_facultad FOREIGN KEY (cod_facultad) REFERENCES facultad
);

create table solicitud (
    id_solicitud nvarchar(20) primary key,
    fecha_solicitud varchar(100),
    motivo varchar(100),
    dictamen varchar(100),
    fecha_dictamen varchar(100),
    CONSTRAINT fk_alumno FOREIGN KEY (ncuenta) REFERENCES alumno,
    CONSTRAINT fk_coor_carrera FOREIGN KEY (id_coordinador) REFERENCES coord_carrera,
    CONSTRAINT fk_carrera FOREIGN KEY (cod_carrera) REFERENCES carrera
);

create table aula(
    cod_aula nvarchar(20) primary key,
    CONSTRAINT fk_edificio FOREIGN KEY (cod_edificio) REFERENCES edificio,
    capacidad int
);

create table seccion (
    cod_seccion nvarchar(20) primary key,
    CONSTRAINT fk_asignatura FOREIGN KEY (cod_asignatura) REFERENCES asignatura,
    CONSTRAINT fk_aula FOREIGN KEY (cod_aula) REFERENCES aula,
    hora_inicio varchar(20),
    hora_final varchar(20),
    dias varchar(20),
    CONSTRAINT fk_docente FOREIGN KEY (cod_docente) REFERENCES docente,
    CONSTRAINT fk_periodo FOREIGN KEY (cod_periodo) REFERENCES periodo
);

create table alumno_asignatura (
    ncuenta nvarchar(20) primary key,
    CONSTRAINT fk_asignatura FOREIGN KEY (cod_asignatura) REFERENCES asignatura,
    calificacion int
);