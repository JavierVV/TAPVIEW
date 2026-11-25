//
//  mensaje.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//

import Foundation

struct Mensaje: Identifiable{
    var id = UUID()
    
    let remitente: String?
    let receptor: String?
    
    let cuerpo: String
}
