const database = require('./src/database'); // Arquivo com funcoes do banco de dados


const express = require('express');  // Lib para API
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));
app.use('/scripts', express.static(__dirname + '/public'));

app.get('/', (req, res) => {
    res.send("API Funcionando")
});

app.listen(3000, () => {
    console.log(`Listeing on port ${3000}`)
})
