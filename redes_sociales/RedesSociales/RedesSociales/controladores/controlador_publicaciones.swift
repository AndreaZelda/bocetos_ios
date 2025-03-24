//
//  controlador_publicaciones.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import Foundation
import SwiftUI

class ControladorPublicaciones: ObservableObject {
    //@Published var publicaciones = [Publicacion]()
    @Published var publicaciones: [Publicacion] = []
    
    let url_de_publicaciones = "https://jsonplaceholder.typicode.com/posts"
    
    func obtener_publicaciones() async {
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderApi().descargar_publicaciones(desde: url_de_publicaciones) else {return}
        publicaciones = publicaciones_descargadas
    }
}
