//
//  InsultView.swift
//  Shakespeare Insult Kit
//
//  Created by Apple User on 11/16/23.
//

import SwiftUI


struct InsultView: View {
    @Environment(\.modelContext) private var context
    
    @State private var showShareSheet: Bool = false
    @State private var showSavedAlert: Bool = false
    @State private var insult: Insult = .init()
    
    private let shareItem: ShareItemSource = .init()
    
    
    init() {
        generateNewInsult()
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            insultTextView
            
            Spacer()
            
            citationTextView
                .padding(.bottom)
        }
        .foregroundStyle(.black)
        .background(BackgroundBillView())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu("Actions", systemImage: "ellipsis.circle") {
                    Button {
                        showShareSheet.toggle()
                    } label: {
                        Label("Share Insult", systemImage: "square.and.arrow.up")
                    }

                    Button {
                        saveInsult()
                        showSavedAlert.toggle()
                    } label: {
                        Label("Save Insult", systemImage: "square.and.arrow.down")
                    }
                }
            }
        }
        .onTapGesture {
            generateNewInsult()
        }
        .sheet(isPresented: $showShareSheet) {
            ActivityVCWrapper(activityItems: [shareItem])
        }
        .alert("Insult Saved", isPresented: $showSavedAlert) {
            Button("OK", role: .cancel, action: { })
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
        VStack(spacing: 15) {
            Text("\(insult.preface)...")
                .font(.system(size: 24, weight: .bold))
            
            Text(insult.firstLine)
                .font(.system(size: 36, weight: .bold))

            Text(insult.secondLine)
                .font(.system(size: 40, weight: .heavy))

            Text(insult.thirdLine)
                .font(.system(size: 44, weight: .black))
        }
        .allowsTightening(true)
        .italic()
    }
    
    
    private var citationTextView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                calloutBold(insult.firstCharacter)
                calloutBold("to")
                calloutBold(insult.secondCharacter)
                
                Text(insult.playCitation)
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .padding(.top, 10)
            }
            .italic()
        }
    }
    
    
    private func calloutBold(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
}


#Preview("15 Pro Port") {
    InsultView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
}


