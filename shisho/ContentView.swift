//
//  ContentView.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI

struct ContentView: View {
    @State var inViewer = false
    
    var body: some View {
        if inViewer {
            PDFView()
        }
        else {
            VStack(alignment: .leading) {
                DocumentListView(viewingRequest: self.$inViewer)
            }
            .toolbar(content: { AddFileButtonView() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

