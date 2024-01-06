//
//  HttpService.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

import Foundation
import Combine

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public protocol ServiceProtocol {
    func getFindMyIPServiceData(baseURL: URL) -> AnyPublisher<FindMyIPModel, Error>
}

public class Service {
    public static let shared = Service()
    public init() {}
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
extension Service: ServiceProtocol {
        
    public func getFindMyIPServiceData(baseURL: URL) -> AnyPublisher<FindMyIPModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: baseURL)
                .map(\.data)
                .decode(type: FindMyIPModel.self, decoder: JSONDecoder())
                .mapError { _ in NetworkErrors.decoderError }
                .eraseToAnyPublisher()
    }
    
}
