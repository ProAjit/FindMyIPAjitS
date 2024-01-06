//
//  FindMyIPModel.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

import Foundation

// MARK: - FindMyIPModel

public struct FindMyIPModel: Codable, Equatable {
    
    public let ip, network, version, city: String
    public let region, regionCode, country, countryName: String
    public let countryCode, countryCodeIso3, countryCapital, countryTLD: String
    public let continentCode: String
    public let inEu: Bool
    public let postal: String
    public let latitude, longitude: Double
    public let timezone, utcOffset, countryCallingCode, currency: String
    public let currencyName, languages: String
    public let countryArea, countryPopulation: Int
    public let asn, org: String
    
    public static func == (lhs: FindMyIPModel, rhs: FindMyIPModel) -> Bool {
        return lhs.ip == rhs.ip
            && lhs.network == rhs.network
    }

    enum CodingKeys: String, CodingKey {
        
        case ip, network, version, city, region
        case regionCode = "region_code"
        case country
        case countryName = "country_name"
        case countryCode = "country_code"
        case countryCodeIso3 = "country_code_iso3"
        case countryCapital = "country_capital"
        case countryTLD = "country_tld"
        case continentCode = "continent_code"
        case inEu = "in_eu"
        case postal, latitude, longitude, timezone
        case utcOffset = "utc_offset"
        case countryCallingCode = "country_calling_code"
        case currency
        case currencyName = "currency_name"
        case languages
        case countryArea = "country_area"
        case countryPopulation = "country_population"
        case asn, org
        
    }
}
