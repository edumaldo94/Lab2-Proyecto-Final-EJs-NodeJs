const express = require('express');
const router = express.Router();
//const connection= require('../config/database')
const bcryptjs= require('bcryptjs')
const usuarioController = require('../controllers/usuarioController');
const ordenController = require('../controllers/ordenController');
const personaController = require('../controllers/personaController');
  // Utiliza el middleware requireAuth en tus rutas protegidas

  const { validarAutenticacion, handleErrorValidations } = require('../middleware/validateUser');
  const authMiddleware = require('../middleware/authMiddleware');


  router.get('/formularioUsuario', async (req, res) => {
    try {
        const personasSinUsuario = await usuarioController.obtenerPersonasSinUsuario(req, res);
        res.render('usuarioForm', { personasSinUsuario });
    } catch (error) {
        res.status(500).send('Error al obtener personas sin usuario: ' + error.message);
    }
});

router.get('/reseteo_password',(req, res) => {
    res.render('reset-password-request'); // Ajusta el nombre de la vista según tu configuración
  });

router.post('/request-reset-password', usuarioController.requestResetPassword);
router.get('/obtener/persona/sincuenta', usuarioController.obtenerPersonasSinUsuario);

  router.get('/reset_password/:resetToken',(req, res) => {
    const resetToken = req.params.resetToken; // Obtén el token de la URL
    res.render('reset-password', { resetToken }); // Ajusta el nombre de la vista según tu configuración
  });

router.post('/resete_password', usuarioController.resetPassword);

  // A partir de aquí, puedes definir tus rutas normales
  

  router.post('/auth', validarAutenticacion, handleErrorValidations, async (req, res) => {
   
        try {
        const { dni, clave } = req.body;
      
    
        let usuario;

            usuario = await usuarioController.buscarDni(dni);
            let usuarioEstadoFinal= await personaController.buscarPorDniUser(dni);

        if (usuario === null) {

           return res.json({
                ok: false,

                error: "Documento no esta registrado"
              
            });

        }else{

        const esClaveValida = await bcryptjs.compare(clave.toString(), usuario.clave);

        if (!esClaveValida) {
            res.json({
                ok: false,
                error: "Contraseña incorrecta"
            });
            return;
        }

        req.session.user = usuario.id_usuario;
console.log(usuario.rol)
        
		if (usuario.rol === 'Paciente'  && usuario.estado != 0) {
			res.json({
				ok: true,
              // redirectTo: `/page-${usuario.rol}`,
                rol: usuario.rol
			});
		} else if (usuario.rol === 'Administrador' && usuario.estado != 0) {
			res.json({
				ok: true,
                redirectTo: `/page-${usuario.rol}`,
                rol: usuario.rol,
                nombre:usuarioEstadoFinal.nombre,
                apellido:usuarioEstadoFinal.apellido
			});
		}else if (usuario.rol === 'Tecnico' && usuario.estado != 0) {
			res.json({
				ok: true,
				redirectTo: `/page-${usuario.rol}`,
                nombre:usuarioEstadoFinal.nombre,
                apellido:usuarioEstadoFinal.apellido
                //apellido:apellido
			});
		}else if (usuario.rol === 'Bioquimico'&& usuario.estado != 0) {
			res.json({
				ok: true,
				redirectTo: `/page-${usuario.rol}`,
                nombre:usuarioEstadoFinal.nombre,
                apellido:usuarioEstadoFinal.apellido
			});
		}else if (usuario.rol === 'Gerente'&& usuario.estado != 0) {
			res.json({
				ok: true,
				redirectTo: `/page-${usuario.rol}`,
                nombre:usuarioEstadoFinal.nombre,
                apellido:usuarioEstadoFinal.apellido
			});
		}
    }
    } catch (error) {
        console.error(error);
        return res.json({
            ok: false,
            error: "Error en el servidor"
        });
    }
});

router.post('/userPacient/pa_ci_en_te/pacienTe', validarAutenticacion, handleErrorValidations, async (req, res) => {
    
  
    try {
        const { dni, clave } = req.body;

        let usuario;
        let usuarioEstadoFinal= await ordenController.buscarPorDni(dni);//devuelve el estado de la orden final
            usuario = await usuarioController.buscarDni(dni);
    
        if (usuario === null) {

           return res.json({
                ok: false,

                error: "Documento no esta registrado"
              
            });

        }else{

        const esClaveValida = await bcryptjs.compare(clave.toString(), usuario.clave);
        
        if (!esClaveValida) {
            res.json({
                ok: false,
                error: "Contraseña incorrecta"
            });
            return;
        }
        req.session.user = usuario.id_usuario;
      console.log("-----p--"+usuario);
        if (usuario.rol === 'Paciente'  && usuario.estado != 0) {
			res.json({
				ok: true,
                redirectTo: `/page-${usuario.rol}`,
                rol: usuario.rol,
               //nombre:usuario.nombre,
              // apellido:usuario.apellido
			});
		} else if (usuario.rol != 'Paciente') {
            if(usuarioEstadoFinal.estado_final ===true){
                res.json({
                    ok: true,
                    redirectTo: `/page-Paciente`,
                    rol: usuario.rol
                   
                });
            }else{
			res.json({
				ok: true,
				//redirectTo: '/page-administrativo'
                rol: usuario.rol
			});
        }
		
		}
    }
    } catch (error) {
        console.error(error);
        res.json({
            ok: false,
            error: "Error en el servidor"
        });
    }

});


router.get('/', authMiddleware.requireAuth, usuarioController.list);
router.get('/:id', authMiddleware.requireAuth, usuarioController.getById);


router.post('/guardarUsuario' , authMiddleware.requireAuth, usuarioController.saveUser);
router.get('/busqDni/:dni', authMiddleware.requireAuth, usuarioController.buscarDni)
router.get('/tabla_Empleado/empleado' , authMiddleware.requireAuth ,  usuarioController.tablaEmpleado)
router.get('/listaPaciente/userPa/:rol' , authMiddleware.requireAuth,  usuarioController.listPaciente)
router.get('/cambioAlta/user/:dni' , authMiddleware.requireAuth, usuarioController.btnAlta);
router.get('/cambioBaja/user/:dni', authMiddleware.requireAuth , usuarioController.btnBaja);
router.get('/modificarRol/user/:dni/:rol', authMiddleware.requireAuth, usuarioController.modificarRol);

/*
router.put('/campos', [
    body('dni', 'Ingrese el Numero de Documento')
    .exists()
    .isNumeric()
    .isLength(6),
    body('clave','Ingrese clave minimo 6 carecteres')
   
    .exists()
    .isLength({ min:6})
], (req, res) => {

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
		console.log( errors.msg)
		const valores= req.body
		const validaciones=errors.array()
        res.render('accesoPersonal',{ errors: validationResult(req).array(),valores: valores });
        
    }else{
		res.send('Validacion exitosa')
	}
})
*/







module.exports = router;
