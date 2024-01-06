//
//  ServiceTests.swift
//  FindMyIPTests
//
//  Created by Ajit Satarkar on 06/01/24.
//

import XCTest
import Combine
@testable import FindMyIPAjitS

class ServiceTests: XCTestCase {

    let expectedModel = FindMyIPModel(
        ip: "43.241.27.242",
        network: "43.241.27.0/24",
        version: "IPv4",
        city: "Pune",
        region: "Maharashtra",
        regionCode: "MH",
        country: "IN",
        countryName: "India",
        countryCode: "IN",
        countryCodeIso3: "IND",
        countryCapital: "New Delhi",
        countryTLD: ".in",
        continentCode: "AS",
        inEu: false,
        postal: "411005",
        latitude: 18.6161,
        longitude: 73.7286,
        timezone: "Asia/Kolkata",
        utcOffset: "+0530",
        countryCallingCode: "+91",
        currency: "INR",
        currencyName: "Rupee",
        languages: "en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,ks,ne,sd,kok,doi,mni,sit,sa,fr,lus,inc",
        countryArea: Int(3287590.0),
        countryPopulation: 1352617328,
        asn: "AS132770",
        org: "Gazon Communications India Limited"
    )
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetFindMyIPServiceData_Success() {
        let expectation = XCTestExpectation(description: "Expecting a valid response")
        let baseURL = URL.findMyIPUrl()
        let service = Service.shared
        let cancellable = service.getFindMyIPServiceData(baseURL: baseURL!)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Error: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { model in
                XCTAssertEqual(model, self.expectedModel, "Received model should match the expected model")
            })

        wait(for: [expectation], timeout: 5.0)
        cancellable.cancel()
    }

}
