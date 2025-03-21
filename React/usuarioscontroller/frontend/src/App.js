import React from 'react';
import UserManager from './components/UserManager';
import InsulinStats from './components/InsulinStats';

function App() {
  return (
    <div className="App">
      <h1>Gestión de Insulina</h1>
      <UserManager />
      <InsulinStats mes="2025-01" />
    </div>
  );
}

export default App;
