//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

import SwiftUI

struct GeneralPublicaciones: View {
    //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("Publicaciones")
                        .font(.largeTitle)
                        .bold()
                        .padding(30)
                    Spacer()
                }
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink {
                            PublicacionVista()
                        } label : {
                            VStack {
                                HStack{
                                    Text("\(publicacion.id)")
                                        .font(.headline)
                                        .bold()
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.top)
                                HStack{
                                    Text("\(publicacion.title)")
                                        .font(.title2)
                                        .bold()
                                        .padding(.leading)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                }
                                HStack{
                                    Text("\(publicacion.body)")
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .padding(.leading)
                                }
                                .padding(.bottom)
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .background(Color.gray,in:RoundedRectangle(cornerRadius: 14))
                            .foregroundColor(.white)
                            .padding()
                            
                        }
                        .simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
                    }
                }
            }
        }
        
        .onAppear{
            print("hola mundo")
        }
    }
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
