//
//  AdminImageViewModel.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import Foundation
import SwiftUI
import Combine

class AdminImageViewModel: ObservableObject {

	@Published var image: UIImage? = nil
	@Published var isLoading: Bool = false

	private let admin: PublicAdministrationModel
	private let adminService: AdminImageService
	private var cancellable = Set<AnyCancellable>()

	init(admin: PublicAdministrationModel) {
		self.admin = admin
		self.adminService = AdminImageService(admin: admin)
		addSubsribers()
		self.isLoading = true
	}

	private func addSubsribers() {
		adminService.$image
			.sink { [weak self] (_) in
				self?.isLoading = false
			} receiveValue: { [weak self] (returnedImage) in
				self?.image = returnedImage
			}
			.store(in: &cancellable)
	}
}
