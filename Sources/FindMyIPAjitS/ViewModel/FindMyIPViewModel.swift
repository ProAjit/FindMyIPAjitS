//
//  FindMyIPViewModel.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

import Foundation
import Combine

public protocol FindMyIPViewModelProtocol {
    var findMyIPError: String { get set }
    var showAlert: Bool { get set }
    var findMyIPData: FindMyIPModel? { get set }
    var isLoading: Bool { get set }
    func getFindMyIPServiceList()
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public class FindMyIPViewModel: ObservableObject, FindMyIPViewModelProtocol {
    
    @Published public var findMyIPError: String = ""
    @Published public var showAlert: Bool = false
    @Published public var findMyIPData: FindMyIPModel?
    @Published public var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    var dataManager: ServiceProtocol
    
    public init(dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
    }
    
    public func getFindMyIPServiceList() {
        isLoading = true
        dataManager.getFindMyIPServiceData(baseURL: .findMyIPUrl()!)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                    break // Do nothing on success
                case .failure(let error):
                    self.handleAPIError(error)
                }
            }) { result in
                self.findMyIPData = result
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    public func handleAPIError(_ error: Error) {
        isLoading = false
        showAlert = true
        if let networkError = error as? NetworkErrors {
            switch networkError {
            case .urlError, .responseError:
                findMyIPError = "Failed to connect to the server."
            case .decoderError:
                findMyIPError = "Failed to decode the response."
            case .unknownError:
                findMyIPError = "An unknown error occurred."
            }
        } else {
            findMyIPError = "An unexpected error occurred."
        }
    }
    
}
