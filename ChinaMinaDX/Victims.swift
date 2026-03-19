import SwiftUI

struct Victims: View {
    @State private var searchText = ""
    
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry",
                  "Fig", "Grape", "Honeydew", "Kiwi", "Lemon"]
    
    var filteredFruits: [String] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        NavigationStack {
            List(filteredFruits, id: \.self) { fruit in
                Text(fruit)
            }
            .searchable(text: $searchText, prompt: "Search fruits...")
            .navigationTitle("Fruits")
        }
    }
}
#Preview{
    Victims()
}
