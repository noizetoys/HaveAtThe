//
//  Insult.swift
//  HaveAtThe
//
//  Created by Apple User on 12/2/23.
//

import SwiftData
import Foundation
import SwiftUI


@Model
class Insult: Codable {
    @Attribute private(set) var id: Date
    
    private(set) var preface: String
    private(set) var firstLine: String
    private(set) var secondLine: String
    private(set) var thirdLine: String
    
    private(set) var firstCharacter: String
    private(set) var secondCharacter: String
    private(set) var playCitation: String
    
    @Transient
    var insultText: String {
        "\(preface)\(firstLine) \(secondLine) \(thirdLine)"
    }
    
    @Transient
    var charactersText: String {
        "\(firstCharacter) to \(secondCharacter)"
    }
    
    @Transient
    var citationText: String {
        "\(charactersText):\n \(playCitation)"
    }
    
    @Transient
    var fullText: String {
        "\"\(insultText)\" - \(citationText)"
    }
    

    // MARK: - Lifecycle
    
    init(id: Date = .now,
         preface: String = "Thou",
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
    
    
    // MARK: - Codable
    
    enum CodingKeys: CodingKey {
        case id
        case preface
        case firstLine
        case secondLine
        case thirdLine
        case firstCharacter
        case secondCharacter
        case playCitation
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Date.self, forKey: .id)
        self.preface = try container.decode(String.self, forKey: .preface)
        self.firstLine = try container.decode(String.self, forKey: .firstLine)
        self.secondLine = try container.decode(String.self, forKey: .secondLine)
        self.thirdLine = try container.decode(String.self, forKey: .thirdLine)
        self.firstCharacter = try container.decode(String.self, forKey: .firstCharacter)
        self.secondCharacter = try container.decode(String.self, forKey: .secondCharacter)
        self.playCitation = try container.decode(String.self, forKey: .playCitation)
        
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(preface, forKey: .preface)
        try container.encode(firstLine, forKey: .firstLine)
        try container.encode(secondLine, forKey: .secondLine)
        try container.encode(thirdLine, forKey: .thirdLine)
        try container.encode(firstCharacter, forKey: .firstCharacter)
        try container.encode(secondCharacter, forKey: .secondCharacter)
        try container.encode(playCitation, forKey: .playCitation)
    }
}




