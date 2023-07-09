import SwiftUI

struct ProductItemView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(
                Color(
                    red: product.color[0],
                    green: product.color[1],
                    blue: product.color[2]
                )
            )
            .cornerRadius(12)

            Text(product.name)
                .font(.title3.weight(.black))

            Text("$\(product.price)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
    }
}
