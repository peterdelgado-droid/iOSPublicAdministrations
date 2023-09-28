//
//  AdminRowView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct AdminRowView: View {

	let admin: PublicAdministrationModel
	@State private var isHighlighted = false

    var body: some View {
		HStack(spacing: 0) {
			leftColumn
			Spacer()
			centerColumn
			Spacer()
			rightColumn
		}
	}
}


extension AdminRowView {

	private var leftColumn: some View {
		HStack {
			AdminImageView(admin:admin)
				.frame(width: 80, height: 80)
		}
	}

	private var centerColumn: some View {
		VStack {
			Text(admin.nombre ?? "")
				.font(.headline)
				.frame(maxWidth: .infinity, alignment: .leading)
			Text(admin.direccion ?? "")
				.frame(maxWidth: .infinity, alignment: .leading)
		}
	}

	private var rightColumn: some View {
		VStack {
			Button(action: {
				self.isHighlighted.toggle()
			}) {
				Image(systemName: isHighlighted ? "heart.fill" : "heart")
					.foregroundColor(isHighlighted ? .green : .gray)
			}
			Text("Favorita")
		}

	}
}


