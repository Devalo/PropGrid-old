import React from 'react';
import PropTypes from 'prop-types';

class TodoItems extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }
  // will toggle toggleCompleteTodoItems() which updates state in <TodoApp />
  handleClick(){
    this.props.toggleCompletedTodoItems()
  }

        // onClick - switch between show and hide todos
  render(){
    return (
      <>
        <hr />
        <button
          className="btn btn-outline-primary btn-sm btn-block mb-3"
          onClick={this.handleClick}>
          {this.props.hideCompletedTodoItems
            ? `Vis ferdige gjøremål`
            : `Skjul ferdige gjøremål `}
        </button>
        
        <div className="table-responsive">
          <table className="table">
            <thead>
              <tr>
                <th scope="col">Status</th>
                <th scope="col">Gjøremål</th>
                <th scope="col" className="text-right">Handling</th>
              </tr>
            </thead>
            <tbody>{this.props.children}</tbody>
          </table>
        </div>
      </>
    )
  }
}

export default TodoItems


TodoItems.protoTypes = {
  toggleCompleteTodoItems: PropTypes.func.isRequired,
  hideCompletedTodoItems: PropTypes.bool.isRequired,
}
