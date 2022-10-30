//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by AB020QU on 2022/10/12.
//

internal class FeedItemsMapper {
    
    private struct Root: Decodable {
        
        let items: [Item]
        
        var feed: [FeedItem] {
            return items.map { $0.feedItem }
        }
    }

    private struct Item: Decodable {
        
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var feedItem: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.ResultType {
        guard response.statusCode == 200, let items = try? JSONDecoder().decode(Root.self, from: data)  else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        return .success(items.feed)
    }
}

