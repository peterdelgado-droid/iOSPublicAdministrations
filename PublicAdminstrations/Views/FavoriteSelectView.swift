//
//  FavoriteSelectView.swift
//  PublicAdministrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct FavoriteSelectView: View {

	@State private var isHeartFilled = false
	
	var body: some View {
		Image(systemName: isHeartFilled ? "heart.fill" : "heart")
			.resizable()
			.frame(width: 50, height: 50)
			.foregroundColor(isHeartFilled ? .red : .gray)
			.onTapGesture {
				isHeartFilled.toggle()
			}
	}
}

struct FavoriteSelectView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteSelectView()
    }
}
