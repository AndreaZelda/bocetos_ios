//
//  infoPersonaje.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import Foundation
import SwiftUI

let personaje_falso = MonoChino(id: 1, name: "Lola", ki: "23", maxKi: "2300", race: "mexicano", gender: "male", description: "es un personaje de dragon ball", image: "imagencita", affiliation: "none", originPlanet: nil, transformations: nil)


struct PersonajeVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        Text("\(controlador.personaje?.name ?? "Nombrecito")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    HStack{
                        if let url = URL(string: controlador.personaje?.image ?? "Imagencita"){
                            AsyncImage(url: url) { imagen in
                                imagen.image?
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: 150, height: 200)
                        }
                    }
                    HStack{
                            NavigationLink {
                                PlanetaVista()
                            } label : {
                                HStack{
                                    Text("Planetas")
                                }
                                .padding()
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .background(Color.yellow,in:RoundedRectangle(cornerRadius: 18))
                                .foregroundColor(.white)
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                //Pendiente conexion a los planetas
                            }))
                        
                        
                        
                        HStack{
                            Text("Transformaciones")
                        }
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .background(Color.orange,in:RoundedRectangle(cornerRadius: 18))
                        .foregroundColor(.white)
                        
                    }
                    Text("Planeta de origen: \(controlador.personaje?.originPlanet?.name ?? "Planetita")")
                        .padding(.horizontal)
                    HStack{
                        Text("Ki: \(controlador.personaje?.ki ?? "0")")
                        Text("MaxKi: \(controlador.personaje?.maxKi ?? "0")")
                    }
                    
                    
                    Text("Raza: \(controlador.personaje?.race ?? "Razita")")
                        .padding(.horizontal)
                    Text("Género: \(controlador.personaje?.gender ?? "Generito")")
                        .padding(.horizontal)
                    Text("Afiliacion: \(controlador.personaje?.affiliation ?? "Afiliacioncita")")
                        .padding(.horizontal)
                    
                    HStack{
                        Spacer()
                        Text("\(controlador.personaje?.description ?? "Descripcioncita")")
                            .padding()
                        Spacer()
                    }
                }
                .background(Color.indigo)
                .foregroundColor(.white)

            }
            }
        }

}

#Preview {
    NavigationStack{
        PersonajeVista()
            .environment(ControladorAplicacion())
    }
}
