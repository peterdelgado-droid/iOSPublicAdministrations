//
//  SearchBarView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct SearchBarView: View {

	@Binding var searchText: String
	@State private var paddingValue: CGFloat = 0

	func paddingValue(for size: CGSize) -> CGFloat {
		if size.width <= 375 {
			paddingValue = 2
			return 15
		} else {
			paddingValue = 3
			return 5
		}
	}

	let screenSize = UIScreen.main.bounds.size

	var body: some View {
		HStack{
			Image(systemName: "magnifyingglass")
				.opacity(0.5)
				.foregroundColor(searchText.isEmpty ?
								 Color.gray : Color.gray)

			TextField("Buscar...", text: $searchText)
				.foregroundColor(Color.black)
				.disableAutocorrection(true)
				.overlay(
					Image("ubucacion-no-active")
						.padding()
						.offset(x: 10)
						.foregroundColor(Color.black)
						.font(.system(size: 24))
						.scaleEffect(1.5)

					,alignment: .trailing)
		}
		.frame(width: UIScreen.main.bounds.width / 2, height: 20, alignment: .trailing)
		.font(.custom("SFProDisplay-Regular", size: 20))


		.padding(.all, 10)
		.background(
			RoundedRectangle(cornerRadius: 5)
				.stroke(Color.gray, lineWidth: 0.3)
		)
	}
}


