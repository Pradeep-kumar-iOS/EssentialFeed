//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by AB020QU on 2022/09/29.
//

public enum FeedItemResult {
    
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    
    func load(completion: @escaping (FeedItemResult) -> Void)
}
