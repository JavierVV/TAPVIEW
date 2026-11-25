//
//  controlador_hogar_vista.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct ControlHogarVista: View {
    @Environment(MensajesControl.self) var mensajeria
    
    var body: some View {
        TabView {
            
            // MARK: - INICIO
            Tab("Inicio", systemImage: "square.grid.2x2.fill") {
                ZStack {
                    
                    // Imagen de fondo
                    Image("Image12")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    // Capa oscura para mejorar la lectura
                    Color.black.opacity(0.50)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 25) {
                        
                        Spacer()
                        
                        Text("NEXUS SYSTEM")
                            .font(.caption)
                            .tracking(5)
                            .foregroundStyle(Tema.azul)
                        
                        Text("Centro de control")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                        
                        // Icono central
                        Image(systemName: "cpu")
                            .font(.system(size: 100))
                            .foregroundStyle(Tema.gradiente)
                            .shadow(color: Tema.azul.opacity(0.8), radius: 20)
                        
                        Text("Sistema operativo")
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text("CONECTADO • TODOS LOS SISTEMAS ACTIVOS")
                            .font(.system(size: 9))
                            .tracking(2)
                            .foregroundStyle(Tema.azul)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        // Tarjeta informativa
                        HStack(spacing: 15) {
                            Image(systemName: "message.fill")
                                .font(.title2)
                                .foregroundStyle(Tema.azul)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Comunicaciones")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text("\(mensajeria.conversaciones.count) conversaciones registradas")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                        .padding()
                        .background(.black.opacity(0.65))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .overlay {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Tema.azul.opacity(0.4), lineWidth: 1)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .preferredColorScheme(.dark)
            }
            
            // MARK: - HOGAR
            Tab("Hogar", systemImage: "house.fill") {
                ARPantalla()
            }
            
            // MARK: - MENSAJES
            Tab("Mensajes", systemImage: "message.fill") {
                ConversacionesControlVista()
            }
            .badge(mensajeria.conversaciones.count)
            
            // MARK: - CONFIGURACIÓN
            Tab("Ajustes", systemImage: "gearshape.fill") {
                Configuracion()
            }
        }
        .tint(Tema.azul)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ControlHogarVista()
        .environment(MensajesControl())
}
