//
//  ar_kit_pantallas.swift
//  tab_view
//
//  Created by alumno on 18/11/26.
//

import RealityKit
import SwiftUI


struct ARPantalla: View {
    var body: some View {
        RealityView{ contenido in
            contenido.camera = .spatialTracking
        }
    }
}
