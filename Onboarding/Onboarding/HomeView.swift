import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack (spacing: 20) {
            Spacer()

            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                        value: isAnimating
                    )
            }

            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3.weight(.light))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)


                Text("Restart")
                    .font(.system(.title3, design: .rounded).weight(.bold))
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}