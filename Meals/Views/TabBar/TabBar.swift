import SwiftUI

struct TabBar: View {
    @State var chefSelected = true
    @Binding var selectedTab: String
    
    var tabBarItems = ["Meals", "Favorites"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .frame(height: 80.0)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("tabbar-background"))
                .shadow(color: .gray, radius: 3.0, x: 0.0, y: 0.0)
            HStack() {
                ForEach(tabBarItems, id: \.self) { tab in
                    TabItem(tab: tab, selectedTab: $selectedTab)
                }
            }
        }
        .offset(y: 20)
    }
}

struct TabItem: View {
    @State var tab: String
    @Binding var selectedTab: String
    
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

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            TabBar(selectedTab: .constant("Meals"))
        }
    }
}
