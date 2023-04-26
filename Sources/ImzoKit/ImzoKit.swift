//
//  ImzoKit.swift
//  Smart Business iOS
//
//  Created by Sherzod Akhmedov on 19/04/23.
//

import Foundation
import JavaScriptCore

public final class ImzoKit {
    
    private(set) var jsContext: JSContext
    
    public private(set) lazy var gostHash: GostHash = {
        return GostHash(imzoEngine: self)
    }()
    
    public private(set) lazy var crc32: CRC32 = {
        return CRC32(imzoEngine: self)
    }()
    
    private let scheme = "eimzo"
    
    public var eImzoAppStoreURL: URL {
        return URL(string: "http://itunes.apple.com/app/id1563416406")!
    }
    
    public init() {
        guard let sourcePath = Bundle.module.path(forResource: "e-imzo", ofType: "js"),
              let jsSource = try? String(contentsOfFile: sourcePath) else {
            fatalError("could not load JS library 'e-imzo.js'")
        }
        
        jsContext = .init()
        jsContext.evaluateScript(jsSource)
    }
    
    public func makeSignURL(siteId: String, documentId: String, docHash: String) -> URL? {
        var code = siteId + documentId + docHash
        let crc32 = crc32.calcHex(text: code)!
        code += crc32
        return URL(string: "\(scheme)://sign?qc=\(code)")
    }
}
