//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import Foundation
import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    
    var body: some View {
        HStack{
            Text("\(controlador.publicacion_seleccionada?.title ?? "Titulito")")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.leading)
                .bold()
            Spacer()
        }
        
        HStack{
            Text("\(controlador.publicacion_seleccionada?.body ?? "Texitito")")
                .padding(.leading)
            Spacer()
        }
        
        
        
        NavigationLink{
            PerfilBasicoVista()
        } label : {
            Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name) ")
                    Text("\(comentario.body)")
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
