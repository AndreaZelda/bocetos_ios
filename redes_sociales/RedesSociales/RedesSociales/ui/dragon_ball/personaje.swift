//
//  infoPersonaje.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import Foundation
import SwiftUI

//let personaje_fake = MonoChino(id: 1, name: "Random", ki: "23", maxKi: "2300", race:"mexicano", gender: "woman", description: "es un personaje de dragon ball" image: "aqui va una imagen", affiliation: "aqui va una afiliacion")

struct PersonajeVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        HStack{
            Text("\(controlador.personajes_seleccionado?.name ?? "Textito")")
        }
        HStack{
            Text("\(controlador.personajes_seleccionado?.image ?? "Imagencita")")
        }
    }
}

#Preview {
    NavigationStack{
        PersonajeVista()
            .environment(ControladorAplicacion())
    }
}
