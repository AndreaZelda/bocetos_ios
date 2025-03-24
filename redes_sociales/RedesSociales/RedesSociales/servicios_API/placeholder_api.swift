//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

import SwiftUI

class PlaceHolderApi{
    func descargar_publicaciones(desde: String) async throws -> [Publicacion]?{
        do {
            guard let url = URL(string: desde) else { throw ErroresDeRed.badUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus }
            guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta }
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
        return nil
    }
}


