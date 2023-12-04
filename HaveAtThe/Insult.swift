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

    init(id: UUID = UUID(),
         preface: String = "Thou...",
         firstLine: String = InsultGenerator.firstPart,
         secondLine: String = InsultGenerator.secondPart,
         thirdLine: String = InsultGenerator.thirdPart ,
         firstCharacter: String = Characters.randomCharacter(),
         secondCharacter: String = Characters.randomCharacter(),
         playCitation: String = InsultGenerator.playCitation()) {
        self.id = id
        self.preface = preface
        self.firstLine = firstLine
        self.secondLine = secondLine
        self.thirdLine = thirdLine
        self.firstCharacter = firstCharacter
        self.secondCharacter = secondCharacter
        self.playCitation = playCitation
    }
    
}



