//
//  InsultViewTip.swift
//  HaveAtThe
//
//  Created by Apple User on 12/7/23.
//

import Foundation
import TipKit


struct InsultViewTip: Tip {
    var title: Text {
        Text("Tap to save or share insults!")
    }
    
    
    var image: Image? {
        Image(systemName: "hand.tap")
    }
    
}
