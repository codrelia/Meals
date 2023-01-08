import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.system(size: 20.0, weight: .semibold, design: .default))
                .padding(.top, 8.0)
                .padding(.leading, 16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 40.0) {
                    ForEach(0..<14) { i in
                        VStack {
                            Image(arrayOfCategories[i].rawValue.lowercased())
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                            
                            Text(arrayOfCategories[i].rawValue)
                                .font(.system(size: 14.0, weight: .medium))
                        }
                        .padding(.trailing, i == 13 ? 16.0 : 0.0)
                    }
                }
                .padding(.leading, 16.0)
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
