//
//  conversaciones_prevista.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//


import SwiftUI

struct ConversacionPrevista: View {
    let converacion: Conversacion
    
    var body: some View {
        HStack(spacing: 15) {
            
            ZStack {
                Circle()
                    .fill(Tema.gradiente)
                    .frame(width: 55, height: 55)
                
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\(converacion.remitente) ↔ \(converacion.receptor)")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("\(converacion.mensajes.count) mensajes")
                    .font(.caption)
                    .foregroundStyle(Tema.secundario)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Tema.azul)
        }
        .padding()
        .background(Tema.tarjeta)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Tema.azul.opacity(0.25), lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Tema.fondo.ignoresSafeArea()
        
        ConversacionPrevista(
            converacion: ConversacionesFalsas[0]
        )
    }
}
