//
//  planetapersonaje.swift
//  RedesSociales
//
//  Created by alumno on 4/28/25.
//

import Foundation
import SwiftUI

let personaje_falso2 = MonoChino(id: 1, name: "Lola", ki: "23", maxKi: "2300", race: "mexicano", gender: "male", description: "es un personaje de dragon ball", image: "imagencita", affiliation: "none", originPlanet: nil, transformations: nil)

let planeta_falso = Planeta(id: 1, name: "Jupiter", isDestroyed: false, description: "Descripcioncita", image: "imagencita")


struct PlanetaVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        Text("Planeta \(controlador.personaje?.originPlanet?.name ?? "Planetita")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        if let url = URL(string: controlador.personaje?.originPlanet?.image ?? "Imagencita"){
                            AsyncImage(url: url) { imagen in
                                imagen.image?
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    
                    HStack{
                        Text("¿Esta destruido? \(controlador.personaje?.originPlanet?.isDestroyed ?? false)")
                            .padding(.horizontal)
                    }
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .background(Color.blue,in:RoundedRectangle(cornerRadius: 18))
                    .foregroundColor(.white)
                    
                    
                    HStack{
                        Spacer()
                        Text("\(controlador.personaje?.originPlanet?.description ?? "Descripcioncita")")
                            .padding()
                        Spacer()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .background(Color.blue,in:RoundedRectangle(cornerRadius: 18))
                    .foregroundColor(.white)
                    .padding()
                }
            }
            .background(Color.indigo)
        }
    }
}

#Preview {
    NavigationStack{
        PlanetaVista()
            .environment(ControladorAplicacion())
    }
}
