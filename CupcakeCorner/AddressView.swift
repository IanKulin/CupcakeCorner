//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ian Bailey on 26/10/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var wrapped: Wrapper

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $wrapped.order.name)
                TextField("Street Address", text: $wrapped.order.streetAddress)
                TextField("City", text: $wrapped.order.city)
                TextField("Zip", text: $wrapped.order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(wrapped: wrapped)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(wrapped.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(wrapped: Wrapper())
    }
}
