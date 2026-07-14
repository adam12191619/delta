import React, { useState } from 'react';
import Disclaimer from './screens/Disclaimer';
import Dashboard from './screens/Dashboard';

export default function App() {
  const [isAuthorized, setIsAuthorized] = useState(false);

  // Kalo belom pencet "Initialize", kasih Disclaimer dulu 🗿
  if (!isAuthorized) {
    return <Disclaimer onAccept={() => setIsAuthorized(true)} />;
  }

  return <Dashboard />;
}
