const sequelize = require("../config/database"); // Asegúrate de importar sequelize y configurarlo correctamente
const consulta = require("../db/consulta");
const examenController = require("../controllers/examenController");
const muestraControler = require("../controllers/muestraController");
const Orden = require("../models/orden");
const Pedido = require("../models/pedido"); // Asegúrate de importar los modelos necesarios
const Persona = require("../models/persona");
const Analisis = require("../models/analisis");
const Examen = require("../models/examen");
const Muestra = require("../models/muestra");
const CambioEstado = require("../models/cambio_estado");
const GuiaMuestra = require("../models/guia_muestra");
const registro_valores = require("../models/registro_valores");
const Estado = require("../models/estado");

/** PROBANDO */

/*////////////////////////////////*/

const list = async (req, res) => {
  try {
    const orden = await Orden.findAll();
    res.json(orden);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getById = async (req, res) => {
  const { id } = req.params;
  try {
    const orden = await Orden.findByPk(id);
    if (orden) {
      res.json(orden);
    } else {
      res.status(404).json({ error: "Orden no encontrada" });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const obtenerDatosOrdenes = async () => {
  try {
    const ordenes = await Orden.findAll();
    return ordenes;
  } catch (error) {
    throw new Error("Error al obtener datos de órdenes");
  }
};

const buscarPorId = async (req, res) => {
  const { id } = req.params;

  Orden.findOne({
    attributes: [],
    include: [
      {
        model: Pedido,
        attributes: ["diagnostico", "nombre_medico", "nro_matricula"],
        as: "pedido",
        include: [
          {
            model: Persona,
            attributes: [
              "nombre",
              "apellido",
              [
                sequelize.literal("YEAR(CURDATE()) - YEAR(fecha_nacimient)"),
                "edad",
              ],
            ],
            as: "persona",
          },
        ],
      },
      {
        model: Analisis,
        attributes: ["descripcion"],
        as: "analisis",
      },
      {
        model: Examen,
        attributes: [],
        as: "examen",
      },
      {
        model: Muestra,
        attributes: ["tipo_muestra"],
        as: "muestra",
      },
    ],
    where: {
      id_orden: id,
    },
    // distinct: true,
    raw: true,
  })
    .then((result) => {
    
      res.render("vistaOrden", { rol: "", result });
      // res.json(resultado); // Agrega esta línea para enviar el resultado como respuesta
    })
    .catch((error) => {
      console.error("Error al realizar la consulta:", error);
      res.status(500).json({ error: error.message }); // En caso de error, enviar un mensaje de error 500
    });
};

const listarPorID = async (req, res) => {
  const { id } = req.params;
  const { rol } = req.params;
  const {nombre, apellido} = req.query;
  try {
    const orden = await Orden.findOne({
      attributes: [
        "id_orden",
        "estado",
        "fecha_creacion",
        "fecha_entrega",
        "prioridad",
        "estado"
      ],
      include: [
        {
          model: Pedido,
          attributes: ["diagnostico", "nombre_medico", "nro_matricula"],
          include: [
            {
              model: Persona,
              attributes: [
                "id_persona",
                "nombre",
                "apellido",
                "dni",
                "genero",
                [
                  sequelize.literal("YEAR(CURDATE()) - YEAR(fecha_nacimient)"),
                  "edad",
                ],
              ],
              as: "persona",
            },
          ],
          as: "pedido",
        },
        {
          model: Analisis,
          attributes: ["descripcion", "tipo"],
          as: "analisis",
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const muestras = await Muestra.findAll({
      attributes: ["id_orden", "entregado", "fecha_recoleccion"],
      include: [
        {
          model: Orden,
          attributes: [],
          as: "orden",
        },
        {
          model: GuiaMuestra,
          attributes: ["id_guiaM", "g_descripcion", "id_analisis"],
          as: "guia_muestra",
          include: [
            {
              model: Analisis,
              attributes: ["id_analisis", "descripcion"],
              as: "analisis",
            },
          ],
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const examen = await Examen.findAll({
      attributes: [
        "id_examen",
        "id_orden",
        "descripcion",
        "resultado",
        "fecha_resultado",
        "ex_estado",
      ],
      include: [
        {
          model: Analisis,
          attributes: ["id_analisis", "descripcion"],
          as: "analisis",
        },
      ],
      where: {
        id_orden: id,
      },
    });
    const idExamen = await examen.map((exa) => exa.id_examen);
    const registroValores = await registro_valores.findAll({
      attributes: ["id_reg", "id_determinacion", "id_examen", "valor"],
      where: {
        id_examen: idExamen,
      },
    });

    const cambioEstado = await CambioEstado.findAll({
      attributes: ["id", "id_orden", "id_estado", "id_examen", "fecha"],
      as: "cambioEstado",
      include: [
        {
          model: Estado,
          attributes: ["nombre"],
          as: "estado",
        },
      ],
      where: {
        id_examen: idExamen,
      },
    });
    const resOrd = await Promise.all(
      examen.map(async (ex) => {
        const ultimoCambio = calcularUltimosCambios(
          cambioEstado.filter((c) => c.id_examen === ex.id_examen)
        );
        return {
          examen: ex,
          ultimoCambio: ultimoCambio,
        };
      })
    );
    const ultimoCambioOrden = obtenerMenorIdEstado(resOrd);
    if (orden) {
 
    res.render("vistaOrden", { orden, muestras,examen, cambioEstado,resOrd,ultimoCambioOrden,registroValores,rol,nombre,apellido});
            //                res.json({orden,muestras, examen,cambioEstado,resOrd,ultimoCambioOrden, registroValores,rol});
      /*
     res.json({
      ok: true,
      orden: orden,
      muestras: muestras,
      examen: examen,
      cambioEstado: cambioEstado,
      registroValores: registroValores
      rol: ''
    });
    */
    } else {
      // Devolver JSON si la orden no se encuentra
      res.json({
        ok: false,
        error: "No se encontró la orden con el ID proporcionado.",
      });
    }
  } catch (error) {
    console.error("Error:", error);
    // Devolver JSON en caso de error
    res.json({
      ok: false,
      error: "Error en el servidor al procesar la solicitud.",
    });
  }
};
const calcularUltimosCambios = (cambiosEstado) => {
  const ultimosCambiosMap = new Map();

  cambiosEstado.forEach((cambio) => {
    if (!ultimosCambiosMap.has(cambio.id_examen)) {
      ultimosCambiosMap.set(cambio.id_examen, cambio);
    } else {
      const actual = ultimosCambiosMap.get(cambio.id_examen);
      if (cambio.fecha > actual.fecha) {
        ultimosCambiosMap.set(cambio.id_examen, cambio);
      }
    }
  });

  let menorIdEstado = 6; // Empezamos con un valor mayor que 5

  for (const cambio of ultimosCambiosMap.values()) {
    if (cambio.id_estado < menorIdEstado) {
      menorIdEstado = cambio.id_estado;
    }
  }

  for (const cambio of ultimosCambiosMap.values()) {
    if (cambio.id_estado === menorIdEstado) {
      return cambio;
    }
  }

  return null; // No se encontró ningún cambio con id_estado de 1 a 5
};
const obtenerMenorIdEstado = (resOrd) => {
  let menorIdEstadoCambio = null;

  // Iterar sobre cada elemento de resOrd
  resOrd.forEach((item) => {
    const ultimoCambio = item.ultimoCambio;

    // Verificar si ya se ha encontrado un cambio con un id_estado menor
    if (
      !menorIdEstadoCambio ||
      ultimoCambio.id_estado < menorIdEstadoCambio.id_estado
    ) {
      menorIdEstadoCambio = ultimoCambio;
    }
  });

  return menorIdEstadoCambio;
};



const cambioPrioridad = async (
  idPedido,
  fechacreacion,
  fechaEntrega,
  valorPrioridad
) => {
  try {
    const ordenExistente = await Orden.findOne({
      where: { id_pedido: idPedido },
    });
    if (ordenExistente) {
      await ordenExistente.update({
        fecha_creacion: fechacreacion,
        fecha_entrega: fechaEntrega,
        prioridad: valorPrioridad,
      });
     
      return ordenExistente;
    } else {
      console.log(
        "No se encontró ninguna orden con el ID de pedido proporcionado."
      );
      return null;
    }
  } catch (error) {
    throw new Error("Error al Crear Examen");
  }
};

const crearOrden = async (
  idPedido,
  estado,
  fechaCreacion,
  fechaEntrega,
  valorPrioridad,
  estadoOrden,
  estado_final,
  analisisMuestras
) => {
  try {
    const ordenExistente = await Orden.findOne({
      where: { id_pedido: idPedido },
    });

    if (ordenExistente) {
      // La orden ya existe, puedes manejar esto como desees

     
      try {
        analisisMuestras.forEach(async (a) => {
          const examenCreado = await examenController.crearExamen(
            ordenExistente.id_orden,
            "",
            null,
            null,
            a.id_analisis
          );
          const nuevoCambioEstado = {
            id_estado: estadoOrden,
            id_orden: ordenExistente.id_orden,
            id_examen: examenCreado.id_examen,
            fecha: fecha_hoy(),
          };

          const cambioEstado = await CambioEstado.create(nuevoCambioEstado);
          a.muestras.forEach(async (m) => {
            await muestraControler.crear(
              ordenExistente.id_orden,
              m.entregado ? fecha_hoy() : null,
              m.entregado,
              m.dato
            );
          });
        });
      } catch (error) {
        throw new Error("Error al Crear Examen");
      }
      return ordenExistente;
    } else {
      // La orden no existe, puedes crear una nueva
      console.log("Estadoid "+estadoOrden)
      const nuevaOrden = {
        id_pedido: idPedido,
        id_analisis: null,
        estado: estado,
        estado_final:estado_final,
        fecha_creacion: fechaCreacion,
        fecha_entrega: fechaEntrega,
        prioridad: valorPrioridad,
      };

      const ordenCreada = await Orden.create(nuevaOrden);
    
      try {
        analisisMuestras.forEach(async (a) => {
          const examenCreado = await examenController.crearExamen(
            ordenCreada.id_orden,
            "",
            null,
            null,
            a.id_analisis
          );
          const nuevoCambioEstado = {
            id_estado: estadoOrden,
            id_orden: ordenCreada.id_orden,
            id_examen: examenCreado.id_examen,
            fecha: fecha_hoy(),
          };
          const cambioEstado = await CambioEstado.create(nuevoCambioEstado);
          a.muestras.forEach(async (m) => {
            await muestraControler.crear(
              ordenCreada.id_orden,
              m.entregado ? fecha_hoy() : null,
              m.entregado,
              m.dato
            );
          });
        });
      } catch (error) {
        throw new Error("Error al Crear Examen");
      }
      return ordenCreada;
    }

    /*mstrs.forEach(m=>{
        const fecha= m.entregado ? fecha_hoy() : null
        Muestra.create({
          id_orden: ordenCreada.id_orden,
          fecha_recoleccion: fecha,
          tipo_muestra: m.nombre_muestra,
          entregado: m.entregado
          
        })
      })*/
  } catch (error) {
    throw new Error("Error al crear la orden");
  }
};
const crearOrdenPrincipal = async (
  idPedido,
  estado,
  fechaCreacion,
  fechaEntrega,
  valorPrioridad,
  estado_final,
  analisisMuestras
) => {
  try {
    const ordenExistente = await Orden.findOne({
      where: { id_pedido: idPedido },
    });

    const crearCambiosEstadoYMuestras = async (ordenId, examenId, estadoOrden, muestras) => {
      const nuevoCambioEstado = {
        id_estado: estadoOrden,
        id_orden: ordenId,
        id_examen: examenId,
        fecha: fecha_hoy(),
      };

      const cambioEstado = await CambioEstado.create(nuevoCambioEstado);

      muestras.forEach(async (m) => {
        await muestraControler.crear(
          ordenId,
          m.entregado ? fecha_hoy() : null,
          m.entregado,
          m.dato
        );
      });
    };

    if (ordenExistente) {
      analisisMuestras.forEach(async (a) => {
        const examenCreado = await examenController.crearExamen(
          ordenExistente.id_orden,
          "",
          null,
          null,
          a.id_analisis
        );
        await crearCambiosEstadoYMuestras(ordenExistente.id_orden, examenCreado.id_examen, a.estado, a.muestras);
      });
      return ordenExistente;
    } else {
      const nuevaOrden = {
        id_pedido: idPedido,
        id_analisis: null,
        estado: estado,
        estado_final: estado_final,
        fecha_creacion: fechaCreacion,
        fecha_entrega: fechaEntrega,
        prioridad: valorPrioridad,
      };

      const ordenCreada = await Orden.create(nuevaOrden);

      analisisMuestras.forEach(async (a) => {
        const examenCreado = await examenController.crearExamen(
          ordenCreada.id_orden,
          "",
          null,
          null,
          a.id_analisis
        );
        await crearCambiosEstadoYMuestras(ordenCreada.id_orden, examenCreado.id_examen, a.estado, a.muestras);
      });
      return ordenCreada;
    }
  } catch (error) {
    throw new Error("Error al crear la orden");
  }
};

const procesarAnalisisMuestras = async (idOrden, analisisMuestras, estadoOrden) => {
  try {
      for (const a of analisisMuestras) {
          const examenCreado = await examenController.crearExamen(
              idOrden,
              "",
              null,
              null,
              a.id_analisis
          );

          const nuevoCambioEstado = {
              id_estado: estadoOrden,
              id_orden: idOrden,
              id_examen: examenCreado.id_examen,
              fecha: fecha_hoy(),
          };

          await CambioEstado.create(nuevoCambioEstado);

          for (const m of a.muestras) {
              await muestraControler.crear(
                  idOrden,
                  m.entregado ? fecha_hoy() : null,
                  m.entregado,
                  m.dato
              );
          }
      }
  } catch (error) {
      console.error('Error al procesar los análisis y muestras:', error);
      throw new Error("Error al procesar los análisis y muestras");
  }
};
function fecha_hoy() {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0"); // Asegura que el mes tenga dos dígitos
  const day = String(now.getDate()).padStart(2, "0"); // Asegura que el día tenga dos dígitos
  const hour = String(now.getHours()).padStart(2, "0"); // Asegura que la hora tenga dos dígitos
  const minute = String(now.getMinutes()).padStart(2, "0"); // Asegura que los minutos tengan dos dígitos
  const second = String(now.getSeconds()).padStart(2, "0"); // Asegura que los segundos tengan dos dígitos

  const fechaHora = `${year}-${month}-${day} ${hour}:${minute}:${second}`;

  return fechaHora;
}
const obtenerDescripcionesAnalisis = async () => {
  try {
    const descripciones = await Analisis.findAll({
      attributes: ["descripcion"],
    });

    return descripciones.map((analisis) => analisis.descripcion);
  } catch (error) {
    throw new Error(
      "Error al obtener descripciones de análisis: " + error.message
    );
  }
};

const buscarPorEstado = async (est, cback) => {
  const query2 = `SELECT o.id_orden ,a.descripcion, e.nombre as est,o.fecha_creacion, o.prioridad,per.nombre as nombre_persona,per.apellido as apellido_persona,per.dni as dni_persona
    FROM orden o
    INNER JOIN cambio_estado ce ON o.id_orden = ce.id_orden 
    JOIN estado as e on e.id_estado=ce.id_estado 
    JOIN examen as ex on ex.id_orden = o.id_orden
    JOIN analisis as a on a.id_analisis=ex.id_analisis
    JOIN pedido as p on p.id_pedido=o.id_pedido
    JOIN persona as per on per.id_persona=p.id_persona
    WHERE ce.id = (
      SELECT MAX(ce2.id)
      FROM cambio_estado ce2
      WHERE ce2.id_examen = ex.id_examen and ce.id_estado=${est}
  );`;

  sequelize
    .query(query2, { model: Orden, mapToModel: true, raw: false })
    .then((ordenes) => {
      // Aquí tenemos la lista de órdenes que cumplen con los criterios
      cback(ordenes);
   
    })
    .catch((err) => {
      console.error("Error:", err);
    });
};
/*
  const buscarPorEstado = async (est, cback)=>{
    
    const query2 = `SELECT o.id_orden ,a.descripcion, e.nombre as est,o.fecha_creacion, per.nombre as nombre_persona,per.apellido as apellido_persona,per.dni as dni_persona
    FROM orden o
    INNER JOIN cambio_estado ce ON o.id_orden = ce.id_orden 
    JOIN estado as e on e.id_estado=ce.id_estado 
    JOIN examen as ex on ex.id_orden = o.id_orden
    JOIN analisis as a on a.id_analisis=ex.id_analisis
    JOIN pedido as p on p.id_pedido=o.id_pedido
    JOIN persona as per on per.id_persona=p.id_persona
   WHERE  ce.id = (
        SELECT MAX(ce2.id)
        FROM cambio_estado ce2
        WHERE ce2.id_orden = o.id_orden and ce.id_estado=${est}
    )`



    const query2 = `SELECT 
    o.id_orden,
    o.fecha_creacion,
    per.nombre AS nombre_persona,
    per.apellido AS apellido_persona,
    per.dni AS dni_persona
FROM 
    orden o
JOIN 
    pedido AS p ON p.id_pedido = o.id_pedido
JOIN 
    persona AS per ON per.id_persona = p.id_persona
WHERE 
    per.dni = 35765481;`

      sequelize.query(query2,{model: Orden,mapToModel: true,raw: false})
      .then(ordenes => {
        // Aquí tenemos la lista de órdenes que cumplen con los criterios
        cback(ordenes)
        console.log(ordenes);
      })
      .catch(err => {
        console.error('Error:', err);
      });
    

      
  }*/
const buscarPreinfo = async (cback) => {
  const query2 = `SELECT o.id_orden ,a.descripcion, e.nombre as est,o.fecha_creacion,o.prioridad, per.nombre as nombre_persona,per.apellido as apellido_persona,per.dni as dni_persona, per.genero as genero_persona
    FROM orden o
    INNER JOIN cambio_estado ce ON o.id_orden = ce.id_orden 
    JOIN estado as e on e.id_estado=ce.id_estado 
    JOIN examen as ex on ex.id_orden = o.id_orden
    JOIN analisis as a on a.id_analisis=ex.id_analisis
    JOIN pedido as p on p.id_pedido=o.id_pedido
    JOIN persona as per on per.id_persona=p.id_persona
    WHERE ce.id = (
      SELECT MAX(ce2.id)
      FROM cambio_estado ce2
      WHERE ce2.id_examen = ex.id_examen and ce.id_estado=3
  );`;

  sequelize
    .query(query2, { model: Orden, mapToModel: true, raw: false })
    .then((ordenes2) => {
      cback(ordenes2);
      
    })
    .catch((err) => {
      console.error("Error:", err);
    });
};
const buscarParaValidar = async (cback) => {
  const query2 = `SELECT o.id_orden ,a.descripcion, e.nombre as est,ex.id_examen,o.fecha_creacion,o.fecha_entrega, o.prioridad,per.nombre as nombre_persona,per.apellido as apellido_persona,per.dni as dni_persona, per.genero as genero_persona
    FROM orden o
    INNER JOIN cambio_estado ce ON o.id_orden = ce.id_orden 
    JOIN estado as e on e.id_estado=ce.id_estado 
    JOIN examen as ex on ex.id_orden = o.id_orden
    JOIN analisis as a on a.id_analisis=ex.id_analisis
    JOIN pedido as p on p.id_pedido=o.id_pedido
    JOIN persona as per on per.id_persona=p.id_persona
    WHERE ce.id = (
      SELECT MAX(ce2.id)
      FROM cambio_estado ce2
      WHERE ce2.id_examen = ex.id_examen and ce.id_estado=4
  );`;

  sequelize
    .query(query2, { model: Orden, mapToModel: true, raw: false })
    .then((ordenes) => {
      // Aquí tenemos la lista de órdenes que cumplen con los criterios
      cback(ordenes);

    })
    .catch((err) => {
      console.error("Error:", err);
    });
};

const listarPorIDpreInfo = async (req, res) => {
  const { id } = req.params;
  const {nombre, apellido} = req.query;
  const { rol } = req.params;
  try {
    const orden = await Orden.findOne({
      attributes: [
        "id_orden",
        "estado",
        "fecha_creacion",
        "fecha_entrega",
        "prioridad",
        "estado"
      ],
      include: [
        {
          model: Pedido,
          attributes: ["diagnostico", "nombre_medico", "nro_matricula"],
          include: [
            {
              model: Persona,
              attributes: [
                "id_persona",
                "nombre",
                "apellido",
                "dni",
                "genero",
                [
                  sequelize.literal("YEAR(CURDATE()) - YEAR(fecha_nacimient)"),
                  "edad",
                ],
              ],
              as: "persona",
            },
          ],
          as: "pedido",
        },
        {
          model: Analisis,
          attributes: ["descripcion", "tipo"],
          as: "analisis",
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const muestras = await Muestra.findAll({
      attributes: ["id_orden", "entregado", "fecha_recoleccion"],
      include: [
        {
          model: Orden,
          attributes: [],
          as: "orden",
        },
        {
          model: GuiaMuestra,
          attributes: ["id_guiaM", "g_descripcion", "id_analisis"],
          as: "guia_muestra",
          include: [
            {
              model: Analisis,
              attributes: ["id_analisis", "descripcion"],
              as: "analisis",
            },
          ],
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const examen = await Examen.findAll({
      attributes: [
        "id_examen",
        "id_orden",
        "descripcion",
        "resultado",
        "fecha_resultado",
        "ex_estado",
      ],
      include: [
        {
          model: Analisis,
          attributes: ["id_analisis", "descripcion"],
          as: "analisis",
        },
      ],
      where: {
        id_orden: id,
      },
    });
    const idExamen = await examen.map((exa) => exa.id_examen);
    const registroValores = await registro_valores.findAll({
      attributes: ["id_reg", "id_determinacion", "id_examen", "valor"],
      where: {
        id_examen: idExamen,
      },
    });

    const cambioEstado = await CambioEstado.findAll({
      attributes: ["id", "id_orden", "id_estado", "id_examen", "fecha"],
      as: "cambioEstado",
      include: [
        {
          model: Estado,
          attributes: ["nombre"],
          as: "estado",
        },
      ],
      where: {
        id_examen: idExamen,
      },
    });
    const resOrd = await Promise.all(
      examen.map(async (ex) => {
        const ultimoCambio = calcularUltimosCambios(
          cambioEstado.filter((c) => c.id_examen === ex.id_examen)
        );
        return {
          examen: ex,
          ultimoCambio: ultimoCambio,
        };
      })
    );
    const ultimoCambioOrden = obtenerMenorIdEstado(resOrd);
    if (orden) {
   
      res.render("vistaOrdenPre", { orden, muestras,examen, cambioEstado,resOrd,ultimoCambioOrden,registroValores,rol,nombre,apellido});
      

      /*
       res.json({
        ok: true,
        orden: orden,
        muestras: muestras,
        examen: examen,
        cambioEstado: cambioEstado,
        rol: ''
      });
      */
    } else {
      // Devolver JSON si la orden no se encuentra
      res.json({
        ok: false,
        error: "No se encontró la orden con el ID proporcionado.",
      });
    }
  } catch (error) {
    console.error("Error:", error);
    // Devolver JSON en caso de error
    res.json({
      ok: false,
      error: "Error en el servidor al procesar la solicitud.",
    });
  }
};

const actualizarOrden = async (id, rol, req, res) => {
  try {
    const orden = await Orden.findOne({
      attributes: [
        "id_orden",
        "id_pedido",
        "estado",
        "fecha_creacion",
        "fecha_entrega",
        "prioridad",
      ],
      include: [
        {
          model: Pedido,
          attributes: [
            "id_pedido",
            "diagnostico",
            "nombre_medico",
            "nro_matricula",
          ],
          include: [
            {
              model: Persona,
              attributes: ["id_persona", "nombre", "apellido", "dni", "genero"],
              as: "persona",
            },
          ],
          as: "pedido",
        },
        {
          model: Analisis,
          attributes: ["descripcion", "tipo"],
          as: "analisis",
          include: [
            {
              model: GuiaMuestra,
              attributes: ["g_descripcion"],
              as: "guia_muestra",
            },
          ],
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const muestras = await Muestra.findOne({
      attributes: ["id_orden", "entregado", "fecha_recoleccion"],
      include: [
        {
          model: Orden,
          attributes: [
            "id_orden",
            "estado",
            "fecha_creacion",
            "fecha_entrega",
            "prioridad",
          ],
          as: "orden",
        },
        {
          model: GuiaMuestra,
          attributes: ["g_descripcion"],
          as: "guia_muestra",
          include: [
            {
              model: Analisis,
              attributes: ["descripcion"],
              as: "analisis",
            },
          ],
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const examen = await Examen.findAll({
      attributes: [
        "id_examen",
        "id_orden",
        "descripcion",
        "resultado",
        "fecha_resultado",
        "ex_estado",
      ],
      include: [
        {
          model: Analisis,
          attributes: ["descripcion"],
          as: "analisis",
        },
      ],
      where: {
        id_orden: id,
      },
    });
    //const idExamen = await examen.map((exa) => exa.id_examen);
    /*
      const registroValores= await registro_valores.findAll({
        attributes: ['id_reg','id_determinacion','id_examen', 'valor'],
        where: {
          id_examen: idExamen,
        }
      })
  */

    const cambioEstado = await CambioEstado.findAll({
      attributes: ["id", "id_orden", "id_estado", "fecha"],
      as: "cambioEstado",
      include: [
        {
          model: Estado,
          attributes: ["nombre"],
          as: "estado",
        },
      ],
      where: {
        id_orden: id,
      },
    });

    const analisis = await Analisis.findAll({
      attributes: ["id_analisis", "descripcion", "disponible", "tipo"],
    });
    const idAnalisis = await examen.map((anal) => anal.id_analisis);
    const g_muestra = await GuiaMuestra.findAll({
      attributes: ["id_guiaM", "id_analisis", "g_descripcion", "estadoG"],
      where: {
        id_analisis: idAnalisis,
      },
    });

    if (orden) {
      // res.render('actualizarOrden',{orden,muestras, examen,analisis,g_muestra,cambioEstado,rol})
  
      return orden;
      /*
       res.json({
        ok: true,
        orden: orden,
        muestras: muestras,
        examen: examen,
        analisis:analisis,
        g_muestra:g_muestra,
        cambioEstado: cambioEstado,
        rol: rol
      });
      */
    } else {
      // Devolver JSON si la orden no se encuentra
      res.json({
        ok: false,
        error: "No se encontró la orden con el ID proporcionado.",
      });
    }
  } catch (error) {
    console.error("Error:", error);
    // Devolver JSON en caso de error
    res.json({
      ok: false,
      error: "Error en el servidor al procesar la solicitud.",
    });
  }
};

const cancelarOrden = async (req,res) => {
  const { idOrden } = req.params;
  const { estado } = req.params;
  try {
    const ordenExistente = await Orden.findOne({
      where: { id_orden: idOrden },
    });
    if (ordenExistente) {
      await ordenExistente.update({
        estado: estado,
      });
    
      return res.json({true: true});
    } else {
      console.log(
        "No se encontró ninguna orden con el ID  proporcionado."
      );
      return null;
    }
  } catch (error) {
    throw new Error("Error al Crear Examen");
  }
};


const cambioAestadoFinal = async (req,res) => {

  try {
    const { idOrden } = req.params;
console.log("asdasd "+idOrden);
const cambioFinalOrden = await Orden.findOne({
  where: { id_orden: idOrden },
});
    
    if (cambioFinalOrden) {
      await cambioFinalOrden.update({
         estado_final: 1 ,
      });
      return res.json({true: true});
    } else {
      console.log(
        "No se encontró ninguna orden con el ID  proporcionado."
      );
      return null;
    }
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

const buscarPorDni = async (dni, res) => {
  try {
    const orden = await Orden.findOne({
      attributes: ["estado_final"],
      include: [
        {
          model: Pedido,
          attributes: ["diagnostico", "nombre_medico", "nro_matricula"],
          as: "pedido",
          include: [
            {
              model: Persona,
              attributes: [
                "nombre",
                "apellido",
                [
                  sequelize.literal("YEAR(CURDATE()) - YEAR(fecha_nacimient)"),
                  "edad",
                ],
              ],
              as: "persona",
              where: {
                dni: dni,
              },
            },
          ],
        },
      ],
    });

    if (orden) {
 return orden;
    } else {
      res.status(404).json({ error: "Orden no encontrada" });
    }
  } catch (error) {
    console.error("Error al realizar la consulta:", error);
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  obtenerDescripcionesAnalisis,
  actualizarOrden,
  crearOrden,
  crearOrdenPrincipal,
  list,
  getById,
  obtenerDatosOrdenes,
  buscarPorId,
  listarPorID,
  listarPorIDpreInfo,
  buscarPorEstado,
  buscarPreinfo,
  buscarParaValidar,
  cambioPrioridad,
  cancelarOrden,
  cambioAestadoFinal,
  buscarPorDni
};
