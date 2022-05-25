*** Settings ***
Suite Setup    Conectar a minha API
Resource    ResourceAPI.robot


*** Test Cases ***
Buscar a listagem de todos os livros
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retorna uma lista com "200" livros
Buscar um livro específico
    Requisitar o livro "4"
    




