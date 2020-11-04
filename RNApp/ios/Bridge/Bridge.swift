//
//  Bridge.swift
//  RNApp
//
//  Created by Antoine Eddi on 11/4/20.
//

import Foundation
import Cgo

@objc(Bridge)
class Bridge: NSObject {
  @objc func test(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
    let result = CgoTest("All your base are belong to us")
    resolve(result)
  }
}
