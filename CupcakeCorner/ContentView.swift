//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ian Bailey on 26/10/2022.
//

import SwiftUI


struct ContentView: View {
    @StateObject var wrapped = Wrapper()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $wrapped.order.type) {
                        ForEach(Order.types.indices, id: \.self) { index in
                            Text(Order.types[index])
                        }
                    }

                    Stepper("Number of cakes: \(wrapped.order.quantity)", value: $wrapped.order.quantity, in: 3...20)
                }

                Section {
                    Toggle("Any special requests?", isOn: $wrapped.order.specialRequestEnabled.animation())

                    if wrapped.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $wrapped.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $wrapped.order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(wrapped: wrapped)
                    } label: {
                        Text("Delivery details")
                    }
                }

            }
            .navigationTitle("Cupcake Corner")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
