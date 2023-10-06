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

	func paddingValue(for size: CGSize) -> CGFloat {
		if size.width <= 375 {
			return -30
		} else {
			return 0
		}
	}


    var body: some View {
		HStack(spacing: 5) {
				leftColumn
				Spacer()
				//centerColumn
				//rightColumn
			}
		

		Rectangle()
			.frame(height: 10)
			.foregroundColor(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
			.edgesIgnoringSafeArea(.horizontal)
			.padding(.top, 15)
			.padding(.horizontal, -40)
			.padding(.vertical, 5)
			.padding(.bottom,-6)
		


	}
}


extension AdminRowView {

	private var leftColumn: some View {
			HStack (spacing: 30) {
				AdminImageView(admin:admin)
					.frame(width: 80, height: 90)
					.padding(.top)
					.padding(.leading)
					.padding(.bottom)
					.scaledToFit()
				VStack(alignment:.leading) {
					Text(admin.nombre ?? "")
						.font(.custom("SFProDisplay-Bold", size: 17))
						.fixedSize(horizontal: false, vertical: true)
						.frame(minWidth: 30)
						.lineLimit(1)
						.minimumScaleFactor(0.5)


					Text(admin.direccion ?? "")
						.font(.custom("SFProDisplay-Regular", size: 15))
						.fixedSize(horizontal: false, vertical: true)
					
						.minimumScaleFactor(0.5)

				}.offset(y:-23)
				Spacer()
				VStack(alignment:.center) {
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
				}.padding(.trailing, -20)

			}.padding(.top)
			.padding(.leading, -20)
		

		
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


