import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: gridLayout,
                alignment: .center,
                spacing: columnSpacing,
                pinnedViews: []
            ) {
                Section(
                    header: SectionView(rotationClockwise: false),
                    footer: SectionView(rotationClockwise: true)
                ) {
                    ForEach(categories, id: \.id) { category in
                        CategoryItemView(category: category)
                    }
                }
            }
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
    }
}
