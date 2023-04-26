//
//  GostHash.swift
//  Smart Business iOS
//
//  Created by Sherzod Akhmedov on 19/04/23.
//

import Foundation

public final class CRC32 {
    
    private weak var imzoEngine: ImzoKit?
    
    init(imzoEngine: ImzoKit) {
        self.imzoEngine = imzoEngine
    }
    
    public func calc(text: String) -> String? {
        return imzoEngine?
            .jsContext
            .evaluateScript("(new CRC32()).calc('\(text)').toUpperCase()")
            .toString()
    }

    public func calcHex(text: String) -> String? {
        return imzoEngine?
            .jsContext
            .evaluateScript("(new CRC32()).calcHex('\(text)').toUpperCase()")
            .toString()
    }
}
