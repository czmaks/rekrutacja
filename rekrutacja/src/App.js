import { Route, Routes } from 'react-router-dom';
import './App.css';
import BaseGetter from './pages/BaseGetter';
import Getter from './pages/Getter';

function App() {
  return (
    <>
      <Routes>
        <Route path='/basegetter' element={<BaseGetter />} />
        <Route path='/getter' element={<Getter/>}/>
      </Routes>
    </>
  );
}

export default App;
