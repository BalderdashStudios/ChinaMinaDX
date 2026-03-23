import SwiftUI

struct Victims: View {
    let data = JSONLoader.load()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.keys.sorted(), id: \.self) { sheet in
                    Section(header: Text(sheet)) {
                        ForEach(data[sheet] ?? [], id: \.self) { row in
                            
                            VStack(alignment: .leading) {
                                ForEach(row.keys.sorted(), id: \.self) { key in
                                    Text("\(key): \(row[key] ?? "")")
                                        .font(.caption)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Database")
        }
    }
}
#Preview{
    Victims()
}
