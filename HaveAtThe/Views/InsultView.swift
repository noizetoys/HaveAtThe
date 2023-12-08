//
//  InsultView.swift
//  Shakespeare Insult Kit
//
//  Created by Apple User on 11/16/23.
//

import SwiftUI
import SwiftData
import TipKit


struct InsultView: View, DeviceRecognizable {
    @Environment(\.modelContext) private var context
    
    @State private var showShareSheet: Bool = false
    @State private var showSavedAlert: Bool = false
    @State private var insult: Insult = .init()
    @State private var scaleUp = false
    @State private var fadeOut = false
    
    private let shareItem: ShareItemSource = .init()
    private var fontOffest: CGFloat { isOniPad ? 30 : 0 }
    
    
    init() {
        generateNewInsult()
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                insultTextView
                
                Spacer()
                
                citationTextView
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    
                    Button {
                        saveInsult()
                        
                        withAnimation(.easeInOut(duration: 0.8), completionCriteria: .removed ) {
                            scaleUp = true
                            fadeOut = false
                        } completion: {
                            withAnimation {
                                fadeOut = true
                                scaleUp = false
                            }
                        }
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down")
                    }

                    Spacer()
                    
                    ShareLink(item: insult.fullText, subject: Text("Share the Insult"), message: Text(insult.fullText)) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .popoverTip(InsultViewTip(), arrowEdge: .bottom)

                    Spacer()
                }
                .foregroundStyle(.blue)
                .bold()
                .font(.title2)
                .padding()
            }
            .foregroundStyle(.black)
            
            saveConfirmationView
        }
        .background(BackgroundBillView())
        .onTapGesture {
            generateNewInsult()
        }
    }
    
    
        // MARK: - Private
    
    private func generateNewInsult() {
        withAnimation {
            insult = .init()
            shareItem.update(using: insult)
        }
    }
    
    
    private func saveInsult() {
        context.insert(insult)
    }
    
    
    // MARK: - Views
    
    private var insultTextView: some View {
        VStack(spacing: isOniPad ? 25 : 15) {
            Text("\(insult.preface)...")
                .font(.system(size: 24 + fontOffest, weight: .semibold))
            
            Text(insult.firstLine)
                .font(.system(size: 36 + fontOffest, weight: .bold))

            Text(insult.secondLine)
                .font(.system(size: 40 + fontOffest, weight: .heavy))

            Text(insult.thirdLine)
                .font(.system(size: 44 + fontOffest, weight: .black))
        }
        .allowsTightening(true)
        .italic()
    }
    
    
    private var citationTextView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(insult.charactersText)
                    .font(isOniPad ? .title3 : .callout)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

                Text(insult.playCitation)
                    .font(isOniPad ? .callout : .footnote)
                    .fontWeight(.heavy)
                    .padding(.top, 10)
            }
            .italic()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    
    private var saveConfirmationView: some View {
        VStack {
            ZStack {
                
                Circle()
                    .fill(.white.opacity(0.9))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundStyle(.green)
                    .fontWeight(.semibold)
                    .aspectRatio(contentMode: .fit)
                    .padding(60)
                
            }
            .padding(40)
            .scaleEffect(scaleUp ? 1 : 0)
            .opacity(fadeOut ? 0 : 1)
        }
    }
    
}


#Preview("15 Pro Port") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Insult.self, configurations: config)
    
    for _ in 1...3 {
        container.mainContext.insert(Insult())
    }
    
    try? Tips.resetDatastore()
    try? Tips.configure()
    
    return InsultView()
        .modelContainer(for: Insult.self)
}


