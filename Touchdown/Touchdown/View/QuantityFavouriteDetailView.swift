import SwiftUI

struct QuantityFavouriteDetailView: View {
    @State private var counter: Int = 0

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: { removeItem() }, label: {
                Image(systemName: "minus.circle")
            })

            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)

            Button(action: { addItem() }, label: {
                Image(systemName: "plus.circle")
            })

            Spacer()

            Button(action: {}, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            })
        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }

    private func removeItem() {
        if counter > 0 {
            feedback.impactOccurred()
            counter -= 1
        }
    }

    private func addItem() {
        if counter < 100 {
            feedback.impactOccurred()
            counter += 1
        }
    }
}

struct QuantityFavouriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavouriteDetailView()
    }
}
