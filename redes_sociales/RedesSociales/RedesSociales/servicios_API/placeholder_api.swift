//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

import SwiftUI

class PlaceHolderApi{
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones() async -> [Publicacion]? {
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(post_id: Int) async -> [Comentario]? {
        let ubicacion_recurso = "/posts/\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    
    func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_de_servicio)\(recurso)") else { throw ErroresDeRed.badUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus }
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta }
            
            return respuesta_decodificada
        }
        catch ErroresDeRed.badUrl {
            print("Tienes mal la url, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salio mal en la respuesta, revisa porfi")
        }
        catch ErroresDeRed.badStatus {
            print("Tas mal en el status")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementacion de este")
        }
        catch ErroresDeRed.invalidRequest{
            print("Como llegaste aqui")
        }
        catch {
            print("Algo malo ha pasao, no deberias de ver esto")
        }
        return nil
    }
}


