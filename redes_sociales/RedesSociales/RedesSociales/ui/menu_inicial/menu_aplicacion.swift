//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import Foundation
import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            
            GeneralPublicaciones()
                .tabItem { Label("Pantalla 1", systemImage: "house.fill") }
                .badge(controlador.publicaciones.count)
            
            Text("Hola dos")
                .tabItem {
                    Label{
                        Text("Hola mundo desde abajo")
                        Text("Apoco si")
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("Tilin"))
                    }
                }
            
            Text("Hola tres")
                .tabItem { Label("Pantalla 3", systemImage: "person") }
            
            
            //Codigo mas moderno
            //Tab("Etiqueta", systemImage: "Perfil"){ Text("Referencia a la pantallla")}
            
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
