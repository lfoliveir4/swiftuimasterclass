import SwiftUI

struct OnboardingView: View {

    var fruits: [Fruit] = fruitsData


    var body: some View {
        TabView {
            ForEach(fruits[0...3]) { fruit in
                FruitCardView(fruit: fruit)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
