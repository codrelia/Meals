import SwiftUI

// MARK: - The basis of TabBar
struct TabBar: View {
    // MARK: - STATE PROPERTIES
    
    @State var chefSelected = true
    
    // MARK: - BINDING PROPERTIES
    
    @Binding var selectedTab: String
    
    // MARK: - PROPERTIES
    
    var tabBarItems = ["Meals", "Favorites"]
    
    // MARK: - MAIN BODY
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .frame(height: 80.0)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("tabbar-background"))
                .shadow(color: .gray, radius: 3.0, x: 0.0, y: 0.0)
            HStack() {
                ForEach(tabBarItems, id: \.self) { tab in
                    Spacer()
                    TabItem(tab: tab, selectedTab: $selectedTab)
                    Spacer()
                }
            }
        }
        .offset(y: 20)
    }
}

// MARK: - Items on the TabBar
struct TabItem: View {
    // MARK: - STATE PROPERTIES
    
    @State var tab: String
    
    // MARK: - BINDING PROPERTIES
    @Binding var selectedTab: String
    
    // MARK: - MAIN BODY
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.spring()) {
                    selectedTab = tab
                }
            } label: {
                HStack {
                    Image(tab)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                    if selectedTab == tab {
                        Text(tab)
                            .fontWeight(.medium)
                    }
                }
                    .padding()
                    .background(selectedTab == tab ? Color.white : Color("tabbar-background"))
                    .clipShape(Capsule())
                    .padding(.trailing, 30.0)
                    .foregroundColor(selectedTab == tab ? Color("tabbar-active-item") : Color("tabbar-unactive-item"))
            }
            
        }
    }
}

// MARK: - PREVIEW

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            TabBar(selectedTab: .constant("Meals"))
        }
    }
}
