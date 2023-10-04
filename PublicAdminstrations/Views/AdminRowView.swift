//
//  AdminRowView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct AdminRowView: View {

	let admin: PublicAdministrationModel
	@State private var isHeartToggled = false

    var body: some View {
		HStack(spacing: 5) {
				leftColumn
				Spacer()
				centerColumn
				rightColumn
			}
		Divider().frame(maxHeight: 10)
			.overlay(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
			.padding(.horizontal, -80)
			.padding(.vertical, -40)
			
	}
}


extension AdminRowView {

	private var leftColumn: some View {
			AdminImageView(admin:admin)
				.frame(maxWidth: .infinity, alignment: .leading)

	}

	private var centerColumn: some View {
		VStack {
			Text(admin.nombre ?? "")
				.font(.custom("SFProDisplay-Bold", size: 17))
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, -55)
				.padding(.top, -100)
				.padding(.bottom, -55)
				.fixedSize(horizontal: false, vertical: true)
			Spacer()
			Text(admin.direccion ?? "")
				.font(.custom("SFProDisplay-Regular", size: 15))
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, -55)
				.padding(.top, -90)
				.padding(.bottom, -55)
				.foregroundColor(Color.gray)
			}
	}

	private var rightColumn: some View {
		VStack {
			Image(systemName: isHeartToggled ? "heart.fill" : "heart")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 25, height: 25)
				.foregroundColor(isHeartToggled ? .green : .gray)
				.onTapGesture {
					self.isHeartToggled.toggle()
				}
			
			Text("Favorita")
				.foregroundColor(Color.gray)
				.font(.custom("SFProDisplay-Regular", size: 15))
		}.padding(.trailing, 20)
			.padding(.bottom, 100)

	}
}


