//
//  AdminImageService.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import Foundation
import Combine
import SwiftUI


class AdminImageService {

	@Published var image: UIImage? = nil

	private var imageSubscription: AnyCancellable?
	private var admin: PublicAdministrationModel


	init(admin: PublicAdministrationModel) {
		self.admin = admin
		getAdminImage()
	}


	private func getAdminImage() {
		guard let url = URL(string: admin.urlFoto ?? "")
		else {return}

		imageSubscription = NetworkManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion:  NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
				self?.image = returnedImage
				self?.imageSubscription?.cancel()
			})
	}
}
