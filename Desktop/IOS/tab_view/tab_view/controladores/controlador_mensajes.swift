//
//  controlador_mensajes.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//

import SwiftUI


@Observable
class MensajesControl{
    var conversaciones: [Conversacion]
    
    init(){
        conversaciones = ConversacionesFalsas
    }
}
