//
//  transformacion.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//

import Foundation
import SwiftUI

let transformacion_falsa = MonoChino(id: 1, name: "Lola", ki: "23", maxKi: "2300", race: "mexicano", gender: "male", description: "es un personaje de dragon ball", image: "imagencita", affiliation: "none", originPlanet: nil, transformations: nil)

struct TransformacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView{
            HStack{
                Text("Hola desde transformaciones")
            }
        }
    }
}
