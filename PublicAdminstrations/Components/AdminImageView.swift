//
//  AdminImageView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI



struct AdminImageView: View {

	@StateObject var vm: AdminImageViewModel

	init(admin: PublicAdministrationModel) {
		_vm = StateObject(wrappedValue: AdminImageViewModel(admin:admin))
	}


	var body: some View {
		ZStack {
			if let image = vm.image {
				Image(uiImage: image)
					.resizable()
					.scaledToFill()
				}else if vm.isLoading{
				Image("38malaga")
					.resizable()
					.scaledToFill()
					

				} else {
				Image(systemName: "questionmark")
			}

		}
	}
}

struct CoinImageView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
