import axios from 'axios';

const API_URL = 'http://localhost/React/usuarioscontroller/frontend/src/api/users.js';

export const obtenerUsuarios = () => axios.get(API_URL);

export const crearUsuario = (usuario) => axios.post(API_URL, usuario);

export const actualizarUsuario = (usuario) => axios.put(API_URL, usuario);

export const eliminarUsuario = (login) => axios.delete(API_URL, { data: { login } });
