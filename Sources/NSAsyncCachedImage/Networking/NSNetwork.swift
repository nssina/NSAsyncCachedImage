//
//  NSNetwork.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/1/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import Foundation

final class NSNetwork: ObservableObject, NSNetworkDelegate {
    @Published var data = Data()
    
    init(url: String) {
        Task {
            do {
                try await getImage(url)
            } catch {
                print("Error", error)
            }
        }
    }
    
    @discardableResult
    final func getImage(_ url: String) async throws -> Data? {
        guard let url = URL(string: url) else { return nil }
        let cache = URLCache.shared
        let request = URLRequest(url: url,
                                 cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad,
                                 timeoutInterval: 60.0)
        
        if let data = cache.cachedResponse(for: request)?.data {
            return data
        } else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
            let cachedData = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedData, for: request)
            return data
        }
    }
}
