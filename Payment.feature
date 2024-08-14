@testPayByCreditCard

    Scenario: Enviar pago sin rellenar ningun campo
        Given Estoy en https://travel.agileway.net/flights/passenger/47358 luego de seleccionar un vuelo e ingresar mi nombre y apellido
        When Hago click en "Pay now" sin rellenar el formulario
        Then Recibo un mensaje indicando que debo rellenar el formulario.

    Scenario: Enviar pago rellenando el campo "card number" con letras
        Given Estoy en https://travel.agileway.net/flights/passenger/47358 luego de seleccionar un vuelo e ingresar mi nombre y apellido
        When Relleno el campo de card number con letras
        And Hago click en Pay now
        Then Recibo un mensaje de error indicando que el campo solo puede contener numeros.

    
    Scenario: Enviar pago sin seleccionar el tipo de tarjeta
        Given Estoy en https://travel.agileway.net/flights/passenger/47358 luego de seleccionar un vuelo e ingresar mi nombre y apellido
        When Hago click en Pay now sin seleccionar tipo de tarjeta
        Then Recibo un mensaje indicando que debo seleccionar un tipo de tarjeta

    Scenario: Realizar un pago con una tarjeta cuya fecha de expiración ya pasó
        Given Estoy en https://travel.agileway.net/flights/passenger/47358 luego de seleccionar un vuelo e ingresar mi nombre y apellido
        When Ingreso una fecha de expiracion pasada para la tarjeta
        And Hago click en Pay now
        Then Recibo un mensaje diciendo que la tarjeta ya expiró.

    Scenario: Realizar un pago rellenando el formulario de pago con todos los datos válidos
        Given Estoy en https://travel.agileway.net/flights/passenger/47358 luego de seleccionar un vuelo e ingresar mi nombre y apellido
        When Relleno el formulario con todos los datos validos
        And Hago click en Pay now
        Then Recibo los detalles del vuelo reservado