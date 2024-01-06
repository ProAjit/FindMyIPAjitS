//
//  FindMyIPModelTests.swift
//  FindMyIPTests
//
//  Created by Ajit Satarkar on 06/01/24.
//

import XCTest
@testable import FindMyIPAjitS

class FindMyIPModelTests: XCTestCase {

    func testDecoding() throws {
        let json = """
             {
                 "ip": "43.241.27.242",
                 "network": "43.241.27.0/24",
                 "version": "IPv4",
                 "city": "Pune",
                 "region": "Maharashtra",
                 "region_code": "MH",
                 "country": "IN",
                 "country_name": "India",
                 "country_code": "IN",
                 "country_code_iso3": "IND",
                 "country_capital": "New Delhi",
                 "country_tld": ".in",
                 "continent_code": "AS",
                 "in_eu": false,
                 "postal": "411005",
                 "latitude": 18.6161,
                 "longitude": 73.7286,
                 "timezone": "Asia/Kolkata",
                 "utc_offset": "+0530",
                 "country_calling_code": "+91",
                 "currency": "INR",
                 "currency_name": "Rupee",
                 "languages": "en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,ks,ne,sd,kok,doi,mni,sit,sa,fr,lus,inc",
                 "country_area": 3287590.0,
                 "country_population": 1352617328,
                 "asn": "AS132770",
                 "org": "Gazon Communications India Limited"
             }
        """
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()

        XCTAssertNoThrow(try decoder.decode(FindMyIPModel.self, from: jsonData), "Decoding should not throw any errors")
    }
}
