//
//  DocumentParsing.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import Foundation
import PDFKit


func getMetadataPDF(url: URL) -> Metadata?
{
    guard let document = PDFDocument(url: url) else {
        //TODO: handle error
        return nil
    }
    
    guard let metadata = document.documentAttributes else {
        //metadata not specified
        return nil
    }
    
    let container = Metadata(title:   metadata["Title"] as? String,
                             author:  metadata["Author"] as? String,
                             release: metadata["CreationDate"] as? Date,
                             pages:   Int32(document.pageCount))
    
    return container
}
