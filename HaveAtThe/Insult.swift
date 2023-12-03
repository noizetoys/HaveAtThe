//
//  Insult.swift
//  HaveAtThe
//
//  Created by Apple User on 12/2/23.
//

import SwiftData
import Foundation


//@Model
class Insult {
//    @Attribute private(set) var id: UUID
    private(set) var id: UUID
    
    private(set) var preface: String
    private(set) var firstLine: String
    private(set) var secondLine: String
    private(set) var thirdLine: String
    
    private(set) var firstCharacter: String
    private(set) var secondCharacter: String
    private(set) var playCitation: String
    
//    @Transient
    var insultText: String {
        "\(preface)\(firstLine) \(secondLine) \(thirdLine)"
    }
    
//    @Transient
    var citationText: String {
        "\(firstCharacter) to \(secondCharacter):\n \(playCitation)"
    }

    
    init() {
        id = UUID()
        preface = "Thou..."
        firstLine = InsultGenerator.firstPart
        secondLine = InsultGenerator.secondPart
        thirdLine = InsultGenerator.thirdPart
        
        firstCharacter = Characters.randomCharacter()
        secondCharacter = Characters.randomCharacter()
        
        playCitation = InsultGenerator.playCitation()
    }
    
}



