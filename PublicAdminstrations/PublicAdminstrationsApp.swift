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
	let navBarAppeareance = UINavigationBarAppearance()

	init(){
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
		navBarAppeareance.backgroundColor = UIColor(Color.white)


		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppeareance
		UINavigationBar.appearance().standardAppearance = navBarAppeareance


	}

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
