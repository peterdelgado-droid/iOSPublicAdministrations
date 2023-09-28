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
		Image(systemName: iconName)
			.font(.headline)
			.foregroundColor(Color.green)
			.frame(width: 30, height: 30)
			.background(
				Circle()
					.foregroundColor(Color.white)

			)
			.shadow(color: Color.green.opacity(0.25),
					radius: 10, x: 0, y: 0)
			.padding()
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
