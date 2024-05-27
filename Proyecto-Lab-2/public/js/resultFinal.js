const btnImprimir= document.getElementById("btnImprimir");

btnImprimir.addEventListener("click", () => {
    

    // Obtener el contenido a imprimir
    var contenido = document.getElementById('contenido-a-imprimir').innerHTML;

    // Crear la ventana de impresión
    var ventanaImpresion = window.open('', '_blank');

    // Escribir el contenido HTML en la ventana de impresión
    ventanaImpresion.document.write('<html><head><title>Imprimir</title>');

    // Incluir los estilos en línea en el HTML que se imprimirá
    ventanaImpresion.document.write(`
    <style>
        /* Estilos generales */
        .titulo {
            font-size: 20px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .direccion, .telefono {
            display: block;
            font-size: 1em;
            color: #000000;
        }
        /* Estilos para la estructura de la información del paciente */
        .info-paciente {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #000;
        }
        .info-paciente .c2{
            width: auto;
            padding: 0 10px;
            margin-right: 10px;
        }
        .info-paciente .c1 {
            width: auto;
            padding: 0 10px;
            margin-left: 10px;
        }
        .info-paciente .c4 {
            padding-right:10px;
            display: flex;
            justify-content: space-between;
            margin-left: 10px;
        }
        .info-paciente h2 {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 1em;
            padding-right:10px;
        }
        /* Estilos específicos para la tabla */
        .centrado {
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 0.5em;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2a1;
        }
        .resaltado {
            background-color: rgb(255, 72, 0);
        }
        /* Estilos para los resultados */
        .resultado {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 1em;
        }
        .resultados-descripcion .c2 {
            width: auto;
            padding:5px;
            text-align: left;
        }
        .analis{
           text-align: left; 
           padding:5px;
        }
    
    </style>
`);


    // Cerrar la etiqueta head y abrir el cuerpo del documento
    ventanaImpresion.document.write('</head><body>');

    // Escribir el contenido HTML en el cuerpo del documento
    ventanaImpresion.document.write(contenido);

    // Cerrar el cuerpo y el HTML
    ventanaImpresion.document.write('</body></html>');

    // Cerrar el documento e imprimir
    ventanaImpresion.document.close();
    ventanaImpresion.print();
});

const btnEnviar= document.getElementById("btnEnviar");

btnEnviar.addEventListener("click",async() => {
    const rol = document.getElementById('rol').value;
    const idOrden = document.getElementById('idOrden').value;
    
    try {
        

        const respon = await fetch(`/orden/ordenFinal/estado_final/${idOrden}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
          
        });
        const data = await respon.json();

            if (respon.ok) {
              
                alert(`Envio Exitoso`);
                window.location.href='/usuario/listaPaciente/userPa/Administrador'
            } else {
                alert(`Error al Enviar`);
            }
    } catch (error) {
        console.error(error);
    }

})