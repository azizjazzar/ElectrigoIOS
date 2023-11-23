//
//  JsonParsing.swift
//  Electrigo
//
//  Created by Aissa Dhia on 18/11/2023.
//

import Foundation
extension Data {
    func jsonparsing(letters:String) ->Data? {
        let dataString = String(data:self,encoding:.utf8)
        let parseData = dataString?.replacingOccurrences(of: letters, with: "")
        guard let data = parseData?.data(using: .utf8) else{
            return nil
        }
        return data
    }
}
