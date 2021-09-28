import React from 'react';
import api from '../../services/api';

import { DeleteButton } from './style';

export default function TaskToDo(props) {
  const task = props.task;

  async function DeleteTask() {
    await api.delete(`/${task.Id}`);
    props.needUpdate();
  }

  return (
    <li>
      {task.Description}
      <DeleteButton onClick={DeleteTask} />
    </li>
  );
}