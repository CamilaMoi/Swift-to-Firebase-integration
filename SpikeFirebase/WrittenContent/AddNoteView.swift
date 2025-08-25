//
//  AddNoteView.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 01/08/25.
//
import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var firestoreVM: NoteViewModel
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Details")) {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                }
                
                Button("Save") {
                    firestoreVM.addNote(title: title, content: content)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
