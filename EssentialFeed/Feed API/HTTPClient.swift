//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by AB020QU on 2022/10/12.
//

public enum HTTPClientResult {
    
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
