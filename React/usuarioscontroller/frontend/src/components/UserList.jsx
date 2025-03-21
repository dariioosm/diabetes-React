import React, { useEffect, useState } from 'react';
import axios from 'axios';

const UserList = ({ refresh }) => {
  const [usuarios, setUsuarios] = useState([]);

  useEffect(() => {
    axios.get('http://localhost/React/usuarioscontroller/backend/users.php')
      .then(res => setUsuarios(res.data))
      .catch(err => console.error('Error cargando usuarios', err));
  }, [refresh]);

  const eliminarUsuario = login => {
    if (window.confirm(`¿Eliminar al usuario ${login}?`)) {
      axios.delete('http://localhost/React/usuarioscontroller/backend/users.php', {
        data: { login }
      }).then(() => {
        setUsuarios(usuarios.filter(u => u.login !== login));
      });
    }
  };

  const actualizarUsuario = (usuario) => {
    const nuevoNombre = prompt('Nuevo nombre:', usuario.nombre);
    const nuevosApellidos = prompt('Nuevos apellidos:', usuario.apellidos);
    const nuevaFecha = prompt('Nueva fecha de nacimiento (YYYY-MM-DD):', usuario.fecha_nacimiento);
    const nuevaPass = prompt('Nueva contraseña (dejar en blanco si no quieres cambiarla):');

    if (!nuevoNombre || !nuevosApellidos || !nuevaFecha) {
      alert('Todos los campos (excepto la contraseña) son obligatorios');
      return;
    }

    const payload = {
      login: usuario.login,
      nombre: nuevoNombre,
      apellidos: nuevosApellidos,
      fecha_nacimiento: nuevaFecha
    };

    if (nuevaPass) {
      payload.pass = nuevaPass;
    }

    axios.put('http://localhost/React/usuarioscontroller/backend/users.php', payload)
      .then(() => {
        alert('Usuario actualizado');
        // Actualizar lista
        setUsuarios(usuarios.map(u => u.login === usuario.login ? { ...u, ...payload } : u));
      })
      .catch(err => {
        console.error('Error al actualizar usuario', err);
        alert('Error al actualizar usuario');
      });
  };

  return (
    <div>
      <h3>Usuarios registrados</h3>
      <table border="1">
        <thead>
          <tr>
            <th>Nombre</th><th>Apellidos</th><th>Usuario</th><th>Fecha Nacimiento</th><th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {usuarios.map(u => (
            <tr key={u.login}>
              <td>{u.nombre}</td>
              <td>{u.apellidos}</td>
              <td>{u.login}</td>
              <td>{u.fecha_nacimiento}</td>
              <td>
                <button onClick={() => eliminarUsuario(u.login)}>Eliminar</button>
                <button onClick={() => actualizarUsuario(u)}>Actualizar</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default UserList;
