import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { userInput1: "", userInput2: "", result: 0 }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  setNum1(e) {
    this.state.userInput1 = e
  }

  setNum2(e) {
    this.state.userInput2 = e
  }
  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <br/>
        <input type="text" value={this.state.userInput1}></input>
        <br/>
        <input type="text" value={this.state.userInput2}></input>
        <br/>
        <br/>
        <span>Options: [ + - / * ] </span>
      </div>
    );
  }
}

export default Calculator;
