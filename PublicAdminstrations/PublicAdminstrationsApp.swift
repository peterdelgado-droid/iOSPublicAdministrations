//
//  PublicAdminstrationsApp.swift
//  PublicAdminstrations
//
//  Created by Peter Delgado on 27/9/23.
//

import SwiftUI

@main
struct PublicAdminstrationsApp: App {

	@State private var showLaunchView: Bool = true

	@StateObject private var vm = PubliAdminstrationsViewModel()
    var body: some Scene {
        WindowGroup {
			NavigationView {
				HomeView()
			}
			.zIndex(2.0)
			.environmentObject(vm)
		}
    }
}
