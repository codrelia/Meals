import SwiftUI

// MARK: - View for connection error displays
struct ErrorView: View {
    // MARK: - MAIN BODY
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(height: 80.0)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(.all, 4.0)
                .background(Color("error-color").clipShape(RoundedRectangle(cornerRadius: 10.0)))
            HStack {
                Image(systemName: "xmark")
                    .foregroundColor(Color("error-color"))
                    .font(.system(size: 40.0))
                    .fontWeight(.medium)
                    .padding(.leading, 32.0)
                Spacer()
                VStack(alignment: .leading) {
                    Text("ERROR!")
                        .foregroundColor(Color("error-color"))
                        .font(.system(size: 16.0))
                        .fontWeight(.medium)
                    Text("Internet connection error! Please try again.")
                        .fontWeight(.light)
                        .font(.system(size: 12.0))
                        .foregroundColor(.secondary)
                        .padding(.trailing, 32.0)
                }
            }
        }
        .padding(.horizontal, 8.0)
        
    }
}

// MARK: - PREVIEW

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
