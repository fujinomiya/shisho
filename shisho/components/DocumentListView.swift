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
                Text("title: \(document.title ?? ""), author: \(document.author ?? ""), pages: \(document.pages)")
            }
        }
    }
}

struct DocumentListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentListView()
    }
}
