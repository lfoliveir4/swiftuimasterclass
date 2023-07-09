import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players, id: \.id) { player in
                Image(player.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
    }
}
