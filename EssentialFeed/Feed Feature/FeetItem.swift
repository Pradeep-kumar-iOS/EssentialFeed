//
//  FeetItem.swift
//  EssentialFeed
//
//  Created by Pradeep Kumar on 2022/09/29.
//

public struct FeedItem: Equatable, Decodable {
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
