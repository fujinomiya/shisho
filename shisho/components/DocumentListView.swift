//
//  DocumentListView.swift
//  shisho
//
//  Created by fujinomiya on 21.8.2020.
//

import SwiftUI

struct DocumentListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Document.title, ascending: true)],
        animation: .default)
    private var documentLibrary: FetchedResults<Document>
    
    var body: some View {
        List {
            Section(header: Text("Recent").font(.title)) {
                ForEach(documentLibrary) { document in
                    DocumentDisplay(document: document)
                }
            }
            Section(header: Text("Library").font(.title)) {
                Text("nothing here")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { documentLibrary[$0] }.forEach(viewContext.delete)

            do { try viewContext.save() }
            catch
            {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct DocumentDisplay: View {
    let document: Document
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(document.title ?? "Unknown document")
                .font(.title2)
            Text(document.author ?? "unknown")
                .font(.caption)
        }
    }
}

struct DocumentListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentListView()
    }
}
