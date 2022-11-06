//
//  ContentView.swift
//  NSAsyncCachedImageDemo
//
//  Created by Sina Rabiei on 11/6/22.
//

import SwiftUI
import NSAsyncCachedImage

struct ContentView: View {
    var body: some View {
        VStack {
            NSAsyncCachedImage("https://example.com/icon.png") { image in
                image
                    .resizable()
            } placeHolder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .cornerRadius(12)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
