const express = require('express')
const app = express()
const port = 3000;

app.listen(port);
console.log(`Aplicação teste executando em http://localhost: ${port}`);
console.log('test sync')
console.log('test sync 2')
console.log('test sync 3')

app.get('/health', (req, res) => {
  res.send('OK');
  res.status(200);
});

app.get('/', (req, res) => {
  const name = process.env.NAME || 'candidato';
  res.send(`Olá ${name}!`);
});