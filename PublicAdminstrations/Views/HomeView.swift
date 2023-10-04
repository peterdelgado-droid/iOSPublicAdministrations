//
//  HomeView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct MyUIViewController: UIViewControllerRepresentable {
	var item: PublicAdministrationModel

	@Environment(\.sizeCategory) var sizeCategory

	func makeUIViewController(context: Context) -> UIViewController {

		let nameLabel = UILabel()
		nameLabel.text = item.nombre
		nameLabel.translatesAutoresizingMaskIntoConstraints = false

		let addressLabel = UILabel()
		addressLabel.text = item.direccion
		addressLabel.translatesAutoresizingMaskIntoConstraints = false

		let viewController = DetailViewController()
		viewController.view.addSubview(nameLabel)
		viewController.view.addSubview(addressLabel)

		NSLayoutConstraint.activate([
			nameLabel.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
			nameLabel.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 100),

			addressLabel.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
			addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
			addressLabel.widthAnchor.constraint(equalToConstant: 200),
			addressLabel.heightAnchor.constraint(equalToConstant: 200)
		])
		return viewController
	}

	func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
	}
}

struct Item: Identifiable {
	let id: UUID
	let name: String
}



struct HomeView: View {

	@EnvironmentObject private var vm: PubliAdminstrationsViewModel
	@State private var showInfo: Bool = false
	@State private var isActive = false
	@State private var selectedItem: Item? = nil

    var body: some View {
		GeometryReader { geometry in
			VStack {
				HStack {
					NavigationLink(destination: EmptyView()) {
						HStack {
							Image(systemName: "chevron.left")
								.font(.largeTitle)
								.foregroundColor(.white)
								.offset(x: geometry.size.width * -0.07) // Adjust the offset as needed to be responsive to different phone models)
							Text("Administraciones asociadas")
								.foregroundColor(.white)
								.font(.custom("HelveticaNeue", size: 25))
						}
						.padding()
						.frame(maxWidth: .infinity)


					}.background(Color(red: 32 / 255, green: 184 / 255, blue: 115 / 255))

				}

				ListMapView()
				Rectangle()
					.fill(Color.green)
					.frame(width: 350, height: 5)
					.offset(x:-156, y: -4)
				Divider()
					.overlay(.gray)
					.offset(y: -12)
				HStack {
					CircleButtonView(iconName: "info")
						.onTapGesture {
							showInfo.toggle()
						}
					SearchBarView(searchText: $vm.searchText)
						.offset(y: -6)
					Text("\(vm.allAdmins.count) admin.")
						.font(.custom("SFProDisplay-Regular", size: 20))
						.foregroundColor(Color.green)
						.offset(x: 9, y: -6)

				}
				if showInfo {
					InfoView(showInfo: $showInfo)

				}
				allAdminsList
				
			}
		}
	}
}

extension HomeView {
	private var allAdminsList: some View {
		List {
			ForEach(vm.allAdmins) { admin in
				AdminRowView(admin: admin)
					.listRowInsets(.init(top: 5, leading: 1, bottom: 5, trailing: 1))
					.listRowSeparator(.hidden)
			}
			.frame(height: 2)
		}
		.listStyle(PlainListStyle())
	}

}
