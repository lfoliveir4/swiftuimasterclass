import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal

    var animalLink: URL {
        URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!
    }
    
    var body: some View {

        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipédia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")

                    Link(animal.name, destination: animalLink)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
    }
}
