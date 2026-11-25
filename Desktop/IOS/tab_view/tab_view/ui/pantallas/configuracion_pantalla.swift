//
//  configuracion_pantalla.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct Configuracion: View {
    
    @AppStorage("colorSeleccionado")
    private var colorSeleccionado = "Cyan"
    
    @AppStorage("notificacionesActivadas")
    private var notificaciones = true
    
    private let colores: [String: Color] = [
        "Cyan": .cyan,
        "Morado": .purple,
        "Verde": .green,
        "Rosa": .pink,
        "Azul": .blue
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Tema.fondo.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("SISTEMA")
                            .font(.caption)
                            .tracking(3)
                            .foregroundStyle(Tema.azul)
                        
                        Text("Configuración")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                        
                        VStack(alignment: .leading, spacing: 18) {
                            Text("Apariencia")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text("Selecciona tu color de interfaz")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            LazyVGrid(
                                columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ],
                                spacing: 15
                            ) {
                                ForEach(colores.keys.sorted(), id: \.self) { color in
                                    Button {
                                        colorSeleccionado = color
                                    } label: {
                                        VStack(spacing: 8) {
                                            Circle()
                                                .fill(colores[color]!)
                                                .frame(width: 40, height: 40)
                                                .overlay {
                                                    if colorSeleccionado == color {
                                                        Image(systemName: "checkmark")
                                                            .foregroundStyle(.white)
                                                    }
                                                }
                                            
                                            Text(color)
                                                .font(.caption)
                                                .foregroundStyle(.white)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                        .background(Tema.tarjeta)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .padding()
                        .background(Tema.tarjeta)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Notificaciones")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Toggle("Activar notificaciones", isOn: $notificaciones)
                                .tint(Tema.azul)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background(Tema.tarjeta)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .padding()
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Configuracion()
}

