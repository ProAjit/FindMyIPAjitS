//
//  ErrorModel.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

import Foundation

public enum NetworkErrors: Error{
    case urlError
    case responseError
    case decoderError
    case unknownError
}
