//
//  Environment.swift
//  Reward
//
//  Created by Keval Vadoliya on 04/04/21.
//

import Foundation

public struct Config {
    static let baseUrl = "base_url"
    static let connectionProtocol = "protocol"
}

public struct Environment {

    public func configuration() -> String {
        return EnvironmentUtility().getUrlFromMainInfoDictionary(protocolKey: Config.connectionProtocol, urlKey: Config.baseUrl)
    }

}
