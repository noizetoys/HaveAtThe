//
//  MainView.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI
import SwiftData


struct MainView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var showNewInsultView: Bool = false
    @State private var showInsultListView: Bool = false
    @State private var isPortrait: Bool = true
    
    @Query private var insults: [Insult]
    
    
    var body: some View {
        NavigationStack {
            orientationAwareView
                .padding()
                .navigationDestination(isPresented: $showNewInsultView) {
                    InsultView()
                }
                .navigationDestination(isPresented: $showInsultListView) {
                    InsultListView()
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            let orientation = UIDevice.current.orientation
            isPortrait = orientation == .portrait || orientation == .portraitUpsideDown
        }
    }
    
    
    // MARK: - Views
    
    @ViewBuilder
    private var orientationAwareView: some View {
        Group {
            if isPortrait {
                VStack(spacing: 20) {
                    actualContentView
                }
            }
            else {
                HStack(spacing: 20) {
                    actualContentView
                }
            }
        }
    }
    
    
    @ViewBuilder
    private var actualContentView: some View {
        if insults.count == 0 {
            noSavedInsultsView
        }
        else {
            newInsultButton
            
            insultsListButton
        }
    }
    
    
    private var noSavedInsultsView: some View {
        VStack {
            buttonText("Tap to Create New Insult")
        }
        .background(BackgroundBillView())
        .onTapGesture {
            showNewInsultView.toggle()
        }
    }
    
    
    private var newInsultButton: some View {
        Button {
            showNewInsultView.toggle()
        } label: {
            ZStack {
                Image("BillCropped")
                    .resizable()
                
                Color.white.opacity(0.95)
                
                buttonText("Tap to Create New Insult")
            }
        }
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
    
    
    private var insultsListButton: some View {
        Button {
            showInsultListView.toggle()
        } label: {
            ZStack {
                Image(uiImage: UIImage(named: "AppIcon60x60") ?? UIImage())
                    .resizable(resizingMode: .tile)
                
                Color.white.opacity(0.85)
                
                buttonText("View Saved Insults")
            }
        }
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))

    }
    
    
    // MARK: - Private Func
    
    private func buttonText(_ text: String) -> some View {
        Text(text)
            .font(.title)
            .bold()
            .italic()
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity )
    }
    
}


#Preview {
    MainView()
}
