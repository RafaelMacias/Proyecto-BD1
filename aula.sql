create table aula(
    cod_aula nvarchar(20) Primary Key,
    cod_edificio nvarchar(20),
    FOREIGN KEY (cod_edificio) REFERENCES edificio(cod_edificio),
    capacidad int
);