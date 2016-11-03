const axios = require('axios')
// need to run `npm install --save axios` if not already in your project

axios.get('https://projecteulerapi.herokuapp.com/api/problem/1/check/2')
     .then((response) => {
       console.log(response.data.result)
     })
     .catch((error) => {
       console.log(error)
     })
