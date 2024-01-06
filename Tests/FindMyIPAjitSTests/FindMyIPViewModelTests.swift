//
//  FindMyIPViewModelTests.swift
//  FindMyIPTests
//
//  Created by Ajit Satarkar on 06/01/24.
//

import XCTest
import Combine
@testable import FindMyIPAjitS

class FindMyIPViewModelTests: XCTestCase {

    var viewModel: FindMyIPViewModelProtocol!
    var dataManager: MockService!

    override func setUp() {
        super.setUp()
        dataManager = MockService()
        viewModel = FindMyIPViewModel(dataManager: dataManager)
    }

    override func tearDown() {
        viewModel = nil
        dataManager = nil
        super.tearDown()
    }

    func testGetFindMyIPServiceListSuccess() {
        // Set up your mock data
        let mockData = FindMyIPModel(ip: "127.0.0.1", network: "Localhost", version: "IPv4", city: "City", region: "Region", regionCode: "RC", country: "Country", countryName: "CountryName", countryCode: "CC", countryCodeIso3: "CCI", countryCapital: "Capital", countryTLD: "TLD", continentCode: "CC", inEu: false, postal: "12345", latitude: 37.7749, longitude: -122.4194, timezone: "UTC", utcOffset: "+00:00", countryCallingCode: "+1", currency: "USD", currencyName: "Dollar", languages: "en", countryArea: 123456, countryPopulation: 789012, asn: "ASN123", org: "Organization")

        // Set up your expectations
        dataManager.mockFindMyIPData = Just(mockData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        let expectation = XCTestExpectation(description: "Successful API call")

        // Call the method under test
        viewModel.getFindMyIPServiceList()

        // Check the expectations
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertEqual(self.viewModel.findMyIPData, mockData)
            XCTAssertFalse(self.viewModel.showAlert)
            XCTAssertEqual(self.viewModel.findMyIPError, "")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testGetFindMyIPServiceListFailure() {
        // Set up your expectations
        dataManager.mockError = NetworkErrors.urlError

        let expectation = XCTestExpectation(description: "Failed API call")

        // Call the method under test
        viewModel.getFindMyIPServiceList()

        // Check the expectations
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNil(self.viewModel.findMyIPData)
            XCTAssertTrue(self.viewModel.showAlert)
            XCTAssertEqual(self.viewModel.findMyIPError, "Failed to connect to the server.")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

// Mock Service class for testing
class MockService: ServiceProtocol {

    var mockFindMyIPData: AnyPublisher<FindMyIPModel, Error>?
    var mockError: Error?

    func getFindMyIPServiceData(baseURL: URL) -> AnyPublisher<FindMyIPAjitS.FindMyIPModel, Error> {
        if let mockFindMyIPData = mockFindMyIPData {
            return mockFindMyIPData
        } else if let mockError = mockError {
            return Fail(error: mockError).eraseToAnyPublisher()
        } else {
            fatalError("No mock data or error provided for testing")
        }
    }
}
