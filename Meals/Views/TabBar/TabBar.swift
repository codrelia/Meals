import SwiftUI

struct TabBar: View {
    @State var chefSelected = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .frame(height: 80.0)
                .foregroundColor(Color("tabbar-background"))
            HStack() {
                Button(action: {
                    chefSelected = true
                }, label: {
                    Image("chef")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                        .padding(.leading, 60.0)
                        .foregroundColor(chefSelected ? Color("tabbar-active-item") : Color("tabbar-unactive-item"))
                })
                Spacer()
                Button(action: {
                    chefSelected = false
                }, label: {
                    Image("love")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                        .padding(.trailing, 60.0)
                        .foregroundColor(!chefSelected ? Color("tabbar-active-item") : Color("tabbar-unactive-item"))
                })
            }
        }
        .padding([.horizontal], 10)
        .padding(.bottom, 8)
        .background(Color.clear)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            TabBar()
        }
    }
}
