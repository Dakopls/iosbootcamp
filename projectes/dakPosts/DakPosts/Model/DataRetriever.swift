//
//  DataRetriever.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import Foundation

protocol DataRetriever {
    func retrieve<T: Codable>(url: String, method: String, _ completionBlock: @escaping (Result<T, Error>) -> Void)
}

extension DataRetriever {
    //així podem definir que per defecte utilitzarem el mètode get (les extensions son per a això)
    func retrieve<T: Codable>(url: String,
                              method: String = "GET",
                              _ completionBlock: @escaping (Result<T, Error>) -> Void) {
        self.retrieve(url: url, method: method, completionBlock)
        
    }
}
