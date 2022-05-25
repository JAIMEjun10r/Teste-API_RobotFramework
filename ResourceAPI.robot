*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1

*** Keywords ***
Conectar a minha API
    Create Session    FakeAPI    ${URL_API}
Requisitar todos os livros
    ${RESPOSTA}    GET On Session    FakeAPI   /Books  
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 
Conferir o status code
    [Arguments]    ${STATUS_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_DESEJADO}
Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}
Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    GET On Session    FakeAPI   /Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA} 