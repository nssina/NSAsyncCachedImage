//
//  NSAsyncNetwork.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/6/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import Foundation

private protocol NSAsyncNetworkDelegate {
    func getImage(_ url: String, cachePolicy: URLRequest.CachePolicy, timeout: TimeInterval) async
}

final class NSAsyncNetwork: ObservableObject, NSAsyncNetworkDelegate {
    @Published var data = Data()

    private let cache = URLCache.shared
    private let session = URLSession.shared

    init(url: String, cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad, timeout: TimeInterval = 60) {
        Task { await getImage(url, cachePolicy: cachePolicy, timeout: timeout) }
    }

    final fileprivate func getImage(_ url: String, cachePolicy: URLRequest.CachePolicy, timeout: TimeInterval) async {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeout)

        if let data = cache.cachedResponse(for: request)?.data {
            DispatchQueue.main.async { self.data = data }
        } else {
            do {
                let (data, response) = try await session.data(for: request)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
                let cachedData = CachedURLResponse(response: response, data: data)
                cache.storeCachedResponse(cachedData, for: request)
                DispatchQueue.main.async { self.data = data }
            } catch {
                print("Error:", error.localizedDescription)
            }
        }
    }
}
