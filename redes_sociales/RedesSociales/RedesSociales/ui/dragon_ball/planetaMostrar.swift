//
//  planetaMostrar.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import Foundation
import SwiftUI

struct PlanetaVistaGen : View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_planeta != nil){
            NavigationStack{
                ScrollView{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        Text("Planeta \(controlador.planetaNom?.name ?? "Planetita")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        if let url = URL(string: controlador.planetaNom?.image ?? "Imagencita"){
                            AsyncImage(url: url) { imagen in
                                imagen.image?
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    
                    HStack{
                        Text("¿Esta destruido? \(controlador.planetaNom?.isDestroyed ?? false)")
                            .padding(.horizontal)
                    }
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .background(Color.blue,in:RoundedRectangle(cornerRadius: 18))
                    .foregroundColor(.white)
                    
                    
                    HStack{
                        Spacer()
                        Text("\(controlador.planetaNom?.description ?? "Descripcioncita")")
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
        else {
            Text("Descargando planetas")
                .onAppear{
                    Task {
                        await controlador.descargar_planetas()
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        PlanetaVistaGen()
            .environment(ControladorAplicacion())
    }
}
