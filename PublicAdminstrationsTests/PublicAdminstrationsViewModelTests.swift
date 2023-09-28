//
//  PublicAdminstrationsViewModelTests.swift
//  PublicAdministrationsTests
//
//  Created by Peter Delgado on 27/9/23.
//

import XCTest
import Foundation

@testable import PublicAdministrations

class PubliAdminstrationsViewModelTests: XCTestCase {
	var viewModel: PubliAdminstrationsViewModel!
	var adminService: PublicAdministrationService!


	override func setUp() {
		super.setUp()
		adminService = PublicAdministrationService()
		viewModel = PubliAdminstrationsViewModel()

	}

	override func tearDown() {
		adminService = nil
		viewModel = nil
		super.tearDown()
	}

	// Mock the adminService to provide test data
	func mockAdminService() {
		let testData: [PublicAdministrationModel] = [
			//TODO
		]
		adminService.allAdministrations = testData
	}

	func testSearchTextFiltering() {
		// Given
		mockAdminService()

		// When
		viewModel.searchText = "Admin1"

		// Then
		XCTAssertEqual(viewModel.allAdmins.count, 1)
		XCTAssertEqual(viewModel.allAdmins.first?.nombre, "Admin1")
	}

	func testEmptySearchText() {
		// Given
		mockAdminService()

		// When
		viewModel.searchText = ""

		// Then
		XCTAssertEqual(viewModel.allAdmins.count, 3)
	}
}
