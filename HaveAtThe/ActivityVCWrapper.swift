//
//  ActivityVCWrapper.swift
//  HaveAtThe
//
//  Created by Apple User on 11/28/23.
//

import UIKit
import SwiftUI
import LinkPresentation


struct ActivityVCWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    
    var activityItems: [Any]
    var applicationsActivities: [UIActivity]? = nil
    
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationsActivities)
    }
    
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}


class ShareItemSource: NSObject, UIActivityItemSource {
    var insult: String
    var citation: String
    
    
    init(insult: String = "", citation: String = "") {
        self.insult = insult
        self.citation = citation
        super.init()
    }
    
    
    func update(using insult: Insult) {
        self.insult = insult.insultText
        self.citation = insult.citationText
    }
    
    
    // UIActivityItemSource
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        "\(insult) - \(citation)"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        "\(insult) - \(citation)"
    }
    
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {

        guard
            let image = UIImage(named: "AppIcon")
        else { return nil}

        let metadata = LPLinkMetadata()
        metadata.iconProvider = NSItemProvider(object: image)
        metadata.title = "Share the insult: \(insult)"
        
        return metadata
    }
}


