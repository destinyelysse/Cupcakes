//  ContentView.swift
//  Cupcakes
//
//  Created by Destiny Serna on 1/9/21.

import SwiftUI

struct ContentView: View {
    
    // Step 2: Create an instance of Order.
    @ObservedObject var order = Order()
       
    var body: some View {
        
        // Step 3: Create the order screen.
        NavigationView {
            Form {
                Section {
                    
                    // Creates a drop down for selecting cupcake type.
                    Picker("What flavor?", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    // Increase or decrease # of cupcakes
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("How many? \(order.quantity)")
                    }
                }
                
                // These options are revealed if special request toggle is on.
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()){
                        Text("Would you like to make any special requests?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles){
                            Text("Add sprinkles")
                        }
                    }
                }
                
                // Step 4: Create a button to complete delivery details in a new screen.
                Section {
                    NavigationLink(destination: AddressView(order: order)){
                        Text("Prepare for Delivery")
                    }
                }
            }
            .navigationBarTitle("Order Cupcakes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
