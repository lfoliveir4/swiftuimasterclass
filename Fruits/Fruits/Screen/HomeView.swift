import SwiftUI

struct HomeView: View {
    let fruits: [Fruit] = fruitsData

    @State private var searchFruit: String = ""
    @State private var isSearching: Bool = false
    @State private var isShowSettings: Bool = false

    var body: some View {
        NavigationStack {
            List(filteredItems.shuffled(), id: \.id) { fruit in
                NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                        .padding(.vertical, 4)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Fruits")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowSettings = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                    .sheet(isPresented: $isShowSettings) {
                        SettingsView()
                    }
                }
            })
            .searchable(text: $searchFruit)
        }
    }

    private var filteredItems: [Fruit] {
        if searchFruit.isEmpty {
            return fruits
        } else {
            return fruits.filter { fruit in
                fruit.title.localizedStandardContains(searchFruit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
