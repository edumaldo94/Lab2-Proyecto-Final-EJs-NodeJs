
const frm = document.getElementById("frm-datos-paciente");

const radios= document.getElementsByName('sexo')
const fem  = document.getElementById('opFem')
const rol  = document.getElementById('rol').value;

radios.forEach(r=>{
    r.addEventListener('change', e=>{
        const check = document.getElementById('CheckEmbarazada')
            if(fem.checked){
                

                check.classList.remove('oculto')
            }else{
                
                check.classList.add('oculto')

            }
        
    })
})

frm.addEventListener('submit', async function(e) {
    e.preventDefault();

    const nombreInput = document.getElementById('nombre').value;
    const apellidoInput = document.getElementById('apellido').value;
    const dniInput = document.getElementById('dni').value;
    const fechaNacimientInput = document.getElementById('fecha_nacimient').value;
    /** Vamos a obtener el radio seleccionado en el sexo */
    const generoInput = document.getElementsByName('sexo');
    const checkEmbarazo = document.getElementById('embarazada')
    let gen
    generoInput.forEach(g=>{
        if(g.checked){
            gen=g.value
        }
    })
    let emb=null

    if(gen=="m" || gen=="M"){
        emb=null
    }else{
        emb= checkEmbarazo.checked
    }

    /*//////////////////////*/
    const provinciaInput = document.getElementById('provincia').value;
    const ciudadInput = document.getElementById('ciudad').value;
     const direccionInput = document.getElementById('direccion').value;
    const telInput = document.getElementById('tel').value;
    const emailInput = document.getElementById('email').value;


    try {
        const response = await fetch('/persona/create', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nombre: nombreInput,
                apellido: apellidoInput,
                dni: dniInput,
                fecha_nacimient: fechaNacimientInput,
                genero: gen,
                embarazada: emb, 
                provincia:provinciaInput,
                ciudad:ciudadInput,
                direccion: direccionInput,
                tel: telInput,
                email: emailInput
            })
        });

        const data = await response.json();

        if (response.ok) {
          alert('Persona creada correctamente');
           window.location.href = `/persona/panel-te/${dniInput}/${rol}`;

        } else {
          
            // Mostrar mensaje de error al usuario
            alert('DNI duplicado');
            // Restaurar los valores en el formulario
            document.getElementById('nombreInput').value = nombreInput;
            document.getElementById('apellidoInput').value = apellidoInput;
            document.getElementById('dniInput').value = dniInput;
            document.getElementById('fechaNacimientInput').value = fechaNacimientInput;
            document.getElementById('provinciaInput').value = provinciaInput;
            document.getElementById('ciudadInput').value = ciudadInput;
            document.getElementById('direccionInput').value = direccionInput;
            document.getElementById('telInput').value = telInput;
            document.getElementById('emailInput').value = emailInput;
    
}
    } catch (error) {

        console.error('Error:', error);
    }
});
