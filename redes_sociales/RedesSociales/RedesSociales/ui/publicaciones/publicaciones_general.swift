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
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink {
                            PublicacionVista()
                        } label : {
                            VStack {
                                HStack{
                                    Text("\(publicacion.id)")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                }
                                Text("\(publicacion.title)")
                                Text("\(publicacion.body)")
                                
                            }
                            .clipShape(Rectangle())
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
