delimiter $
create procedure sp_registrarU (in usuario varchar (50), in pass varchar (50), 
                                in email varchar (50), in avatar longblob, nom varchar (50), 
                                ape varchar (50), fecha date)
begin 
insert into t_usuario (nombre_Usuario, contrasena, correo, imagen, nombre, apellido, fecha_Nac)
values (usuario, pass, email, avatar, nom, ape, fecha);
end $ 
 
delimiter $
create procedure sp_actualizarU (in usuario varchar (50), in pass varchar (50), 
                                in email varchar (50), in avatar longblob, nom varchar (50), 
                                ape varchar (50), fecha date)
begin 
update t_usuario 
set contrasena = pass, correo = email, imagen = avatar, nombre = nom, apellido = ape, fecha_Nac = fecha
where nombre_Usuario = usuario;
end $ 
 
delimiter $
create procedure sp_eliminarU (in usuario varchar (50))
begin 
delete from t_usuario where nombre_Usuario = usuario;
 
end $ 
 
delimiter $
create procedure sp_crearNota (in texto varchar (500), in fk varchar (50))
begin 
insert into t_nota (texto, fk_autor)
values (texto, fk);
 
end $ 
 
delimiter $
create procedure sp_actualizarNota (in idNota int, in textoNota varchar (500))
begin 
update t_nota 
set texto = textoNota
where id = idNota;
end $ 
 
delimiter $
create procedure sp_elminarNota (in idNota int)
begin 
delete from t_nota where id = idNota;
end $ 
 
delimiter $
create procedure sp_IniciarSesion (in usuario varchar (50), in pass varchar (50))
begin 
select * from t_usuario where nombre_Usuario = usuario and contrasena = pass;
end $ 

delimiter $
create procedure sp_editarUsuario (in username varchar(50), in nombreUsuario varchar (50), in apellidos varchar(50), 
								   in email varchar(50), in passw varchar(50), in foto longblob,
                                   in dayy varchar(10), in monthh varchar(10),in yearr varchar(10))
begin 
update t_usuario 
set nombre = nombreUsuario, apellido = apellidos, correo = email, 
			 contrasena = passw, imagen = foto, dia = dayy, mes = monthh, anio = yearr
where nombre_Usuario = username;
end $ 

delimiter $
create procedure sp_buscar (in txt varchar(500), in autor int)
begin
select * from t_nota where activa = 1 and fk_autor = autor and ((txt is null or texto like concat("%", txt,"%"))
or (txt is null or etiqueta like concat("%", txt, "%")));
end $
drop procedure sp_buscar;
