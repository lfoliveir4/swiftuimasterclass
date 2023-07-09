import SwiftUI

struct FruitsNutrientView: View {
    let fruit: Fruit
    let nutrients: [String] = [
        "Energy",
        "Sugar",
        "Fat",
        "Protein",
        "Vitamins",
        "Minerals"
    ]

    var body: some View {

        GroupBox {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { nutrient in
                    Divider().padding(.vertical, 5)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[nutrient])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body))

                        Spacer(minLength: 25)

                        Text(fruit.nutrition[nutrient])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

struct FruitsNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsNutrientView(fruit: fruitsData[1])
            .preferredColorScheme(.dark)
    }
}
