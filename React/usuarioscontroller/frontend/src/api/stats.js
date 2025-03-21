import axios from 'axios';

const API_URL = 'http://localhost/React/usuarioscontroller/frontend/src/api/stats.js';

export const obtenerEstadisticas = (mes) => axios.post(API_URL, { mes });
