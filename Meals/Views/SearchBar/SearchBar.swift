import SwiftUI

struct SearchBar: View {
    // MARK: - STATE PROPERTIES
    
    @State var textField = ""
    
    // MARK: - MAIN BODY
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .padding(.horizontal, 16.0)
                .frame(height: 45.0)
                .foregroundColor(Color("search-color").opacity(0.12))
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 8.0)
                    .foregroundColor(Color("search-tint").opacity(0.6))
                TextField(text: $textField) {
                    Text("Search").foregroundColor(Color("search-tint").opacity(0.6))
                }
                .padding(.trailing, 28.0)
                Button(action: {
                    
                }, label: {
                    Image("filter")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .padding(.trailing, 8.0)
                        .foregroundColor(Color("search-tint").opacity(0.6))
                })
            }
            .padding(.horizontal, 16.0)
        }
    }
}

// MARK: - Preview
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
