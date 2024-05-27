/////////////////////////////////////////////PACIENTE LIGIN /////////////////////////////////////////////////////////
const btnPaciente= document.getElementById('btnPaciente')
const btnCambiarClave= document.getElementById('cambiarClaves')
btnCambiarClave.addEventListener('click',()=> {
    // Redirige al usuario a la página de restablecimiento
      window.location.assign(`/usuario/reseteo_password`); 
    });
btnPaciente.addEventListener('click', async()=>{
    const dni = document.getElementById('dniIdP').value;
    const claveq = document.getElementById('claveIdP').value;

    
    try {
        const response =  await fetch('/usuario/userPacient/pa_ci_en_te/pacienTe', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                dni:dni,
                clave:claveq
            
            })
        });
      
        const data = await response.json();
        document.getElementById('errordni').textContent = '';
        document.getElementById('errorclave').textContent = '';
     
        if (data.ok) {
            if (data.redirectTo) {
             window.location.href = `${data.redirectTo}/${dni}/${data.rol}`;
            /*   const response =  await fetch(`/persona/pacien_te/orden_final/${dniq}/${data.rol}`, {
                method: 'GET',
        });*/
      
            } else {
                alert('Eres Personal, se te va a redireccionar')
                window.location.href='/portal-personal'
            }
            document.getElementById('dniIdP').value = '';
            document.getElementById('claveIdP').value = '';
       } 
       if (data.error === "Contraseña incorrecta") {
        console.log(data)
           document.getElementById(`errorclave`).textContent = data.error;
   
        }else if(data.error === "Documento no esta registrado"){
           document.getElementById(`errordni`).textContent = data.error;
        }
        if (data.errores) {
            data.errores.forEach(error => {
                const campo = error.path;
                const mensaje = error.msg;
                // Mostrar mensaje de error en el campo correspondiente
                document.getElementById(`error${campo}`).textContent = mensaje;
            });
          
        }

    } catch (error) {
        console.error('Error:', error);
    }
    

})