//
//  URLExtension.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

import Foundation

public extension URL {
    
    static func findMyIPUrl() -> URL? {
        guard let url = URL(string: "https://ipapi.co/json/") else {
            return nil
        }
        return url
    }
    
}

