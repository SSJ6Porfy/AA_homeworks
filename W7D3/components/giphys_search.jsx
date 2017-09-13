import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
   this.props.fetchSearchGiphys('golden+retriever');
 }

  handleChange(event) {
    event.preventDefault();
    this.setState({ searchTerm: event.currentTarget.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }


  render() {
    let { giphys } = this.props;
    return (
      <div>
        <form className="search-giphy">
          <label>Search Giphys:
            <input type="text" value={this.state.searchTerm} onChange={this.handleChange}></input>
          </label>
          <button onClick={this.handleSubmit}>Search</button>
        </form>
        
      </div>
    )
  }
}

export default GiphysSearch;
