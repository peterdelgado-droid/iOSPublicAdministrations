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
		VStack(spacing: -40) {
			Divider()
				.overlay(.gray)
				.offset(y:-5)
			Text("Si seleccionas una administración, todos tus boletos se enviarán a dicha administración. Si, por algún motivo, no se puede enviar a esta administración se enviará a otra de forma aleatoria.")
				.font(.custom("SFProDisplay-Regular", size: 20))
				.padding(30)
				.fixedSize(horizontal: false, vertical: true)
				.offset(y:20)
			Spacer()
				.frame(minHeight: 10, maxHeight: 60)

			Text("Si no seleccionas ninguna, tus boletos se enviarán a cualquiera de las administraciones de manera aleatoria.")
				.font(.custom("SFProDisplay-Regular", size: 20))
				.padding(25)
				.fixedSize(horizontal: false, vertical: true)
				.offset(x:5)
			}
		Divider().frame(maxHeight: 10)
			.overlay(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
			.offset(y:-5)

		}
}


