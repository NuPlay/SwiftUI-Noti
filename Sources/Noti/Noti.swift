import SwiftUI

public struct Noti : View {
    @Binding var show : Bool
    
    @State var title : String
    @State var subTitle : String = ""
    @State var description : String
    
    @State var icon : AnyView?
    @State var preview : AnyView?
    
    
    public init(show: Binding<Bool>, title: String, subTitle: String = "", description: String, icon: AnyView, preview: AnyView) {
        self._show = show
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.icon = icon
        self.preview = preview
    }
    
    public var body: some View{
        VStack{
            VStack{
                VStack(alignment:.leading, spacing: 0){
                    HStack(spacing: 0){
                        icon
                            .frame(width:24 , height:24 , alignment: .center)
                            .cornerRadius(6)
                            .padding(.trailing ,8)
                        
                        Text(title)
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("now")
                            .font(.footnote)
                    }
                    .padding(.bottom, 12)
                    
                    HStack{
                        VStack(alignment:.leading, spacing: 0){
                            Text(subTitle)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                            
                            Text(description)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                        
                        preview
                            .cornerRadius(8)
                            .frame(width:44 , height:44 , alignment: .center)
                        
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(
                    BlurEffect(.systemThinMaterial, cornerRadius: 12)
                )
                .padding(.horizontal, 8)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    show = false
                                }
                            }))
                Spacer()
            }
            .offset(y : show == true ? UIScreen.main.bounds.width * 2 < UIScreen.main.bounds.height ? 0 : 16 : -300)
            .animation(.spring())
            
            Spacer()
        }
    }
}
