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
                        }
                        
                        ForEach(controlador.pagina_resultados_planeta!.items){ planetaNom in
                            NavigationLink {
                                PlanetaVistaGen()
                            } label : {
                                HStack{
                                    AsyncImage(url: URL(string: planetaNom.image)) { image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:150, height: 250)
                                            .frame(maxWidth: .infinity)
                                    }
                                    
                                    Text("\(planetaNom.name)")
                                        .font(.title)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_planeta(id: planetaNom.id)
                            }))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .background(Color.blue,in:RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        .padding()
                    }
                }
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
