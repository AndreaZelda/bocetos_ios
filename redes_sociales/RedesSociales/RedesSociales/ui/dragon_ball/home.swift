//
//  home.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import Foundation
import SwiftUI
import PhotosUI

struct PantallaPerfil: View {
    @Environment(ControladorAplicacion.self) var controlador
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
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
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Bienvenid@!")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }
                        
                        PhotosPicker(selection: $foto_seleccionada){
                            Image(uiImage: foto_a_mostrar ?? UIImage(resource: .icono))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(.circle)
                        }
                        .onChange(of: foto_seleccionada){valor_anterior, valor_nuevo in
                            Task {
                                if let foto_seleccionada, let datos = try? await
                                    foto_seleccionada.loadTransferable(type: Data.self){
                                    if let imagen = UIImage(data:datos){
                                        foto_a_mostrar = imagen
                                    }
                                }
                            }
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
                                .background(Color.indigo,in:RoundedRectangle(cornerRadius: 14))
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
                                .background(Color.indigo,in:RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                                .padding()
                            }
                            
                            
                            
                        }
                        
                    }
                }
                .background(Color.orange)
            }
        }
    }
}

#Preview {
    PantallaPerfil()
        .environment(ControladorAplicacion())
}
