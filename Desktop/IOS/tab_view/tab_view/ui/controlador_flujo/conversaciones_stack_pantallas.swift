//
//  conversaciones_stack_pantallas.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct ConversacionesControlVista: View {
    @Environment(MensajesControl.self) var mensajes_control
    
    var body: some View {
        NavigationStack {
            ZStack {
                Tema.fondo.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CENTRO DE COMUNICACIONES")
                            .font(.caption)
                            .tracking(3)
                            .foregroundStyle(Tema.azul)
                        
                        Text("Conversaciones")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                        Text("\(mensajes_control.conversaciones.count) conexiones registradas")
                    }
                    .font(.caption)
                    .foregroundStyle(Tema.azul)
                    .padding(.horizontal)
                    
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(mensajes_control.conversaciones) { conversacion in
                                NavigationLink {
                                    MensajesPantalla(
                                        mensajes: conversacion.mensajes
                                    )
                                } label: {
                                    ConversacionPrevista(
                                        converacion: conversacion
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.top)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ConversacionesControlVista()
        .environment(MensajesControl())
}
