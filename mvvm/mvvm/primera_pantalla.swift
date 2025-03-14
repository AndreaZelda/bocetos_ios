//
//  primera_pantalla.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation
import SwiftUI

@main
struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup(id: "nombre"){
            ContentView()
                .environment(controlador_basico)
        }
    }
}
