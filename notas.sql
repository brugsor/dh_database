/* Creación de la base de datos */
CREATE DATABASE notas_db;

/* Creación de la tabla "usuarios" */
CREATE TABLE usuarios (
	usuario_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre TEXT NOT NULL,
    email TEXT NOT NULL
);

/* Creación de la tabla "notas" */
CREATE TABLE notas (
	nota_id INT AUTO_INCREMENT NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (nota_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	titulo VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME ON UPDATE CURRENT_TIMESTAMP,
    descripcion TEXT,
    permiso TINYINT DEFAULT(1) CHECK (permiso in (0,1))
);

/* Creación de la tabla "categorias" */
CREATE TABLE categorias (
	categoria_id INT PRIMARY KEY AUTO_INCREMENT,
	nombre TEXT NOT NULL
);

/* Creación de la tabla "nota_categoria" */
CREATE TABLE nota_categoria (
	nota_categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nota_id INT,
    categoria_id INT,
	FOREIGN KEY (nota_id) REFERENCES notas(nota_id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

/* Datos de prueba para la evaluación de la base de datos */
/* 1 Agregando un nuevos usuarios */
INSERT INTO usuarios
	VALUES (DEFAULT, "Fernando Márquez", "fmarquez@gmail.com");

INSERT INTO usuarios (nombre, email)
	VALUES (DEFAULT, "Ana de León", "aleon@gmail.com");

SELECT * FROM usuarios;

/* 2 Agregando nuevas notas */
INSERT INTO notas
	VALUES (DEFAULT, 1, "Nota de Prueba de Fernando", DEFAULT, DEFAULT, "Esta es la primera nota que se crea en esta base dee datos", DEFAULT);

INSERT INTO notas
	VALUES (DEFAULT, 1, "Nota de Prueba de Fernando", DEFAULT, DEFAULT, "Esta es la primera nota que se crea en esta base dee datos", 0);

SELECT * FROM notas;

/* 3 Modificando notas */
UPDATE notas
	SET titulo = "Este es el título modificado de la nota 1"
	WHERE nota_id = 1;

SELECT * FROM notas;

/* 4 Agregando más usuarios*/
INSERT INTO usuarios
	VALUES (DEFAULT, "Alan Gutiérrez", "agutierrez@gmail.com");

INSERT INTO usuarios (nombre, email)
	VALUES (DEFAULT, "Galicia Flores", "Gflores@gmail.com");

/* 5 Agregando nuevas notas */
INSERT INTO notas
	VALUES (DEFAULT, 2, "Saludos de Ana!", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", DEFAULT);

INSERT INTO notas
	VALUES (DEFAULT, 4, "Hola! Soy Galicia", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", 0);

/* 6 Agregando nuevas notas */
INSERT INTO notas
	VALUES (DEFAULT, 1, "Nada más jugando a crear notas", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", DEFAULT);

INSERT INTO notas
	VALUES (DEFAULT, 3, "Escribiendo como Alan", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", 0);

/* 7 Agregando nuevas notas */
INSERT INTO notas
	VALUES (DEFAULT, 2, "Me dicen Ana", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", DEFAULT);

INSERT INTO notas
	VALUES (DEFAULT, 3, "Alan a la orden", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", 0);

/* 8 Agregando nuevas notas */
INSERT INTO notas
	VALUES (DEFAULT, 4, "Agregando otro registro", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", DEFAULT);

INSERT INTO notas
	VALUES (DEFAULT, 1, "Nueva nota de Fer", DEFAULT, DEFAULT, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti velit, quos ad dolore culpa aut nam cum. Quaerat culpa aperiam, nihil excepturi animi deserunt, nam tempore quae, facilis id sapiente?", 0);

/* 9 Modificando notas */
UPDATE notas
	SET descripcion = "El contenido de esta nota ha sido modificado."
	WHERE nota_id = 1;

/* 10 Modificando notas */
UPDATE notas
	SET descripcion = "Lorem ipsum...."
	WHERE nota_id = 1;
