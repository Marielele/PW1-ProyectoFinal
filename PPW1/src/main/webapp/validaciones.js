$(document).ready(function () {

});
let valido = false;

function validarNuevaNota() {
    let textoarea = $("#areatexto").val();

    if (!$.trim(textoarea)) {
        console.log("No ha ingresado texto en la nota");
        return valido;
    }
}

function validaBorrarNota() {
    let notaAborrar = $("#notaABorrar").val();
    var soloNum = /^[0-9]+$/;

    if (notaAborrar.length == 0) {
        console.log("No ha ingresado una nota para borrar");
        return valido;
    }
    if (!soloNum.test(notaAborrar)) {
        console.log("Ingrese valores numericos");
        return valido;
    } else {
        console.log("Seguro que desea borrar la nota?");
        valido = true;
        return valido;
    }
}

function validaEditarUsuario() {
    let nombre = $("#name").val();
    let apellidos = $("#apellidos").val();
    let pass = $("#pass").val();
    let email = $("#email").val();
    let dia = $("#dia").val();
    let mes = $("#mes").val();
    let anio = $("#anio").val();
    const pattern = new RegExp('^[A-Z]+$', 'i');
    const letrasRegex = /^[a-zA-Z_ ]*$/;
    const emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
    var soloNum = /^[0-9]+$/;
    let diaMin = 1;
    let diaMax;
    let mesMax = 12;
    let mesMin = 1;
    let añoMax = 2020;
    let añoMin = 1920;

    if ($('#avatar').length === 0 || nombre.length < 1 ||
            apellidos.length < 1 || pass.length < 1 || email.length < 1 ||
            dia.length < 1 || mes.length < 1 || anio.length < 1) {
        console.log("No se permiten campos vacios");
        return valido;
    } else if (!letrasRegex.test(nombre) || !letrasRegex.test(apellidos)) {
        console.log("Solo caracteres de letras");
        return valido;
    } else if (!emailRegex.test(email)) {
        console.log("Email no valido");
        return valido;
    } else if (!soloNum.test(dia) || !soloNum.test(mes) || !soloNum.test(anio)) {
        console.log("Solo caracteres numericos para los dia, mes y año");
        return valido;
    } else if (anio > añoMax || anio <= añoMin) {
        console.log("Año no válido");
        return valido;
    } else if (mes > mesMax || mes < mesMin) {
        console.log("Mes no válido");
        return valido;
    } else if (mes === 1 || mes === 3 || mes === 5 || mes === 7 ||
            mes === 8 || mes === 10 || mes === 12) {
        diaMax = 31;
        if (dia < diaMin || dia > diaMax) {
            console.log("Día no válido");
            return valido;
        }
    } else if (mes === 4 || mes === 6 || mes === 9 || mes === 11) {
        diaMax = 30;
        if (dia < diaMin || dia > diaMax) {
            console.log("Día no válido");
            return valido;
        }
    } else if (mes === 2) {
        diaMax = 28;
        if (dia < diaMin || dia > diaMax) {
            console.log("Día no válido");
            return valido;
        }
    } else if (!strongRegex.test(pass)) {
        console.log("Contraseña no válida");
        return valido;
    } else {
        valido = true;
        return valido;
    }
}
