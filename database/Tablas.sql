create database PPW1;
use PPW1;

create table t_usuario(
idUsuario int auto_increment primary key,
nombre_Usuario varchar (50) not null unique,
contrasena varchar (50) not null,
correo varchar (50) not null,
imagen varchar (50) not null,
-- imagen longblob not null,
nombre varchar (50) not null,
apellido varchar (50) not null,
dia varchar(10),
mes varchar(10),
anio varchar (10),
fecha_Creacion datetime default current_timestamp not null
);
 
create table t_nota(
id int auto_increment primary key,
texto varchar (500) not null,
etiqueta varchar(50),
fecha_Creacion datetime default current_timestamp not null,
activa tinyint default 1,
fk_autor int not null,
foreign key (fk_autor) references t_usuario(idUsuario)
);

drop table t_usuario;
drop table t_nota;        