import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop: Shop

    var description: String {
        shop.selectedProduct?.description ?? sampleProduct.description
    }

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
        VStack(alignment: .leading, spacing: 5) {
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

            VStack(alignment: .leading, spacing: 6) {
                Text("protective Gear")

                Text(shop.selectedProduct?.name ?? sampleProduct.name)
                    .font(.largeTitle.weight(.black))
            }
            .foregroundColor(.white)
            .padding(.horizontal)


            TopPartDetailView()
                .padding()
                .zIndex(1)

            VStack(alignment: .center, spacing: 0) {
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)

                ScrollView {
                    Text(description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }

                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)

                AddToCartDetailView()
                    .padding(.bottom, 20)

            }
            .padding(.horizontal)
            .background(Color.white.clipShape(CustomShape()).padding(.top, -105))
            Spacer()
        }
        .zIndex(0)
        .ignoresSafeArea(.all)
        .background(
            Color(red: red, green: blue, blue: green)
                .ignoresSafeArea(.all)
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
    }
}
