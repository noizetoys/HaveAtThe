//
//  ContentView.swift
//  Shakespeare Insult Kit
//
//  Created by Apple User on 11/16/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @State private var showShareSheet: Bool = false
    @State private var insult: Insult = .init()
    
    private let shareItem: ShareItemSource
    
    
    init() {
        shareItem = ShareItemSource(insult: "", citation: "")
        generateNewInsult()
    }
    
    
    var body: some View {
        VStack {
            HStack {
//                saveButton
                
                Spacer()
                
                shareButton
                    .frame(width: 60, height: 60)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            insultTextView
            
            Spacer()
            
            citationTextView
                .padding(.bottom)
        }
        .foregroundStyle(.black)
        .background(backgroundImage)
        .onTapGesture {
            generateNewInsult()
        }
        .sheet(isPresented: $showShareSheet) {
            ActivityVCWrapper(activityItems: [shareItem])
        }
    }
    
    
        // MARK: - Private
    
    private func generateNewInsult() {
        withAnimation {
            insult = .init()
            shareItem.insult = insult.insultText
            shareItem.citation = insult.citationText
        }
    }
    
    
    // MARK: - Views
    
    
    private var shareButton: some View {
        Button(action: {
            showShareSheet.toggle()
        }, label: {
            Image(systemName: "square.and.arrow.up")
                .bold()
        })
        .padding()
        .background(Color.white)
        .foregroundStyle(.black)
        .clipShape(Circle())
        .overlay {
            Circle()
                .stroke(Color.black, lineWidth: 1)
                .foregroundStyle(.clear)
        }

    }
    
    
    private var saveButton: some View {
        Button(action: {
            
        }, label: {
            Text("Favorite")
                .bold()
        })
        .padding()
        .background(Color.white)
        .foregroundStyle(.black)
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(Color.black, lineWidth: 1)
                .foregroundStyle(.clear)
        }
    }
    
    
    private var backgroundImage: some View {
        ZStack {
            Image("BillCropped")
                .aspectRatio(contentMode: .fill)
            
            Color.white.opacity(0.95)
        }
    }
    
    
    private var insultTextView: some View {
        VStack(spacing: 15) {
            Text(insult.preface)
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
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
}


