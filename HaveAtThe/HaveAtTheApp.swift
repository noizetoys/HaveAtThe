//
//  HaveAtTheApp.swift
//  HaveAtThe
//
//  Created by Apple User on 11/17/23.
//

import SwiftUI
import SwiftData
import TipKit


@main
struct HaveAtTheApp: App {
    
    init() {
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Insult.self)
    }
    
}
