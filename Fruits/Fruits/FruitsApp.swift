import SwiftUI

@main
struct FruitsApp: App {
    @AppStorage("is_onboarding") var isOnboardingActive = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}
