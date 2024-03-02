//
//  Screen1draftApp.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import SwiftUI
import SwiftData

@main
struct Screen1Draft: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for : [UserPinnedCities.self])
    }
}
