import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  LineElement,
  PointElement,
  CategoryScale,
  LinearScale,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(
  LineElement,
  PointElement,
  CategoryScale,
  LinearScale,
  Title,
  Tooltip,
  Legend
);

const InsulinStats = () => {
  const [resumen, setResumen] = useState(null);
  const [evolucion, setEvolucion] = useState([]);
  const [fechaInicio, setFechaInicio] = useState('2025-01-01');
  const [fechaFin, setFechaFin] = useState('2025-01-31');

  const cargarEstadisticas = () => {
    axios.post('http://localhost/backend/stats.php', {
      fecha_inicio: fechaInicio,
      fecha_fin: fechaFin
    })
      .then(res => {
        setResumen(res.data.resumen);
        setEvolucion(res.data.evolucion);
      })
      .catch(err => console.error('Error cargando estadísticas', err));
  };

  useEffect(() => {
    cargarEstadisticas();
  }, []);

  const chartData = {
    labels: evolucion.map(item => item.fecha_control),
    datasets: [
      {
        label: 'Insulina (media diaria)',
        data: evolucion.map(item => item.promedio_dia),
        fill: false,
        tension: 0.4,
      }
    ]
  };

  const chartOptions = {
    responsive: true,
    plugins: {
      legend: { position: 'top' },
      title: { display: true, text: 'Evolución diaria de insulina' },
    },
  };

  return (
    <div>
      <h2>Estadísticas de insulina</h2>

      <div style={{ marginBottom: 20 }}>
        <label>
          Fecha inicio:{' '}
          <input type="date" value={fechaInicio} onChange={e => setFechaInicio(e.target.value)} />
        </label>
        {' '}
        <label>
          Fecha fin:{' '}
          <input type="date" value={fechaFin} onChange={e => setFechaFin(e.target.value)} />
        </label>
        {' '}
        <button onClick={cargarEstadisticas}>Buscar</button>
      </div>

      {resumen ? (
        <ul>
          <li><strong>Media:</strong> {resumen.media}</li>
          <li><strong>Mínimo:</strong> {resumen.minimo}</li>
          <li><strong>Máximo:</strong> {resumen.maximo}</li>
        </ul>
      ) : (
        <p>Cargando estadísticas...</p>
      )}

      {evolucion.length > 0 && (
        <div style={{ maxWidth: 800, marginTop: 20 }}>
          <Line data={chartData} options={chartOptions} />
        </div>
      )}
    </div>
  );
};

export default InsulinStats;
