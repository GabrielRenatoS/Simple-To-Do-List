import './App.css';
import GlobalStyles from './styles/global';
import ToDoList from './pages/ToDoList';

function App() {
  return (
    <div className="App">
      <GlobalStyles />
      <ToDoList />
    </div>
  );
}

export default App;
