//
//  PantallaPersonajes.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import Foundation
import SwiftUI

struct PantallaPersonajes: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("Dragon Ball")
                                .padding()
                                .font(.largeTitle)
                                .bold()
                        }
                        HStack{
                            Text("Personajes")
                                .font(.title2)
                                .bold()
                                .padding(.bottom)
                        }
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink {
                                PersonajeVista()
                            } label : {
                                HStack{
                                    
                                AsyncImage(url: URL(string: personaje.image)){ image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:150, height: 250)
                                            .frame(maxWidth: .infinity)
                                            //.background(Color.blue)
                                    }
                                    Text("\(personaje.name)")
                                        .font(.title)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        //.background(Color.orange)
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_personaje(id: personaje.id)
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
    }
}

#Preview{
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
