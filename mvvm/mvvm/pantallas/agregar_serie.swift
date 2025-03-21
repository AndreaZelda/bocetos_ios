//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import Foundation
import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas_agregadas: [Plataforma] = []
    
    @State var nombre_plataforma: String = ""
    @State var imagen_plataforma: String = ""
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text("Agrega una serie")
            .padding()
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        ZStack{
            TextField("Nombre de la serie", text: $nombre_de_la_serie).padding(.leading)
                .frame(height: 55)
                .background(Color.gray,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
        }
        .padding(.horizontal)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie, no tiene nombre")
        }
        
        ZStack{
            TextField("Tipo", text: $tipo_de_la_serie).padding(.leading)
                .frame(height: 55)
                .background(Color.gray,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
        }
        .padding(.horizontal)
        
        
        Spacer()
        Text("Plataformas")
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_agregadas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }.sheet(isPresented: $mostrar_agregar_plataformas){
            Text("Agrega una plataforma")
                .padding()
                .font(.title3)
            ZStack{
                TextField("Nombre de la plataforma", text: $nombre_plataforma).padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
            }
            .padding(.horizontal)
            
            ZStack{
                TextField("Indica la imagen", text: $imagen_plataforma).padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray,in:RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
            }
            .padding(.horizontal)
            
            
            
            ScrollView(){
                VStack{
                    ForEach(plataformas){plataforma in
                        Text(plataforma.nombre)
                        
                    }
                }
            }
            
            Button("Agregar plataforma"){
                if !nombre_plataforma.isEmpty && !imagen_plataforma.isEmpty{
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
                    
                    plataformas_agregadas.append(plataforma_nueva)
                    
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                }
            }
        }
        Spacer()

        
        Button("Agregar Plataforma"){
            mostrar_agregar_plataformas = true
        }
        .padding()
        
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas:plataformas_agregadas, fecha_estreno: 1, sinopsis: "Una aleatoria", caratula: "Fotillo")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
        }
        .padding()
        Spacer()
    }
}

/*
 var id = UUID()
 
 var nombre: String
 var tipo: String
 
 var plataformas: [Plataforma] = [] //Aqui tengo una deuda tecnica para indicar otras plataformas de forma más fácil
 
 var fecha_estreno: Int
 var sinopsis: String

 var temporadas: [Temporada] = []
 
 var caratula: String
 */


#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
