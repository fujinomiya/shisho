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
            ForEach(documentLibrary) { document in
                DocumentDisplay(document: document)
            }
        }
    }
}

struct DocumentDisplay: View {
    let document: Document
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(document.title ?? "Unknown document")
                .font(.title)
            Text(document.author ?? "unknown")
        }
    }
}

struct DocumentListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentListView()
    }
}
