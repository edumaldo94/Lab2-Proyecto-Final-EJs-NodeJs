const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');



const Orden = sequelize.define('orden', {
  id_orden: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_pedido: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  },
  id_analisis: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  },
  prioridad: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: true,
    collate: 'utf8mb4_spanish2_ci'
  },
  estado: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: true,
    collate: 'utf8mb4_spanish2_ci'
  },
  estado_final: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: true,
    collate: 'utf8mb4_spanish2_ci'
  },
  fecha_creacion: {
    type: DataTypes.DATE,
    allowNull: true,
    defaultValue: null
  },
  fecha_entrega: {
    type: DataTypes.DATE,
    allowNull: true,
    defaultValue: null
  }
}, {
  tableName: 'orden',
  timestamps: false,
});

module.exports = Orden;

