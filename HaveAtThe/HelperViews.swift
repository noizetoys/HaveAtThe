//
//  HelperViews.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI


struct BackgroundBillView: View {
    var body: some View {
        ZStack {
            Image("BillCropped")
                .aspectRatio(contentMode: .fill)
            
            Color.white.opacity(0.95)
        }
    }
}
