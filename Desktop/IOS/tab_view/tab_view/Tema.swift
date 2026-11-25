//
//  Tema.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct Tema {
    static let fondo = Color(red: 0.025, green: 0.035, blue: 0.09)
    
    static let tarjeta = Color(red: 0.07, green: 0.10, blue: 0.18)
    
    static let azul = Color(red: 0.0, green: 0.85, blue: 1.0)
    
    static let morado = Color(red: 0.55, green: 0.30, blue: 1.0)
    
    static let texto = Color.white
    
    static let secundario = Color.gray
    
    static let gradiente = LinearGradient(
        colors: [azul, morado],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
