//
//  DocumentParsing.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import Foundation
import PDFKit

func getMetadataPDF(url: URL)
{
    guard let document = PDFDocument(url: url) else {
        //TODO: handle error
        return
    }
    
    guard let metadata = document.documentAttributes else {
        //metadata not specified
        return
    }
    
    let title = metadata["Title"] ?? ""
    let author = metadata["Author"] ?? ""
    let date = metadata["CreationDate"] ?? ""
    
    //TODO: wrap values in an object
}

