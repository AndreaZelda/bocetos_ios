//
//  home.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import Foundation
import SwiftUI

struct PantallaHome: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("Dragon Ball API")
                                .padding()
                                .font(.largeTitle)
                                .bold()
                        }
                        
                        HStack{
                            Text("Bienvenid@!")
                                .font(.title3)
                                .bold()
                        }
                        
                        NavigationLink{
                            PantallaPersonajes()
                        } label : {
                            HStack{
                                VStack{
                                    Spacer()
                                    Text("Ver personajes  ")
                                    Spacer()
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .background(Color.blue,in:RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                            NavigationLink{
                                PantallaPlanetasGeneral()
                            } label : {
                                VStack{
                                    Spacer()
                                    Text("Ver planetas    ")
                                    Spacer()
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
    }
}

#Preview {
    PantallaHome()
        .environment(ControladorAplicacion())
}
