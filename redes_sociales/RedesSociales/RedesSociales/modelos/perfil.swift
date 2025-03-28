//
//  perfil.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import Foundation
import SwiftUI

struct Perfil: Codable, Identifiable {
    let id: Int
    
    let name: String
    let username: String
    
    let email: String
    let phone: String
}
