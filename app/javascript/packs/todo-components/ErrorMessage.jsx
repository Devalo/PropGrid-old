import React from 'react';
import PropTypes from 'prop-types';

import _ from 'lodash';

const ErrorMessage = props =>  {
  // we assign data to the value of props.errorMessage.response.data, since Rails returns the error
  // in a data object within a response Object
  const data = _.get(props.errorMessage, "response.data", null);

  const message = _.get(props.errorMessage, "message", null);

  // if there is data object, we iterate over all the keys in the data object and print the value
  if(data){
    const keys = Object.keys(data);
    return keys.map(key => {
      return (
        <div key={new Date()} className="alert alert-danger" role="alert">
          <ul>
            <li>{data[key].map(message => message)}</li>
          </ul>
        </div>
      );
    });
  } else if(message){
    return (
      <div className="alert alert-danger" role="alert">
        <p className="mb-0">{message}</p>
      </div>
    );
  } else {
  return (
    <div className="alert alert-danger" role="alert">
      <p className="mb-0">Noe gikk galt.</p>
    </div>
  )
  }
}

export default ErrorMessage;


ErrorMessage.propTypes = {
  errorMessage: PropTypes.object.isRequired,
};
