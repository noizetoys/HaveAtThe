//
//  MainView.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI


struct MainView: View {
    @State private var showNewInsultView: Bool = false
    @State private var showInsultListView: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showNewInsultView.toggle()
                } label: {
                    ZStack {
                        Image("BillCropped")
                            .resizable()
                        
                        Color.white.opacity(0.95)

                        buttonText("Create New Insult!")
                    }
                }
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
                Spacer()
                    .frame(height: 20)
                
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
            .padding()
            .navigationDestination(isPresented: $showNewInsultView) {
                InsultView()
            }
            .navigationDestination(isPresented: $showInsultListView) {
                InsultView()
            }
        }
    }
    
    
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
