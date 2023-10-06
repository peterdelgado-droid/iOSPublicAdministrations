//
//  HomeView.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

struct MyUIViewController: UIViewControllerRepresentable {
	var item: PublicAdministrationModel


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

	

	@Environment(\.horizontalSizeClass) var horizontalSizeClass

	func paddingValue(for size: CGSize) -> CGFloat {
		let screenWidth = size.width

		switch screenWidth {
		case ..<321: // iPhone SE (1st generation) and earlier
			return 1
		case 321..<375: // iPhone SE (2nd generation) and iPhone 6/6s/7/8
			return 5
		case 375..<414: // iPhone 6/6s/7/8 Plus and iPhone X/XS/11 Pro
			return -20
		case 414..<428: // iPhone 11/XR/11 Pro Max
			return 15
		default: // For future iPhone models or larger screens
			return -40
		}
	}


	func fontSize(for size: CGSize) -> CGFloat {
		let baseFontSize: CGFloat = 24
		let scaleFactor: CGFloat = 0.8

		let adjustedFontSize = baseFontSize * scaleFactor
		let availableWidth = size.width

		let font = UIFont.systemFont(ofSize: adjustedFontSize)
		let fontAttributes = [NSAttributedString.Key.font: font]
		let textWidth = NSAttributedString(string: "Hello, World!", attributes: fontAttributes).size().width

		let scale = min(1, availableWidth / textWidth)
		let scaledFontSize = adjustedFontSize * scale

		return scaledFontSize
	}



    var body: some View {
		GeometryReader { geometry in
			VStack {
				HStack {
					NavigationLink(destination: EmptyView()) {
						HStack {
							Image(systemName: "chevron.left")
								.font(.largeTitle)
								.foregroundColor(.white)
								.padding(.leading,paddingValue(for: geometry.size))
							Text("Administraciones asociadas")
								.lineLimit(1)
								.minimumScaleFactor(0.5)
								.fixedSize(horizontal: false, vertical: true)
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
				HStack(spacing: 3) {
					CircleButtonView(iconName: "info")
						.padding(.leading,paddingValue(for: geometry.size))
						.offset(x: -7)
						.onTapGesture {
							showInfo.toggle()
						}
					SearchBarView(searchText: $vm.searchText)
						.offset(y: -6)
					Text("\(vm.allAdmins.count) admin.")

						.lineLimit(1)
						.font(.system(size: fontSize(for: geometry.size)))
						.foregroundColor(Color.green)
						.offset(x: 13, y: -6)
						.padding(.trailing,paddingValue(for: geometry.size))
						.fixedSize(horizontal: false, vertical: true)




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

					.listRowSeparator(.hidden)
					.padding(.top, 20)
					.padding(.bottom, 60)
					.padding(.leading, 20)


				
				
			}.frame(height: 45)
}
.listStyle(PlainListStyle())

	}

}
