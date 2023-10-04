//
//  SearchBarView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct SearchBarView: View {

	@Binding var searchText: String

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
		.frame(width: 230, height: 15)
		.font(.custom("SFProDisplay-Regular", size: 20))


		.padding()
		.background(
			RoundedRectangle(cornerRadius: 5)
				.stroke(Color.gray, lineWidth: 0.3)
		)
	}
}


