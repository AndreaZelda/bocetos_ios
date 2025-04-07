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
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){
                        
                        personaje in Text("\(personaje.name)")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity)
                            //.background(Color.orange)
                        AsyncImage(url: URL(string: personaje.image)){ image in
                            image
                                .image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:150, height: 250)
                                .frame(maxWidth: .infinity)
                                //.background(Color.blue)
                            
                        }
                        
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
