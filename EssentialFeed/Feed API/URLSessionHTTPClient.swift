//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by AB020QU on 2022/10/30.
//

public class URLSessionHTTPClient: HTTPClient {
    
    private var session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    private struct UnexpectedResultsRepresentation: Error { }
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            }else {
                completion(.failure(UnexpectedResultsRepresentation()))
            }
        }.resume()
    }
}
