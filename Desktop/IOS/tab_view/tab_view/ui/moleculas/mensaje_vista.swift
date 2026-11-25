//
//  mensaje_vista.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//

import SwiftUI

struct MensajeVista: View {
    let mensaje: Mensaje
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Información del remitente
            HStack(spacing: 10) {
                Image(systemName: "person.circle.fill")
                    .font(.title2)
                    .foregroundStyle(Tema.azul)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(mensaje.remitente ?? "Usuario desconocido")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("TRANSMISIÓN ENVIADA")
                        .font(.system(size: 9))
                        .tracking(2)
                        .foregroundStyle(Tema.azul)
                }
                
                Spacer()
                
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(Tema.azul)
            }
            
            // Contenido del mensaje
            Text(mensaje.cuerpo)
                .font(.body)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .background(Tema.fondo.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Información del receptor
            HStack {
                Image(systemName: "arrow.turn.down.right")
                    .foregroundStyle(Tema.morado)
                
                Text("Para: \(mensaje.receptor ?? "Desconocido")")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(16)
        .background(Tema.tarjeta)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Tema.azul.opacity(0.3), lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Tema.fondo.ignoresSafeArea()
        
        MensajeVista(
            mensaje: Mensaje(
                remitente: nil,
                receptor: "K ase",
                cuerpo: "No se no soy 100tifico"
            )
        )
    }
}
