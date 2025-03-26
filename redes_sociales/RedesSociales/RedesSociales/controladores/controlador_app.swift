//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import Foundation
import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    
    var publicacion_seleccionada: Int = -1
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    func descargar_publicaciones() async {
        defer {
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderApi().descargar_publicaciones() else {return}
        
        publicaciones = publicaciones_descargadas
        
    }
    func descargar_comentarios() async {
        defer {
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderApi().descargar_publicaciones() else {return}
        
        publicaciones = publicaciones_descargadas
    }
}
