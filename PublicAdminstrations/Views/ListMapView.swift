//
//  ListMapView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 3/10/23.
//

import SwiftUI

struct ListMapView: View {
	var body: some View {
		ZStack {
			HStack {
					Image("list-icon-green")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 35, height: 35)
					Text("Listado")
						.font(.custom("SFProDisplay-Bold", size: 20))

						.foregroundColor(Color(red: 128 / 255, green: 128 / 255, blue: 128 / 255))
					Spacer().frame(maxWidth: 120)
					Image("map-icon-green")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 35, height: 35)
					Text("Mapa")
						.font(.custom("SFProDisplay-Bold", size: 20))
						.foregroundColor(Color(red: 128 / 255, green: 128 / 255, blue: 128 / 255))
			}
		}
	}
}


struct ListMapView_Previews: PreviewProvider {
    static var previews: some View {
        ListMapView()
    }
}
