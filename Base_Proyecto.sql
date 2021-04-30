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
    cod_edificio nvarchar(20),
    FOREIGN KEY (cod_edificio) REFERENCES edificio(cod_edificio),
    capacidad int
);

create table periodo(
    cod_periodo nvarchar(20) Primary key,
    numero int,
    año date,
    inicio date,
    final date
);

create table decano(
    id_decano nvarchar(20) primary key,
    DNI nvarchar(20),
    FOREIGN KEY (DNI) REFERENCES info_contacto(DNI)
);

create table jefe_carrera(
    id_jefe nvarchar(20) primary key,
    DNI nvarchar(20),
    FOREIGN KEY (DNI) REFERENCES info_contacto(DNI)
);

create table coord_carrera (
    id_coordinador nvarchar (20) primary key,
    DNI nvarchar(20),
    FOREIGN KEY (DNI) REFERENCES info_contacto(DNI)
);

create table docente(
    id_docente nvarchar(20) primary key,
    DNI nvarchar(20),
    FOREIGN KEY (DNI) REFERENCES info_contacto(DNI)
);

create table facultad (
    cod_facultad nvarchar (20) primary key,
    nombre nvarchar (50),
    cod_edificio nvarchar(20),
    id_decano nvarchar(20),
    FOREIGN KEY (cod_edificio) REFERENCES edificio(cod_edificio),
    FOREIGN KEY (id_decano) REFERENCES decano(id_decano)
);

create table carrera (
    cod_carrera nvarchar (20) primary key,
    nombre nvarchar (50),
    id_jefe nvarchar(20),
    id_coordinador nvarchar(20),
    cod_edificio nvarchar(20),
    cod_facultad nvarchar(20),
    FOREIGN KEY (id_jefe) REFERENCES jefe_carrera(id_jefe),
    FOREIGN KEY (id_coordinador) REFERENCES coord_carrera(id_coordinador),
    FOREIGN KEY (cod_edificio) REFERENCES edificio(cod_edificio),
    FOREIGN KEY (cod_facultad) REFERENCES facultad(cod_facultad)
);

create table alumno(
    ncuenta nvarchar(20) primary key,
    DNI nvarchar(20),
    cod_carrera nvarchar(20),
    FOREIGN KEY (DNI) REFERENCES info_contacto(DNI),
    FOREIGN KEY (cod_carrera) REFERENCES carrera(cod_carrera)
);

create table solicitud (
    id_solicitud nvarchar(20) primary key,
    fecha_solicitud date,
    motivo varchar(100),
    dictamen varchar(100),
    fecha_dictamen date,
    ncuenta nvarchar(20),
    id_coordinador nvarchar(20),
    cod_carrera nvarchar (20),
    FOREIGN KEY (ncuenta) REFERENCES alumno(ncuenta),
    FOREIGN KEY (id_coordinador) REFERENCES coord_carrera(id_coordinador),
    FOREIGN KEY (cod_carrera) REFERENCES carrera(cod_carrera)
);

create table asignatura(
    cod_asignatura nvarchar(20) primary key,
    cod_carrera nvarchar(20),
    nombre varchar(100),
    uv nvarchar(20),
    FOREIGN KEY (cod_carrera) REFERENCES carrera(cod_carrera)
);

create table seccion (
	id_seccion nvarchar(20),
    cod_seccion nvarchar(20),
    cod_asignatura nvarchar(20),
    cod_aula nvarchar(20),
    cod_docente nvarchar(20),
    cod_periodo nvarchar(20),
    hora_inicio time,
    hora_final time,
    dias varchar(20),
    primary key(id_seccion),
    FOREIGN KEY (cod_asignatura) REFERENCES asignatura(cod_asignatura),
    FOREIGN KEY (cod_aula) REFERENCES aula(cod_aula),
    FOREIGN KEY (cod_docente) REFERENCES docente(id_docente),
    FOREIGN KEY (cod_periodo) REFERENCES periodo(cod_periodo)
);

create table alumno_seccion (
    ncuenta nvarchar(20),
    id_seccion nvarchar(20),
    calificacion int,
    primary key(ncuenta, id_seccion),
    FOREIGN KEY (id_seccion) REFERENCES seccion(id_seccion)
);
