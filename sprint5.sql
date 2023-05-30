create database sprint5;
create user sprint;
grant select, insert, update, create, delete on sprint5.* to "sprint"@"localhost";
use sprint5;


CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  email VARCHAR(100),
  veces_utilizada INT
);


INSERT INTO usuarios (nombre, apellido, edad, email, veces_utilizada) VALUES
  ('seba', 'toretto', 20, 'seba@hotmail.com', 10),
  ('María', 'robles', 25, 'maria@gmail.com', 5),
  ('Pedro', 'López', 35, 'peter@yahoo.com', 3),
  ('xxx', 'lopex', 38, 'xxx@gmail.com', 7),
  ('Carlos', 'kram', 52, 'charles@hotmail.com', 2);


CREATE TABLE operadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  email VARCHAR(100),
  veces_servido INT
);


INSERT INTO operadores (nombre, apellido, edad, email, veces_servido) VALUES
  ('Ana', 'quantum', 27, 'ana@gmail.com', 20),
  ('Luis', 'Hetax', 31, 'luis@yahoo.com', 15),
  ('Sof', 'Tow', 29, 'sof@hotmail.com', 18),
  ('Diego', 'Rower', 26, 'rower@hotmail.com', 12),
  ('July', 'sach', 43, 'julia@googe.com', 10);


CREATE TABLE operaciones_soporte (
  id INT AUTO_INCREMENT PRIMARY KEY,
  operario_id INT,
  cliente VARCHAR(50),
  fecha DATE,
  evaluacion INT,
  FOREIGN KEY (operario_id) REFERENCES operadores(id)
);


INSERT INTO operaciones_soporte (operario_id, cliente, fecha, evaluacion) VALUES
  (1, 'Cliente juan', '2023-05-01', 5),
  (2, 'Cliente Bruno', '2023-05-02', 4),
  (3, 'Cliente Cal', '2023-05-03', 3),
  (4, 'Cliente Drwe', '2023-05-04', 2),
  (5, 'Cliente Epsylom', '2023-05-05', 1),
  (1, 'Cliente Fuck', '2023-05-06', 5),
  (2, 'Cliente Gap', '2023-05-07', 4),
  (3, 'Cliente Helqwe', '2023-05-08', 3),
  (4, 'Cliente Infame', '2023-05-09', 2),
  (5, 'Cliente Jyur', '2023-05-10', 1);

-- Consulta: Seleccionar las 3 operaciones con mejor evaluación
SELECT * FROM operaciones_soporte ORDER BY evaluacion DESC LIMIT 3;

-- Consulta: Seleccionar las 3 operaciones con menor evaluación
SELECT * FROM operaciones_soporte ORDER BY evaluacion ASC LIMIT 3;

-- Consulta: Seleccionar al operario que más soportes ha realizado
SELECT operario_id, COUNT(*) AS total_soportes FROM operaciones_soporte
GROUP BY operario_id
ORDER BY total_soportes DESC
LIMIT 1;

-- Consulta: Seleccionar al cliente que menos veces ha utilizado la aplicación
SELECT nombre, apellido veces_utilizada FROM usuarios 
where veces_utilizada <=2;

-- Actualizar la edad de los tres primeros usuarios registrados (agregar 10 años)
UPDATE usuarios SET edad = edad + 10 WHERE id IN (1, 2, 3);

-- Renombrar la columna 'correo electrónico' a 'email' en las tablas 'usuarios' y 'operadores'
ALTER TABLE usuarios CHANGE email `correo electrónico`VARCHAR(100);
ALTER TABLE operadores CHANGE email `correo electrónico` VARCHAR(100);

-- Consulta: Seleccionar solo los operarios mayores de 20 años
SELECT * FROM operadores WHERE edad > 20;