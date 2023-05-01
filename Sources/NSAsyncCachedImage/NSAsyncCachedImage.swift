//
//  NSAsyncCachedImage.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/1/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import SwiftUI

public struct NSAsyncCachedImage<Placeholder>: View where Placeholder: View {

    private let placeHolder: Placeholder
    private let image: (Image) -> Image
    @ObservedObject private var network: NSAsyncNetwork

    public init(_ url: String,
                @ViewBuilder image: @escaping (Image) -> Image,
                @ViewBuilder placeHolder: @escaping () -> Placeholder) {
        self.placeHolder = placeHolder()
        self.network = NSAsyncNetwork(url: url)
        self.image = image
    }

    public init(_ url: String,
                cachePolicy: URLRequest.CachePolicy,
                timeout: TimeInterval,
                @ViewBuilder image: @escaping (Image) -> Image,
                @ViewBuilder placeHolder: @escaping () -> Placeholder) {
        self.placeHolder = placeHolder()
        self.network = NSAsyncNetwork(url: url, cachePolicy: cachePolicy, timeout: timeout)
        self.image = image
    }

    public var body: some View {
        content
    }
    
    private var content: some View {
        Group {
            if !network.data.isEmpty {
                #if os(macOS)
                image(Image(nsImage: NSImage(data: network.data) ?? NSImage()))
                #else
                image(Image(uiImage: UIImage(data: network.data) ?? UIImage()))
                #endif
            } else {
                placeHolder
            }
        }
    }
}
