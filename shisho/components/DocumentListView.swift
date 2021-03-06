//
//  DocumentListView.swift
//  shisho
//
//  Created by fujinomiya on 21.8.2020.
//

import SwiftUI

struct DocumentListView: View {
    @Binding var viewingRequest: Bool
    @State private var previewedDocument: UUID = UUID()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Document.title, ascending: true)],
        animation: .default)
    private var documentLibrary: FetchedResults<Document>
    
    var body: some View {
        List {
            Section(header: Text("Recent").font(.title)) {
                ForEach(documentLibrary) { document in
                    DocumentDisplay(document: document, previewRequest: self.$previewedDocument, viewingRequest: self.$viewingRequest)
                }
            }
            Section(header: Text("Library").font(.title)) {
                Button(action: { deleteAll() })
                {
                    Text("Delete all")
                }
            }
        }
    }
    
    func deleteAll()
    {
        withAnimation {
            documentLibrary.forEach(viewContext.delete)

            do { try viewContext.save() }
            catch
            {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct DocumentDisplay: View, Identifiable {
    let id = UUID()
    let document: Document
    @Binding var previewRequest: UUID
    @Binding var viewingRequest: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(document.title ?? "Unknown document")
                    .font(.title2)
                Text(document.author ?? "unknown")
                    .font(.caption)
            }
            .onTapGesture
            {
                if previewRequest == self.id
                {
                    previewRequest = UUID()
                }
                else
                {
                    previewRequest = self.id
                }
            }
          
            if previewRequest == self.id
            {
                Button(action: {
                    self.viewingRequest = true
                }) {
                    Text("Read")
                }
            }
        }
    }
}
