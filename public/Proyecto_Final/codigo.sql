CREATE DATABASE IF NOT EXISTS Escuela;

USE Escuela;

CREATE TABLE IF NOT EXISTS Carrera(
    clave INT NOT NULL AUTO_INCREMENT,
    nombre TEXT NOT NULL,
    PRIMARY KEY(clave)
) AUTO_INCREMENT=14523;

CREATE TABLE IF NOT EXISTS Alumno(
    matricula BIGINT NOT NULL AUTO_INCREMENT,
    nombres TEXT NOT NULL,
    apellido_paterno TEXT NOT NULL, 
    apellido_materno TEXT NOT NULL, 
    edad INT NOT NULL, 
    carrera INT NOT NULL,
    PRIMARY KEY(matricula),
    FOREIGN KEY(carrera) REFERENCES  Carrera(clave)
) AUTO_INCREMENT=2240001000;

CREATE TABLE IF NOT EXISTS Materia(
    clave INT NOT NULL AUTO_INCREMENT,
    nombre TEXT NOT NULL,
    creditos INT NOT NULL,
    PRIMARY KEY(clave)
) AUTO_INCREMENT=14589;

CREATE TABLE IF NOT EXISTS Ayudante(
    numero_economico INT NOT NULL AUTO_INCREMENT,
    nombres TEXT NOT NULL,
    apellido_paterno TEXT NOT NULL,
    apellido_materno TEXT NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY(numero_economico)
) AUTO_INCREMENT=44000;

CREATE TABLE IF NOT EXISTS Profesor(
    numero_economico INT NOT NULL AUTO_INCREMENT,
    nombres TEXT NOT NULL,
    apellido_paterno TEXT NOT NULL,
    apellido_materno TEXT NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY(numero_economico)
) AUTO_INCREMENT=22000;

CREATE TABLE IF NOT EXISTS Asignacion(
    idAsignacion INT NOT NULL AUTO_INCREMENT,
    profesor INT NOT NULL,
    ayudante INT NOT NULL,
    PRIMARY KEY(idAsignacion),
    FOREIGN KEY(profesor) REFERENCES Profesor(numero_economico),
    FOREIGN KEY(ayudante) REFERENCES Ayudante(numero_economico)
);

CREATE TABLE IF NOT EXISTS Horario(
    clave INT NOT NULL AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    profesor INT NOT NULL,
    materia INT NOT NULL,
    PRIMARY KEY(clave),
    FOREIGN KEY(profesor) REFERENCES Profesor(numero_economico),
    FOREIGN KEY(materia) REFERENCES Materia(clave)
) AUTO_INCREMENT=12458;

CREATE TABLE IF NOT EXISTS Registro(
    idRegistro INT NOT NULL AUTO_INCREMENT,
    horario INT NOT NULL,
    alumno BIGINT NOT NULL,
    PRIMARY KEY(idRegistro),
    FOREIGN KEY(horario) REFERENCES Horario(clave),
    FOREIGN KEY(alumno) REFERENCES Alumno(matricula)
);