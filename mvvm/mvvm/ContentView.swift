//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var mostrar_agregar_serie : Bool = false
    
    var body: some View {
        if !mostrar_agregar_serie{
            ScrollView{
                VStack {
                    ForEach(controlador.series_registradas){ _ in
                        Image(systemName: "plus")
                    }
                }
                .padding()
            }
            Spacer()
            
            Button("Agrega por favor una serie de prueba"){
                mostrar_agregar_serie = true
            }
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
