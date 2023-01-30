import SwiftUI

struct TabBar: View {
    @State var chefSelected = true
    @Binding var selectedTab: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .frame(height: 80.0)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("tabbar-background"))
                .shadow(color: .gray, radius: 3.0, x: 0.0, y: 0.0)
            HStack() {
                Button(action: {
                    chefSelected = true
                    selectedTab = "1"
                }, label: {
                    HStack {
                        Image("chef")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 35.0, height: 35.0)
                        if chefSelected {
                            Text("Meals")
                                .fontWeight(.medium)
                        }
                    }
                        .padding()
                        .background(chefSelected ? Color.white : Color("tabbar-background"))
                        .clipShape(Capsule())
                        .padding(.leading, 30.0)
                        .foregroundColor(chefSelected ? Color("tabbar-active-item") : Color("tabbar-unactive-item"))
                })
                Spacer()
                Button(action: {
                    chefSelected = false
                    selectedTab = "2"
                }, label: {
                    HStack {
                        Image("love")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 35.0, height: 35.0)
                        if !chefSelected {
                            Text("Favorites")
                                .fontWeight(.medium)
                        }
                    }
                        .padding()
                        .background(!chefSelected ? Color.white : Color("tabbar-background"))
                        .clipShape(Capsule())
                        .padding(.trailing, 30.0)
                        .foregroundColor(!chefSelected ? Color("tabbar-active-item") : Color("tabbar-unactive-item"))
                })
            }
        }
        .offset(y: 20)
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
