//
//  NSNetworkDelegate.swift
//  NSAsyncCachedImage
//
//  Created by Sina Rabiei on 11/1/22.
//  Copyright © 2022 Sina Rabiei. All rights reserved.

import Foundation

protocol NSNetworkDelegate {
    func getImage(_ url: String) async throws -> Data?
}
