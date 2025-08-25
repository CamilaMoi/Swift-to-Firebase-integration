//
//  ContentView.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 01/08/25.
//

import SwiftUI

struct FContentView: View {
    @StateObject private var firestoreVM = NoteViewModel()
    @State private var showingAddNote = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        VStack{
            
            NavigationView {
                List {
                    ForEach(firestoreVM.notes) { note in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(note.title).font(.headline)
                                Text(note.content).font(.subheadline)
                            }
                            Spacer()
                            Button("Delete") {
                                firestoreVM.deleteNote(note: note)
                            }
                        }
                        .swipeActions {
                            Button("Edit") {
                                // handle editing note here
                                showingAddNote = true
                            }
                            .tint(.blue)
                        }
                    }
                }
                .navigationTitle("Notes")
                .navigationBarItems(trailing: Button(action: {
                    showingAddNote = true
                }) {
                    Image(systemName: "plus")
                })
                .onAppear {
                    firestoreVM.getNotes()
                }
                .sheet(isPresented: $showingAddNote) {
                    AddNoteView(firestoreVM: firestoreVM)
                }
            }
        }
        
        
        
    }
}
#Preview {
    FContentView()
}
