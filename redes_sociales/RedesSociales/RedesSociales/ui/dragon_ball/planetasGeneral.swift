//
//  planetasGeneral.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import Foundation
import SwiftUI

struct PantallaPlanetasGeneral: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_planeta != nil) {
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("Planetas")
                                .padding()
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }
                        
                        ForEach(controlador.pagina_resultados_planeta!.items){ planetaNom in
                            NavigationLink {
                                PlanetaVistaGen()
                            } label : {
                                HStack{
                                    AsyncImage(url: URL(string: planetaNom.image)) { image in
                                        image
                                            .image?.resizable()
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:200, height: 200)
                                            .frame(maxWidth: .infinity)
                                    }
                                    
                                    Text("Planeta \(planetaNom.name)")
                                        .font(.title)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                }
                                .padding()
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_planeta(id: planetaNom.id)
                            }))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .background(Color.indigo,in:RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        .padding()
                    }
                }
                .background(Color.orange)
            }
        }
        else {
            // pantalla de carga
            Text("Descargando polkanetas")
                .onAppear{
                    Task {
                        await controlador.descargar_planetas()
                    }
                }
        }
    }
}

#Preview {
    PantallaPlanetasGeneral()
        .environment(ControladorAplicacion())
}
