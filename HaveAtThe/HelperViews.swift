//
//  HelperViews.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI


struct BackgroundBillView: View {
    private let aspectRatio: ContentMode
    private let resize: Bool
    
    
    init(aspectRatio: ContentMode = .fill, resize: Bool = false) {
        self.aspectRatio = aspectRatio
        self.resize = resize
    }
    
    
    var body: some View {
        ZStack {
            theImage()
                .aspectRatio(contentMode: aspectRatio)
            
            Color.white.opacity(0.95)
        }
    }
    
    
    private func theImage() -> some View {
        if resize {
            return Image("BillCropped")
                .resizable()
        }
        else {
            return Image("BillCropped")
        }
    }
}


protocol DeviceRecognizable { }

extension DeviceRecognizable {
    var isOniPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
}
