//
//  EnvironmentUtility.swift
//  Reward
//
//  Created by Keval Vadoliya on 04/04/21.
//

import Foundation

class EnvironmentUtility {

    fileprivate var infoDictionary: [String: Any] {
        return Bundle.main.infoDictionary ?? [String: Any]()
    }

    func getValueFromMainInfoDictionary(key: String) -> String {
        return infoDictionary[key] as? String ?? String()
    }

    func getUrlFromMainInfoDictionary(protocolKey: String, urlKey: String) -> String {
        let protocolString = EnvironmentUtility().getValueFromMainInfoDictionary(key: protocolKey)
        let urlString = EnvironmentUtility().getValueFromMainInfoDictionary(key: urlKey)
        if protocolString.isEmpty || urlString.isEmpty {
            return String()
        }
        return protocolString + "://" + urlString
    }

}
