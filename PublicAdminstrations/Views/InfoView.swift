//
//  InfoView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct InfoView: View {

	@Binding var showInfo: Bool
	
    var body: some View {
		VStack {
			Text("Si seleccionas una administración, todos tus boletos se enviarán a dicha administración. Si, por algún motivo, no se puede enviar a esta administración se enviará a otra de forma aleatoria.")
				.font(.body)
				.padding(30)
				.fixedSize(horizontal: false, vertical: true)

			Text("Si no seleccionas ninguna, tus boletos se enviarán a cualquiera de las administraciones de manera aleatoria.")
				.font(.body)
				.padding(25)
				.fixedSize(horizontal: false, vertical: true)
			}
		}
}


