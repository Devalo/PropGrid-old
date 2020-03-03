import React from 'react';

const Spinner = () => {
  return (
    <div className="d-flex align-items-center justify-content-center py5">
      <div className="spinner-border" role="status">
        <span className="sr-only">Laster inn...</span>
      </div>
    </div>
  );
};

export default Spinner;
