import SwiftUI

struct StartButtonView: View {
    @AppStorage("is_onboarding") var isOnboardingActive: Bool?

    var body: some View {
        Button(action: {
            isOnboardingActive = false
        }, label: {
            HStack (spacing: 8) {
                Text("Start")

                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        })
        .accentColor(.white)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
    }
}
