@testSelectFlight
    Scenario: Seleccionar un vuelo sin rellenar ningun dato
        Given Estoy https://travel.agileway.net/flights/start para seleccionar un vuelo
        When Hago click en "continuar" sin rellenar ningun dato
        Then Un cartel me indica que debo rellenar los datos.

    Scenario: Seleccionar un vuelo en el que la fecha de vuelta es anterior a la de salida
        Given Estoy https://travel.agileway.net/flights/start para seleccionar un vuelo
        When Selecciono como fecha de partida 01 Enero 2024
        And Selecciono como fecha de vuelta 01 Enero 2023
        Then Aparece un aviso informando que no se puede seleccionar uan fecha de vuelta anterior a la de salida.

    Scenario: Seleccionar como lugar de salida y llegada la misma ciudad.
        Given Estoy https://travel.agileway.net/flights/start para seleccionar un vuelo
        When Selecciono como lugar de salida New York
        And Selecciono como lugar de destino New York
        And Hago click en continuar
        Then Aparece un cartel indicando que la ciudad de partida y destino no puede ser la misma.

    Scenario: Relleno el formulario con todos los datos válidos.
        Given Estoy https://travel.agileway.net/flights/start para seleccionar un vuelo
        When Relleno el formulario con datos válidos
        And Hago click en continuar
        Then Soy enviado al siguiente paso del formulario.

    Scenario: Enviar formulario con fecha de partida una fecha pasada a la actual
        Given Estoy https://travel.agileway.net/flights/start para seleccionar un vuelo
        When Selecciono una fecha de partida que ya pasó
        And Envio el formulario
        Then Recibo una alerta de que la fecha de partida no es válida.

