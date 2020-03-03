// app/javascript/packs/components/TodoItem.jsx
import React from 'react'
import PropTypes from 'prop-types'

// lodash to postpone server update, so the server doesnt get hit with every key
import _ from 'lodash';
import axios from 'axios';
import setAxiosHeaders from './AxiosHeaders';



class TodoItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      complete: this.props.todoItem.complete,
    };

    //  bind handleChange and updateTodoItem so 'this' works in callbacks
    this.handleChange = this.handleChange.bind(this);
    this.updateTodoItem = this.updateTodoItem.bind(this);
    // create refs so we can collect data from fields
    this.inputRef = React.createRef();
    this.completedRef = React.createRef();
    // Bind handleDestroy so keyword this is available on delete button
    this.handleDestroy = this.handleDestroy.bind(this);
    // Store API endpoint of TodoItem in this.path
    this.path = `/api/v1/todo_items/${this.props.todoItem.id}`;
  }
  handleChange() {
    this.setState({
      complete: this.completedRef.current.checked
    });
    this.updateTodoItem();
  }
  // the update will run after 1 sec after typing
  updateTodoItem = _.debounce(() => {
    this.setState({ complete: this.completedRef.current.checked });
    setAxiosHeaders();
    axios
      .put(this.path, {
        todo_item: {
          title: this.inputRef.current.value,
          complete: this.completedRef.current.checked,
        }
      })
      .then(response => {})
      .catch(error => {
        console.log(error);
      });
  }, 1000);
  // This method sends a delete request to the API. If successful
  // then render TodoItems,
  handleDestroy() {
    setAxiosHeaders();
    // confirmation to avoid the user to delete item by mistake
    const confirmation = confirm('Er du sikker?');
    if(confirmation){
      axios
        .delete(this.path)
        // We require that getTodoItems are set
        .then(response => {
          this.props.getTodoItems();
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
  render() {
    const { todoItem } = this.props
    return (
      // show or hide <TodoItem /> depending on whether or not hideCompletedTodoItems and props are true or not
        <tr className={`${ this.state.complete && this.props.hideCompletedTodoItems ? `d-none` : "" } ${this.state.complete ? "table-light" : ""}`}
      >
        <td>
          <svg
            className={`bi bi-check-circle ${
              this.state.complete ? `text-success` : `text-muted`
            }`}
            width="2em"
            height="2em"
            viewBox="0 0 20 20"
            fill="currentColor"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fillRule="evenodd"
              d="M17.354 4.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L10 11.293l6.646-6.647a.5.5 0 01.708 0z"
              clipRule="evenodd"
            />
            <path
              fillRule="evenodd"
              d="M10 4.5a5.5 5.5 0 105.5 5.5.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 0010 4.5z"
              clipRule="evenodd"
            />
          </svg>
        </td>
        <td>
          <input
            type="text"
            defaultValue={todoItem.title}
            disabled={this.state.complete}
            onChange={this.handleChange}
            ref={this.inputRef}
            className="form-control"
            id={`todoItem__title-${todoItem.id}`}
          />
        </td>
        <td className="text-right">
          <div className="form-check form-check-inline">
            <input
              type="boolean"
              defaultChecked={this.state.complete}
              type="checkbox"
              onChange={this.handleChange}
              ref={this.completedRef}
              className="form-check-input"
              id={`complete-${todoItem.id}`}
            />
            <label
              className="form-check-label"
              htmlFor={`complete-${todoItem.id}`}
            >
              Utført?
            </label>
          </div>
          <button
            className="btn btn-outline-danger btn-sm"
            onClick={this.handleDestroy}>Slett</button>
        </td>
      </tr>
    )
  }
}

export default TodoItem

TodoItem.propTypes = {
  todoItem: PropTypes.object.isRequired,
  getTodoItems: PropTypes.func.isRequired,
  hideCompletedTodoItems: PropTypes.bool.isRequired,
}