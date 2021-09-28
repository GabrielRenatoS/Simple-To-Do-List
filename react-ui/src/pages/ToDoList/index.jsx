import { useState, useEffect } from 'react';
import api from '../../services/api';

import LightModeIcon from '../../resources/light-mode-icon.png';
import DarkModeIcon from '../../resources/dark-mode-icon.png';
import ArrowIcon from '../../resources/arrow-icon.png';

import TaskList from '../../components/TaskList';
import { 
  Container, Header, Title, DarkModeSwitch, 
  AddTaskContainer, AddTaskText, AddTaskButton,
} from './style';


function ToDoList() {
  const [darkMode, setDarkMode] = useState(true);
  const [ready, setReady] = useState(false);
  const [taskList, setTaskList] = useState([]);
  const [description, setDescription] = useState("");

  useEffect(() => {
    if (ready) {
      return;
    } else {
      api.get('/').then(response => {
        let data = response.data;
        setTaskList(data);
      });

      setReady(true);
    }
  }, [ready, taskList]);

  function SwitchDarkMode() {
    setDarkMode(!darkMode);
  }

  function LoadList() {
    api.get('/').then(response => {
      let data = response.data;
      setTaskList(data);
    })
  };

  function ConfirmKeyPress(e) {
    if (e.charCode === 13) {
      AddTask();
    }
  }

  function AddTask() {
    setDescription("");

    api
    .post('/', {
      Description: description
    })
    .then(() => {
      setReady(false);
    })
    .catch(() => {
        alert("Erro inesperado!");
    });
  }

  return (
    <Container darkMode={darkMode}>
      <Header>
        <DarkModeSwitch onClick={SwitchDarkMode}>
          {darkMode ? (
            <img src={DarkModeIcon} alt="Dark Mode Icon" />
          ) : (
            <img src={LightModeIcon} alt="Light Mode Icon" />
          )}
        </DarkModeSwitch>
        <Title onClick={LoadList}>To Do List</Title>
      </Header>
      <AddTaskContainer>
        <AddTaskText 
          name="description" 
          value={description} 
          onChange={(e) => {setDescription(e.target.value)}}
          onKeyPress={ConfirmKeyPress} 
        />
        <AddTaskButton onClick={AddTask}>
          <img src={ArrowIcon} alt="Arrow/Enter Icon" />
        </AddTaskButton>
      </AddTaskContainer>
      {ready ? (
        <TaskList list={taskList} requestUpdate={LoadList} />
        ) : (
          <span>No Tasks</span>
        )
      }
    </Container>
  );
}

export default ToDoList;
