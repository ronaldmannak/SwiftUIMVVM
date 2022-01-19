//
//  Client.swift
//  SwiftUIMVVM
//
//  Created by Ronald Mannak on 1/18/22.
//

import Foundation
import SwiftUI

@MainActor
class Client: ObservableObject {
    
    @Published private (set) var remoteNumber: Int = 0
    
    @Published var localNumber: Int = 0
    
    @Published var delay: UInt64 = 1_000_000_000 // 1 second
    
    func randomRemoteNumber() async -> Int {
        let i = Int.random(in: 1..<10)
        setRemoteNumber(i: i)
        return i
    }
        
    func setRemoteNumber(i: Int) { //async {
        Task {
            try! await Task.sleep(nanoseconds: delay)
            remoteNumber = i
        }
    }
    
    func randomLocalNumber() {
        localNumber = Int.random(in: 1..<10)
    }
}
