import React, { useContext, useState } from 'react';
import axios from 'axios';
import { ValidationContext } from './ValidationContext';

const UserForm = ({ onUserAdded }) => {
  const { usernameRegex, passwordRegex } = useContext(ValidationContext);
  const [form, setForm] = useState({
    nombre: '',
    apellidos: '',
    fecha_nacimiento: '',
    login: '',
    pass: ''
  });
  const [error, setError] = useState('');

  const handleChange = e => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const validarEdad = fecha => {
    const hoy = new Date();
    const nac = new Date(fecha);
    const edad = hoy.getFullYear() - nac.getFullYear();
    return edad > 18 || (edad === 18 && hoy >= new Date(nac.setFullYear(hoy.getFullYear())));
  };

  const handleSubmit = async e => {
    e.preventDefault();

    const { login, pass, nombre, apellidos, fecha_nacimiento } = form;

    if (!usernameRegex.test(login)) return setError("Nombre de usuario inválido.");
    if (!passwordRegex.test(pass)) return setError("Contraseña inválida.");
    if (!validarEdad(fecha_nacimiento)) return setError("El usuario debe ser mayor de edad.");
    if (!nombre || !apellidos) return setError("Nombre y apellidos obligatorios.");

    try {
      await axios.post('http://localhost/React/usuarioscontroller/backend/users.php', form);
      setError('');
      setForm({ nombre: '', apellidos: '', fecha_nacimiento: '', login: '', pass: '' });
      onUserAdded();
    } catch (err) {
      setError("Error al guardar el usuario.");
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h3>Nuevo Usuario</h3>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <input name="nombre" placeholder="Nombre" value={form.nombre} onChange={handleChange} required />
      <input name="apellidos" placeholder="Apellidos" value={form.apellidos} onChange={handleChange} required />
      <input name="fecha_nacimiento" type="date" value={form.fecha_nacimiento} onChange={handleChange} required />
      <input name="login" placeholder="Nombre de usuario" value={form.login} onChange={handleChange} required />
      <input name="pass" type="password" placeholder="Contraseña" value={form.pass} onChange={handleChange} required />
      <button type="submit">Guardar</button>
    </form>
  );
};

export default UserForm;
