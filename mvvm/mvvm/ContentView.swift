//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    var body: some View { // Deuda tecnica
        if controlador.estado_actual_de_la_aplicacion == .mostrando_series{
            MenuPrincipalSeries()
        }
        else {
            AgregarSerie()
        }
        
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
