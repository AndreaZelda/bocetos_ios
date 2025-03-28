//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import Foundation
import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Nombrecito")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Nombresote")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Correito")")
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
