use PPW1;
 
insert into t_usuario(nombre_Usuario,contrasena,correo,imagen,nombre,apellido,dia,mes,anio)
values ('charli','1234','charli@ola.com','abcde1234', 'carlos','robles', 05,02,1996),
        ('lele','4321','lele@uwu.com','1234abcde', 'mariel','mata', 05,02,1999);

select * from t_usuario;
 
select * from t_nota order by fecha_Creacion desc limit 10;
 
select imagen from t_usuario where nombre_Usuario = 'knightfall';
 
insert into t_nota (texto, fk_autor)
values ('ola wapa 7u7', 'charli'),('ola wapo uwu', 'lele'),('arr 7u7', 'charli'),('OwO', 'lele');

select * from t_nota;

select * from t_nota where (? is null or texto like concat("%", ?,"%")) and 
(? is null or etiqueta like concat("%", ?, "%")) and fk_autor = ?;
 
select t_usuario.nombre_Usuario as 'Nombre de usuario', t_usuario.contraseña from t_usuario;
 
select t_usuario.nombre_Usuario as 'Nombre de usuario', t_nota.texto as 'Nota' 
from t_usuario inner join t_nota on t_usuario.nombre_Usuario = t_nota.fk_autor
order by t_nota.id asc;
 
select t_usuario.nombre_Usuario, count(t_nota.texto) as 'numero de notas' from t_usuario 
left join t_nota on t_usuario.nombre_Usuario = t_nota.fk_autor
group by t_usuario.nombre_Usuario;
 
update t_usuario set contraseña = '1234', correo = 'charli@ola.com' where nombre_Usuario = 'charli';

call sp_insertar ('charli','1234','charli@ola.com','abcde1234', 'carlos','robles', 17/09/1997);
call sp_insertar ('lele','4321','lele@uwu.com','1234abcde', 'mariel','mata', 28/04/1998);
 
call sp_actualizar ('lele','4321','lele@OwO.com','1234abcde', 'mariel','mata', 28/04/1998);
 
call sp_eliminar ('lele');
 
call sp_insertarNota ('Ola ola olaola ola ola ola ola ola', 'lele');
call sp_insertarNota ('ola wapa 7u7', 'charli');
call sp_insertarNota ('ola wapo uwu', 'lele');
call sp_insertarNota ('arr 7u7', 'charli');
call sp_insertarNota ('OwO', 'lele');
 
call sp_actualizarNota(1,'adioadioadioadio');
 
call sp_elminarNota(1);
 
call sp_verUsuarios ();
 
call sp_verNotas ();
call sp_buscar('a',2);

SELECT * FROM t_nota WHERE fk_autor = 2 AND activa = 1 AND etiqueta = 'Saludo' ORDER BY fecha_Creacion DESC LIMIT 10