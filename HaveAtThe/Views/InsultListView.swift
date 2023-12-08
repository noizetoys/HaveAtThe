//
//  InsultListView.swift
//  HaveAtThe
//
//  Created by Apple User on 12/4/23.
//

import SwiftUI
import SwiftData


struct InsultListView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.editMode) private var editMode
    
    @State private var showShareSheet: Bool = false
    @State private var showNewInsultView: Bool = false

    @Query private var insults: [Insult]
    
    private let shareItem: ShareItemSource = .init()
    

    var body: some View {
        if insults.count == 0 {
            noContentView
                .navigationDestination(isPresented: $showNewInsultView) {
                    InsultView()
                }
        }
        else {
            List {
                ForEach(insults) { insult in
                    insultCell(for: insult)
                        .onTapGesture {
                            shareItem.update(using: insult)
                            showShareSheet.toggle()
                        }
                }
                .onDelete { offsets in
                    for index in offsets {
                        let target = insults[index]
                        modelContext.delete(target)
                    }
                }
            }
            .sheet(isPresented: $showShareSheet) {
                if !shareItem.insult.isEmpty && !shareItem.citation.isEmpty {
                    ActivityVCWrapper(activityItems: [shareItem])
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Past Brilliance")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
    
    
    // MARK: - Views
    
    private var noContentView: some View {
        ContentUnavailableView {
            Label("No Insults Saved!", systemImage: "pencil.and.scribble")
                .symbolEffect(.pulse, options: .repeating)
                .font(.largeTitle)
        } actions: {
            Button {
                showNewInsultView.toggle()
            } label: {
                Text("Tap to Create a New Insult")
                    .font(.title)
            }
        }
    }
    
    
    // MARK: - Private Func
    
    private func delete(_ offsets: IndexSet) {
        for index in offsets {
            let insult = insults[index]
            modelContext.delete(insult)
        }
    }
    
    
    private func insultCell(for insult: Insult) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(insult.insultText)
                    .font(.headline)
                
                Text(insult.charactersText)
                    .font(.subheadline)
                
                Text(insult.playCitation)
                    .font(.caption2)
                    .italic()
            }
            
            Spacer()
            
            Image(systemName: "square.and.arrow.up")
                .foregroundStyle(.blue)
                .font(.title3)
        }
    }

}


#Preview {
    InsultListView()
        .modelContainer(for: Insult.self)
}
