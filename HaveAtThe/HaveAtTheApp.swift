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
    
//    init() {
//        let background = UIImage(named: "BillCropped") ?? UIImage()
//        
////        UIView.appearance().backgroundColor = UIColor(patternImage: UIImage(named: "BillCropped") ?? UIImage()).withAlphaComponent(0.95)
////        UIView.appearance().backgroundColor = UIColor(patternImage: background).withAlphaComponent(0.1)
//        UIView.appearance().backgroundColor = UIColor(patternImage: background)
//    }
    
    
    var body: some Scene {
        WindowGroup {
//            InsultView()
            MainView()
        }
        .modelContainer(for: Insult.self)
    }
}
