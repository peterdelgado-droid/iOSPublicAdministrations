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
					.frame(width: 100, height: 100)
					.offset(y:-40)
					.padding(.bottom, -3)
					.padding(.leading)
					.padding(.top, -45)
				}else if vm.isLoading{
				Image("38malaga")
					.resizable()
					.frame(width: 100, height: 90)
					.offset(y:-40)
					.padding(.bottom,5)
					.padding(.leading)
					.padding(.top, -45)

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
