const {Pool} = require('pg')

const pool = new Pool({
    user: 'postgres',
    password: '1',
    database: 'projeto_bd'
});

module.exports = {p:p};

function p() {
    return 'Funciona' + 1;
}

// *** CANDIDATURA ***

// Seleciona os candidatos de todas as eleicoes
function select_candidatos(colunas){
    return "Ainda nao implementado"
}

// Seleciona os candidatos da eleicao em ocorrencia
function select_candidatos_atuais(colunas){
    return "Ainda nao implementado"
}

// Insere candidatura na base
function insert_candidato(colunas){
    return "Ainda nao implementado"
}

// Atualiza candidatura da base
function update_candidatura(){
    return "Ainda nao implementado"
}

// Remove candidatura da base
function delete_candidatura(){
    return "Ainda nao implementado"
}

// *** PARTIDOS ***

// Seleciona os partidos
function select_partidos(colunas){
    return "Ainda nao implementado"
}

// Insere partido na base
function insert_partido(colunas){
    return "Ainda nao implementado"
}

// Atualiza partido da base
function update_partido(){
    return "Ainda nao implementado"
}

// Remove partido da base
function delete_partido(){
    return "Ainda nao implementado"
}

// *** EQUIPE DE APOIO ***

// Seleciona as equipes de todas as eleicoes
function select_equipes(colunas){
    return "Ainda nao implementado"
}

// Seleciona as equipes da eleicao em ocorrencia
function select_equipes_atuais(colunas){
    return "Ainda nao implementado"
}

// Insere equipes na base
function insert_equipe(colunas){
    return "Ainda nao implementado"
}

// Atualiza equipes da base
function update_equipes(){
    return "Ainda nao implementado"
}

// Remove equipes da base
function delete_equipes(){
    return "Ainda nao implementado"
}

// *** PARTICIPANTE ***

// Seleciona as equipes de todas as eleicoes
function select_equipes(colunas){
    return "Ainda nao implementado"
}

// Seleciona as equipes da eleicao em ocorrencia
function select_equipes_atuais(colunas){
    return "Ainda nao implementado"
}

// Insere equipes na base
function insert_equipe(colunas){
    return "Ainda nao implementado"
}

// Atualiza equipes da base
function update_equipes(){
    return "Ainda nao implementado"
}

// Remove equipes da base
function delete_equipes(){
    return "Ainda nao implementado"
}