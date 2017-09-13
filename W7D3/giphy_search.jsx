import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from "./util/api_util";


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
  
});
