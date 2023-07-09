import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    @AppStorage("is_onboarding") var isOnboardingActive: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    GroupBox(label: SettingsLabelView(
                        labelText: "Fruits",
                        labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 5)

                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)

                            Text("Most Fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamines and much more.")
                                .font(.footnote)
                        }
                    }

                    GroupBox(label: SettingsLabelView(
                        labelText: "Application",
                        labelImage: "apps.iphone")
                    ) {
                        SettingsRowView(name: "Developer", content: "Luis Filipe Alves de Olviveira")
                        SettingsRowView(name: "Compativility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "lfoliveira.technology", linkDestination: "lfoliveira.technology")
                        SettingsRowView(name: "twitter", content: "twitter.com/lfoliveir4")
                    }

                    Toggle(isOn: $isOnboardingActive) {
                        Text("Restart")
                    }
                    .padding()
                }
                .navigationTitle("Settings")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                        })
                    }
                })
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
