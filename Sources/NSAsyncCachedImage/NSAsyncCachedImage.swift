//
//  NSAsyncCachedImage.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/1/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import SwiftUI

public struct NSAsyncCachedImage<Content, Placeholder: View> : View where Content : View {
    var placeHolder: Placeholder
    @ObservedObject var network: NSNetwork
    
    public init(_ url: String,
                @ViewBuilder placeHolder: () -> Placeholder) {
        self.placeHolder = placeHolder()
        self.network = NSNetwork(url: url)
    }
    
    public var body: some View {
        Group {
            if let data = network.data {
                Image(uiImage: UIImage(data: data)!)
            } else {
                placeHolder
            }
        }
    }
}
