//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import Foundation
import SwiftUI
import PhotosUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    var body: some View {
        PhotosPicker(selection: $foto_seleccionada){
            Image(uiImage: foto_a_mostrar ?? UIImage(resource: .icono))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(.circle)
        }
        .onChange(of: foto_seleccionada){valor_anterior, valor_nuevo in
            Task{
                if let foto_seleccionada, let datos = try? await
                    foto_seleccionada.loadTransferable(type: Data.self){
                    if let imagen = UIImage(data: datos){
                        foto_a_mostrar = imagen
                    }
                }
            }
        }
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Nombrecito")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Nombresote")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Correito")")
    }
        
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
