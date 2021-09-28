import React, { useCallback } from 'react';
import TaskToDo from '../TaskToDo';
import { List } from './style';

export default function TaskList(props) {
  const list = props.list;
  console.log(list);

  const requestUpdate = useCallback(() => {
    props.requestUpdate();
  }, [props]);
 
  return(
    <List>
      {list.map(task => 
        <TaskToDo key={task.Id} task={task} needUpdate={requestUpdate} />
      )}
    </List>
  )
}