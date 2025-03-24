//
//  errores.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import Foundation

enum ErroresDeRed: Error{
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
