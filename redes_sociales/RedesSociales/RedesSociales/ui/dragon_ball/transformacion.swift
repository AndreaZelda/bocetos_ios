//
//  transformacion.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//

import Foundation
import SwiftUI

let transformaciones_locas = [
    Transformacion(id: 1, name: "locura", image: "imagencita", ki:"23"),
    Transformacion(id: 2, name: "locura2", image: "imagencita2", ki:"232")
]

let transformacion_falsa = MonoChino(id: 1, name: "Lola", ki: "23", maxKi: "2300", race: "mexicano", gender: "male", description: "es un personaje de dragon ball", image: "imagencita", affiliation: "none", originPlanet: nil, transformations: transformaciones_locas)

struct TransformacionVista: View {
    var personaje: MonoChino
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        Text("Transformaciones de \(controlador.personaje?.name ?? "Nombre")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        TransformacionVista(personaje: transformacion_falsa)
            .environment(ControladorAplicacion())
    }
}
