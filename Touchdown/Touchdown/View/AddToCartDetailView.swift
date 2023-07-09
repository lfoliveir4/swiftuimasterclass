import SwiftUI

struct AddToCartDetailView: View {
    @EnvironmentObject var shop: Shop

    var red: Double {
        shop.selectedProduct?.color[0] ?? sampleProduct.color[0]
    }

    var blue: Double {
        shop.selectedProduct?.color[1] ?? sampleProduct.color[1]
    }

    var green: Double {
        shop.selectedProduct?.color[2] ?? sampleProduct.color[2]
    }

    var body: some View {
        Button(action: {
            feedback.impactOccurred()
        }, label: {
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded).weight(.bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
        })
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(Color(red: red, green: green, blue: blue))
        .clipShape(Capsule())
    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
    }
}
