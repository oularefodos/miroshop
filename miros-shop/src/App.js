import { BrowserRouter } from 'react-router-dom';
import './App.css';
import Nav from './Component/Nav';

function App() {
  return (
    <div className="apps">
      <BrowserRouter>
        <Nav></Nav>
      </BrowserRouter>
    </div>
  );
}

export default App;
