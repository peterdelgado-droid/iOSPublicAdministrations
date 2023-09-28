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
				.foregroundColor(searchText.isEmpty ?
								 Color.black : Color.black)

			TextField("Buscar...", text: $searchText)
				.foregroundColor(Color.black)
				.disableAutocorrection(true)
				.overlay(
					Image(systemName: "xmark.circle.fill")
						.padding()
						.offset(x: 10)
						.foregroundColor(Color.black)
						.opacity(searchText.isEmpty ? 0.0 : 1.0)
						.onTapGesture {
							UIApplication.shared.keyWindow?.endEditing(true)
							searchText = ""
						}
					,alignment: .trailing)
		}
		.frame(width: 180)
		.font(.headline)
		.padding()
		.background(RoundedRectangle(cornerRadius: 25)
			.fill(Color.white)
			.shadow(color: Color.black.opacity(0.15),
					radius: 10, x: 0, y:0


				   ))
		.padding()
	}
}


