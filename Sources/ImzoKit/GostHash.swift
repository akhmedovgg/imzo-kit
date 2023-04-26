//
//  GostHash.swift
//  Smart Business iOS
//
//  Created by Sherzod Akhmedov on 19/04/23.
//

import Foundation

public final class GostHash {
    
    private weak var imzoEngine: ImzoKit?
    
    init(imzoEngine: ImzoKit) {
        self.imzoEngine = imzoEngine
    }
    
    public func hashGost(text: String) -> String? {
        return imzoEngine?
            .jsContext
            .evaluateScript("(new GostHash()).gosthash('\(text)').toUpperCase()")
            .toString()
    }

    public func gosthashHex(text: String) -> String? {
        return imzoEngine?
            .jsContext
            .evaluateScript("(new GostHash()).gosthashHex('\(text)').toUpperCase()")
            .toString()
    }
}
