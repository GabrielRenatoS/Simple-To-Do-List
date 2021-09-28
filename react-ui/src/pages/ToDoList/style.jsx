import styled, { css } from 'styled-components';

export const Container = styled.div`  
  overflow: auto;

  ${(props) => props.darkMode && css`
    background: #222222;
    color: #ffffcc;
  `}
`;

export const Header = styled.div`
  height: auto;
  width: auto;
  align-self:center;
  margin-top: 2%;
  margin-bottom: 2%;
`;

export const Title = styled.h1`
  margin-left: 2%;
`;

export const DarkModeSwitch = styled.button`

  float: right;
  right: 2%;
  top: 1%;
  height: 30px;
  width: 35px;
  border-radius: 90%;
  position: relative; 

  & > * {
    position: absolute;
    left: -2px;
    top: -2px;    
    height: 30px;
    width: 35px;
    border-radius: 90%;
  }
`;

export const AddTaskContainer = styled.div`
  height: 50px;
  position: relative;
`;

export const AddTaskText = styled.input`
  width: 400px;
  height: 25px;
  margin-left: -25px;
`;

export const AddTaskButton = styled.button`
  height: 25px;
  width: 25px;
  position: absolute;

  & > * {
    height: 26px;
    width: 26px;
    left: -2px;
    top: -2px;
    position: absolute;
  }
`;

