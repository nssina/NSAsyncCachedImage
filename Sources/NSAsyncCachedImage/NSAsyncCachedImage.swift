//
//  NSAsyncCachedImage.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/1/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import SwiftUI

public struct NSAsyncCachedImage<Placeholder>: View where Placeholder: View {
    
    private var placeHolder: Placeholder
    @ObservedObject private var network: NSNetwork
    
    public init(_ url: String,
                @ViewBuilder placeHolder: @escaping () -> Placeholder) {
        self.placeHolder = placeHolder()
        self.network = NSNetwork(url: url)
    }
    
    public var body: some View {
        Group {
            if let data = network.data {
                #if os(macOS)
                Image(nsImage: NSImage(data: data)!)
                #else
                Image(uiImage: UIImage(data: data)!)
                #endif
            } else {
                placeHolder
            }
        }
    }
}
