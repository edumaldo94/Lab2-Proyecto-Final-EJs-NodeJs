const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const http = require('http');
const socketIo = require('socket.io');

const consultas = require('./db/consulta');
const indexRouter = require('./routers/index');
const usuarioController = require('./controllers/usuarioController');
const { check, validationResult } = require('express-validator');
const dotenv = require('dotenv');

dotenv.config({ path: './.env' });

const app = express();
const port = 3040;
const server = http.createServer(app);
const io = socketIo(server);

app.use(cors());

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/', indexRouter);
app.use('/resources', express.static('public'));
app.use('/resources', express.static(path.join(__dirname, '/public')));

io.on('connection', (socket) => {
    console.log('Nuevo cliente conectado');

    socket.on('mensaje', (mensaje) => {
        console.log('Mensaje recibido:', mensaje);
        io.emit('mensaje', mensaje);
    });

    socket.on('disconnect', () => {
        console.log('Cliente desconectado');
    });
});
/*
app.get('/chat', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'chat.html'));
});*/
// En app.js

app.get('/chat', (req, res) => {
  res.render('chat');
});

server.listen(port, () => {
    console.log(`Servidor iniciado en el puerto http://localhost:${port}`);
});
