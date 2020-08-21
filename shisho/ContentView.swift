//
//  ContentView.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            DocumentListView()
        }
        .toolbar(content: { AddFileButtonView() })
        .frame(width: 600, height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
