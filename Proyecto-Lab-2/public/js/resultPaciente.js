
const btnOrdTerminada= document.getElementById(`btnOrdTerminada`)
const dniP= document.getElementById('dni').value
    const rol= document.getElementById('rol').value

const btnEtiquetas = document.querySelectorAll('.btnEtiqueta');

btnEtiquetas.forEach(btnEtiqueta => {
    btnEtiqueta.addEventListener('click', (event) => {
    
        const index = event.target.value;
        const sexo = document.getElementById('sexo').value;
     
        const idExamenesArray = [];
        const idOrdenArray = [];
        const idOrdenElements = document.querySelectorAll("#id_orden555");
        const idExamenesElements2 = document.getElementById(`id_examen1_${index}`);
        const idExamenesElements = document.querySelectorAll("#id_examen");
        idExamenesElements.forEach(element => {
            idExamenesArray.push(element.value);
        });
        idOrdenElements.forEach(element => {
          idOrdenArray.push(element.value);
      });
        const elemento = idOrdenArray.length;

        try {
            let url;
            if (idOrdenArray.includes(index) && idOrdenArray[elemento-1] === index) {
              // Si es así, no realizar ninguna acción
              console.log(`El índice ${index} ya ha sido seleccionado anteriormente y tiene el mismo valor.`);
              const currentIndex = idOrdenArray.indexOf(index);
    
              // Eliminar el elemento actual del arreglo
              idOrdenArray.splice(currentIndex, 1);
              
              // Agregar el elemento al final del arreglo
              idOrdenArray.push(index);
              idOrdenArray.reverse();
              console.log("oo"+idOrdenArray);
          }
            if (idOrdenArray.length > 1 && idOrdenArray[elemento-1] != index) {
              
              // url = `/determinacion/resultados-examenes/${idExamenesElements2}/${sexo}/${index}/${rol}`;
           //    url = `/determinacion/paraValidar/${idExamenesElements2.value}/${sexo}/${index}/${rol}`;
               url = `/determinacion/resultados-examenes/${idExamenesElements2.value}/${sexo}/${index}/${rol}`;
            } else {
               // url = `/determinacion/paraValidar/${idExamenesElements2.value}/${sexo}/${index}/${rol}`;
               url = `/determinacion/resultados-examenes/${idExamenesArray}/${sexo}/${index}/${rol}`;
              }
            window.location.href = url;
        } catch (error) {
            console.error('Error:', error);
        }
    });
});
