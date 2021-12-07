$(document).ready(function () {
    //$("#ingresa").click(validaSesion);
    //$("#Register").submit(validaRegistro);
});

function validaSesion() {
    let user = $("#user").val();
    let pass = $("#pass").val();
    let valido = false;

    if (user.length < 1 || pass.length < 1) {
        $(".errorsito").append("<div class='dentro espacio3' id='errorsaso'><p class='error letras'><b>Ingrese datos faltantes</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Ingrese usuario y/o contraseña");
        return valido;
    } else {
        valido = true;
        return valido;
    }
}

function validaRegistro() {
    let valido = false;
    let nombre = $("#name").val();
    let apellidos = $("#apellidos").val();
    let user = $("#user").val();
    let pass = $("#pass").val();
    let confirmpass = $("#confirmpass").val();
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

    if ($('#avatar').get(0).files.length === 0 || nombre.length < 1 ||
            apellidos.length < 1 || user.length < 1 ||
            pass.length < 1 || confirmpass.length < 1 || email.length < 1 ||
            dia.length < 1 || mes.length < 1 || anio.length < 1) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese datos faltantes</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("No files selected.");
        return valido;
    } else if (!letrasRegex.test(nombre) || !letrasRegex.test(apellidos)) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese Nombre y/o Apellido válido</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Nombre y/o apellido no válido");
        return valido;
    } else if (!emailRegex.test(email)) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese email válido</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Email no válido");
        return valido;
    } else if (!soloNum.test(dia) || !soloNum.test(mes) || !soloNum.test(anio)) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese valores numéricos</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("No ingreso números");
        return valido;
    } else if (anio > añoMax || anio <= añoMin) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese año válido</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Año no válido");
        return valido;
    } else if (mes > mesMax || mes < mesMin) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese mes válido</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Mes no válido");
        return valido;
    } else if (mes === 1 || mes === 3 || mes === 5 || mes === 7 ||
            mes === 8 || mes === 10 || mes === 12) {
        diaMax = 31;
        if (dia < diaMin || dia > diaMax) {
            $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese dia válido</b></p></div>");
            $("#errorsaso").fadeOut(6000);
            console.log("Día no válido");
            return valido;
        }
    } else if (mes === 4 || mes === 6 || mes === 9 || mes === 11) {
        diaMax = 30;
        if (dia < diaMin || dia > diaMax) {
            $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese dia válido</b></p></div>");
            $("#errorsaso").fadeOut(6000);
            console.log("Día no válido");
            return valido;
        }
    } else if (mes === 2) {
        diaMax = 28;
        if (dia < diaMin || dia > diaMax) {
            $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese dia válido</b></p></div>");
            $("#errorsaso").fadeOut(6000);
            console.log("Día no válido");
            return valido;
        }
    } else if (!strongRegex.test(pass)) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Ingrese contraseña válida</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Contraseña no válida");
        return valido;
    } else if (!(pass === confirmpass)) {
        $("#divuno").append("<div class='dentro espacio2' id='errorsaso'><p class='error letras'><b>Las contraseñas no coinciden</b></p></div>");
        $("#errorsaso").fadeOut(6000);
        console.log("Contraseña no válida");
        return valido;
    } else {
        valido = true;
        return valido;
    }
}
