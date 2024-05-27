const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');



const Muestra = sequelize.define('muestra', {
  id_muestra: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_orden: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  },
  fecha_recoleccion: {
    type: DataTypes.DATE,
    allowNull: true,
    defaultValue: null
  },
  entregado: {
    type: DataTypes.TINYINT,
    allowNull: true,
    defaultValue: null
  },
  id_guiaM: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null,
  
  }
}, {
  timestamps:false,
  tableName:'muestra',
});



module.exports = Muestra;
