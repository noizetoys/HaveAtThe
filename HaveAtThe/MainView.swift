//
//  MainView.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI
import SwiftData


struct MainView: View {
    @State private var showNewInsultView: Bool = false
    @State private var showInsultListView: Bool = false
    
    @Query private var insults: [Insult]
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
//                if insults.count == 0 {
                if insults.count > 100 {
                    noSavedInsultsView
                }
                else {
                    newInsultButton
                    
                    insultsListButton
                }
                
            }
            .navigationDestination(isPresented: $showNewInsultView) {
                InsultView()
            }
            .navigationDestination(isPresented: $showInsultListView) {
                InsultView()
            }
        }
    }
    
    
    // State Views
    // Fresh or No saved Insults
    
    private var noSavedInsultsView: some View {
        VStack {
            buttonText("Tap to Create New Insult!")
        }
        .background(BackgroundBillView())
        .onTapGesture {
            showNewInsultView.toggle()
        }
    }
    
    
    
    // 1 or more saved insults
    private var newInsultButton: some View {
        Button {
            showNewInsultView.toggle()
        } label: {
            ZStack {
                Image("BillCropped")
                    .resizable()
                
                Color.white.opacity(0.95)
                
                buttonText("Tap to Create New Insult!")
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
                
                buttonText("Relive an Insult!")
            }
            
        }
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))

    }
    
    private func buttonText(_ text: String) -> some View {
        Text(text)
            .font(.title)
            .bold()
            .italic()
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity )
    }
    
    
    
//    @ViewBuilder
//    private var backgroundImage: some View {
//        if insults.count > 0 {
//            ZStack {
//                Image("BillCropped")
//                    .resizable()
//                
//                Color.white.opacity(0.95)
//                
//                buttonText("Tap to Create New Insult!")
//            }
//        }
//        else {
//            ZStack {
//                Image("BillCropped")
//                    .aspectRatio(contentMode: .fill)
//                
//                Color.white.opacity(0.95)
//                
//                buttonText("Tap to Create New Insult!")
//            }
//        }
//    }

}


#Preview {
    MainView()
}
