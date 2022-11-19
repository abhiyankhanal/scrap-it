import React from 'react'
import { useState } from 'react';
import requestOptions from '../api/Api';

function Home() {
  const [name, setName] = useState("");

  const handleSubmit = () =>  {
      // Send data to the backend via POST
      fetch("http://localhost:3000/crawler", requestOptions)
      .then(response => response.text())
      .then(result => console.log(result))
      .catch(error => console.log('error', error));
  }

  return (
    <>
    <form onSubmit={handleSubmit}>
      <div className='d-flex justify-content-center pt-3 '>
      <div>
      <label>Enter your name:
        <input 
          type="text" 
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </label>
      </div>
      <div>
      <input type="submit" />
      </div>
      </div>
    </form>
    </>
  )
}

export default Home