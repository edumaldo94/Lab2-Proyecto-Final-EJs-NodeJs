


const btn_buscarP = document.getElementById('buscarPaciente');
const btn_listaP = document.getElementById('listaPaciente');
const rol = document.getElementById('rol').value;

btn_listaP.addEventListener('click', async() => {
    window.location.href = `/usuario/listaPaciente/userPa/${rol}`;
});

btn_buscarP.addEventListener('click', async() => {
    const valor = document.getElementById('dni-paciente-search').value;
    const email = document.getElementById('email-paciente-search');

    const emailValue = email.value;
    if (valor.length === 8) {
       // window.location.href = `/persona/panel-te/${valor}/${rol}`;
        var veri=window.location.href = `/persona/panel-te/${valor}/${rol}`;
    
    } else if (emailValue && validateEmail(emailValue)) {
        window.location.href = `/persona/porEmail/userEmail/${emailValue}/${rol}`;
    } else {
        alert("Por favor, ingrese un documento válido de 8 números o un correo electrónico.");
    }
    
});

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}
/*




const btn_personal= document.getElementById('entrar-personal')
const btn_buscarP= document.getElementById('buscarPaciente')
const btn_listaP= document.getElementById('listaPaciente')
const rol = document.getElementById('rol').value

btn_listaP.addEventListener('click',()=>{
    window.location.href = `/usuario/listaPaciente/userPa/${rol}`;
})


btn_buscarP.addEventListener('click',  ()=>{
  
    let valor = document.getElementById('dni-paciente-search').value   
let email = document.getElementById('email-paciente-search').value


    //window.location.assign(`persona/dni/${valor}`)
     
if(valor.length === 8){
          var veri=window.location.href = `/persona/panel-te/${valor}/${rol}`;
alert("Persona no registrada")
if(veri){
   
    crearPersona.style.display = 'inline';
}else{
    
}

}else if(email){
    window.location.href = `/persona/porEmail/userEmail/${email}/${rol}`;
}
else{
          crearPersona.style.display = 'inline';
}
   // fetch('./panel-paciente') 35765481
   
  

})
 */





