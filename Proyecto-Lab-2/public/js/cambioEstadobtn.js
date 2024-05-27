const btnVerificar= document.getElementById('verificar')
//const btnValidar= document.getElementById('btnParaValidar')
const btnInformar= document.getElementById('btnInformar')

const nombre = document.getElementById('nombreInput').value
const apellido = document.getElementById('apellidoInput').value


btnInformar.addEventListener('click', async()=>{
  let id_e= document.getElementById('id_examen').value
  const idOrden= document.getElementById('id_orden').value
  const resultado= document.getElementById('exaResult').value
const descripcion= document.getElementById('exaDescripcion').value
  const idestadoCambio= 5;
  try {
    const responseExamen = await fetch(`/examen/examenes/exa/ResultYdes/${id_e}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ resultado, descripcion })
    });

    if (!responseExamen.ok) {
      throw new Error('Error al actualizar el examen');
    }

    const responseEstado = await fetch(`/cambio_estado/camEstadoAnaOesp/${idestadoCambio}/${idOrden}/${id_e}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    const dataEstado = await responseEstado.json();

    if (responseEstado.ok) {
      console.log('Cambio de estado realizado con éxito.');
      window.location.href = `/page-Bioquimico?nombre=${nombre}&apellido=${apellido}`;
     // window.location.href = `${data.redirectTo}?nombre=${nombre}&apellido=${apellido}`
    } else {
      console.error('Error al realizar el cambio de estado:', dataEstado.error);
    }
  } catch (error) {
    console.error('Error:', error);
  }
})

btnVerificar.addEventListener('click', async ()=>{

  let id_e= document.getElementById('id_examen').value
    const idorden= document.getElementById('id_orden').value
  //  alert(id_e+' '+idorden)

console.log('clickeaste')
   const verificar= await fetch(`/cambio_estado/cambiarEstado/${idorden}/${id_e}`)
   const response = await fetch(`/examen/examenes/cambioEstadoAcero/exEstadoCero/${id_e}`, {
    method: 'PUT',
    headers: {
        'Content-Type': 'application/json'
    },
  
});

if(verificar){
    window.location.href=`/page-Bioquimico?nombre=${nombre}&apellido=${apellido}`

}else{
  console.log('no se pudo efectuar el cambio de estado')  
}

})
/*
btnValidar.addEventListener('click', async ()=>{
alert("Ver")
  const idorden= document.getElementById('id_orden').value

console.log('clickeaste')
 const verificar= await fetch(`/cambio_estado/camEstadoValidar/${idorden}`)

if(verificar){
  window.location.href='/page-Tecnico'

}else{
console.log('no se pudo efectuar el cambio de estado')  
}

})*/