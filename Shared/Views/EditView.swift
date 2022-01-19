//
//  EditView.swift
//  SwiftUIMVVM
//
//  Created by Ronald Mannak on 1/18/22.
//

import SwiftUI

struct EditView: View {
    
    @EnvironmentObject var client: Client
    
    var body: some View {
        Form {
            
            Section(header: Text("Remote number")) {
                
                Text("Remote number is \(client.remoteNumber)")
                
                HStack {
                    Text("Adjust remote number:")
                    TextField("", value: Binding(
                        get: { client.remoteNumber },
                        set: { client.setRemoteNumber(i: $0) })
                        , formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                }
                
                HStack {
                    Text("Delay:")
                    TextField("", value: Binding(
                        get: { Int(client.delay / UInt64(1_000_000_000)) },
                        set: { client.delay = UInt64($0) * UInt64(1_000_000_000) }),
                              formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    Text("seconds")
                }
                
                Button("Random number") {
                    Task {
                        await client.randomRemoteNumber()
                    }
                }
            }
            
            Section(header: Text("Local number")) {
                
                Text("Local number is \(client.localNumber)")
                
                HStack {
                    Text("Adjust local number:")
                    TextField("", value: $client.localNumber,
                              formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                }
                
                Button("Random number") {
                    Task {
                        client.randomLocalNumber()
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
