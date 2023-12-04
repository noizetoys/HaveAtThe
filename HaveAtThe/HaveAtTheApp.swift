//
//  HaveAtTheApp.swift
//  HaveAtThe
//
//  Created by Apple User on 11/17/23.
//

import SwiftUI
import SwiftData


@main
struct HaveAtTheApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Insult.self)
    }
}
