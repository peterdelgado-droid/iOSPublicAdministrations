//
//  HomeView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct HomeView: View {

	@EnvironmentObject private var vm: PubliAdminstrationsViewModel
	@State private var showInfo: Bool = false

    var body: some View {
		
		VStack {
			ZStack {
				Rectangle()
					.fill(.green)
					.frame(width: 400, height: 80)

				Text("Adminstraciones asociadas")
					.foregroundColor(Color.white)
					.font(.system(size: 20))


			}
			HStack {

				CircleButtonView(iconName: "info")
					.rotationEffect(Angle(degrees: showInfo ? 180 : 0))
					.onTapGesture {
						withAnimation(.spring()) {
							showInfo.toggle()
						}
					}
				SearchBarView(searchText: $vm.searchText)
				Text("\(vm.allAdmins.count) admin.")
					.foregroundColor(Color.green)
					.font(.footnote)
			}
			if showInfo {
				InfoView(showInfo: $showInfo)

			}
			allAdminsList
		}
	}
}

extension HomeView {
	private var allAdminsList: some View {
		List {
			ForEach(vm.allAdmins){ admin in
				AdminRowView(admin: admin)
					.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))

			}.listRowBackground(Color.white)
		}
		.listStyle(PlainListStyle())
	}
}


