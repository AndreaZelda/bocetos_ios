//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import Foundation
import SwiftUI

class DragonBallAPI: Codable{
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultado? {
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_personaje(id: Int) async -> MonoChino?   {
        let ubicacion_recurso = "/characters/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //PLANETAAAS
    func descargar_pagina_planetas() async -> PaginaResultadoPlaneta? {
        let ubicacion_recurso = "/planets"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_planeta(id: Int) async -> Planeta? {
        let ubicacion_recurso = "/planets/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async  -> TipoGenerico? {
          do {
              guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.badUrl }
              let (datos, respuesta) = try await URLSession.shared.data(from: url)
              guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
              guard respuesta.statusCode >= 200 && respuesta.statusCode < 300  else { throw ErroresDeRed.badStatus }
              do{
                  let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                  
                  return respuesta_decodificada
              }
              catch let error as NSError{
                  print("EL ERROR EN TU MODELO ES: \(error.debugDescription)")
                  throw ErroresDeRed.fallaAlConvertirLaRespuesta
              }
              
              //return respuesta_decodificada
          }
        
        catch ErroresDeRed.badUrl{
            print("Tienes mal todo adios")
        }
        
          catch ErroresDeRed.badResponse {
              print("Algo salio mal con la respuesta, checalo")
          }
          catch ErroresDeRed.badStatus {
              print("Como consigues un status negativo de algo que no se mueve.")
          }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
              print("Tienes mal el modelo o la implementacion de este mismo")
              print("EN dragon ball api")
          }
          
          catch ErroresDeRed.invalidRequest {
              print("Como llegaste aqui?")
          }
          catch {
              print("algo salio mal, no deberia ver esto")
          }
          
          return nil
      }
}

