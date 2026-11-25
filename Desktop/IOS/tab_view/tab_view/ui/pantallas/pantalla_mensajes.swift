//
//  pantalla_mensajes.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct MensajesPantalla: View {
    let mensajes: [Mensaje]
    
    var body: some View {
        ZStack {
            // Fondo futurista
            Tema.fondo
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                
                // Encabezado
                VStack(alignment: .leading, spacing: 8) {
                    Text("NEXUS SYSTEM")
                        .font(.caption)
                        .tracking(4)
                        .foregroundStyle(Tema.azul)
                    
                    Text("Mensajes")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    
                    Text("REGISTRO DE TRANSMISIONES")
                        .font(.caption2)
                        .tracking(2)
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Contador de mensajes
                HStack {
                    Image(systemName: "message.fill")
                        .foregroundStyle(Tema.azul)
                    
                    Text("\(mensajes.count) mensajes registrados")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Circle()
                        .fill(.green)
                        .frame(width: 8, height: 8)
                    
                    Text("ACTIVO")
                        .font(.caption2.bold())
                        .foregroundStyle(.green)
                }
                .padding()
                .background(Tema.tarjeta)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
                
                // Lista de mensajes
                ScrollView(.vertical) {
                    LazyVStack(spacing: 18) {
                        ForEach(mensajes) { mensaje in
                            MensajeVista(mensaje: mensaje)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MensajesPantalla(
        mensajes: ConversacionesFalsas[0].mensajes
    )
}
