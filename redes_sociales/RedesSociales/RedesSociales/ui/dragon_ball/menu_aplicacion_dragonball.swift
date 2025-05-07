//
//  menu_aplicacion_dragonball.swift
//  RedesSociales
//
//  Created by alumno on 5/7/25.
//

import Foundation
import SwiftUI

struct MenuNavegacionDragonBall: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            
            PantallaPersonajes()
                .tabItem { Label("Personajes", systemImage: "person.3.fill") }
            
            PantallaPlanetasGeneral()
                .tabItem { Label("Planetas", systemImage: "shared.with.you.circle") }
            
            PantallaPerfil()
                .tabItem { Label("Perfil", systemImage: "person.fill") }
            
        }
    }
}

#Preview {
    MenuNavegacionDragonBall()
        .environment(ControladorAplicacion())
}
