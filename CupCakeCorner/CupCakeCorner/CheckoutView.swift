//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Ancel Dev account on 14/11/23.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var NoInternetConnection = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    print("Placing order")
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you", isPresented: $showingConfirmation, actions: {
            Button("Ok") {}
        }, message: {
            Text(confirmationMessage)
        })
        .alert("No internet connection", isPresented: $NoInternetConnection) {
            Button("Try later") {}
        } message: {
            Text("You don't have internet connection at the moment.")
        }

    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Fail to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoderOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "You order for \(decoderOrder.quantity)x\(Order.types[decoderOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        }
        catch {
            NoInternetConnection = true
            print("Check out failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
