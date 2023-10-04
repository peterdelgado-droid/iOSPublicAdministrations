//
//  HomeView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct CircleButtonView: View {


	let iconName: String

    var body: some View {
		Image("info-icon-green")
			.foregroundColor(Color.green)
			.font(.system(size: 24))
			.scaleEffect(1.5)
			.offset(x: -7, y: -6)
			.background(
				Circle()
					.foregroundColor(Color.white)

			)

	}
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
		Group{
			CircleButtonView(iconName: "info")
				.previewLayout(.sizeThatFits)
			CircleButtonView(iconName: "plus")
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}
    }
}
