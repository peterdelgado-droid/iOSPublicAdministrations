//
//  InfoView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct InfoView: View {

	@Binding var showInfo: Bool

	@Environment(\.sizeCategory) var sizeCategory
	
    var body: some View {
		VStack(alignment: .leading, spacing: -20) {
			Divider()
				.overlay(.gray)
				.offset(y:-5)
			Group {
				Text("Si seleccionas una administración, todos tus boletos se enviarán a dicha administración. Si, por algún motivo, no se puede enviar a esta administración se enviará a otra de forma aleatoria.")
					.fixedSize(horizontal: false, vertical: true)
					.font(.custom("SFProDisplay-Regular", size: 18))
					.padding(25)
					.padding(.top, -5)
					.offset(y:20)

				Text("Si no seleccionas ninguna, tus boletos se enviarán a cualquiera de las administraciones de manera aleatoria.")
					.font(.custom("SFProDisplay-Regular", size: 18))
					.padding(25)
					.fixedSize(horizontal: false, vertical: true)
			}
			Rectangle()
				.frame(height: 10)
				.foregroundColor(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
				.edgesIgnoringSafeArea(.horizontal)
				.padding(.top, 15)
				.padding(.bottom,5)
		}
		}
}


