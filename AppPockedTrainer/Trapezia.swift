import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Tbuttons = [
    SliderButton(
        title: "Шраги з гантелями стоячі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Cz3BIJ71m6U?si=qghbg5KZ1se5nzCh"),
        previewImageName: "94",
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Трапеціподібна.", "  Ромбодібна.", "  Шия.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]
    ),

    SliderButton(
        title: "Шраги зі штангою перед собою.",
        description: "2",
        videoURL: URL(string: "https://www.youtube.com/embed/MPDdhA4sqcY?si=NqZXMgEsm4u_qnVv"),
        previewImageName: "1",
        progressValues: [1, 1, 0.7, 0.6],
        progressTexts: [" Верх Трапецібодібноі.", "  Середина Трапецібодібноі.","  Шия.", "  Ромбоподібна."]
        ,progressColors: [.red, .red, .orange, .yellow,]
    ),
    SliderButton(
        title: "Шраги зі штангою за спиною.",
        description: "Описание кнопки 3",
        videoURL: URL(string: "https://www.youtube.com/embed/03I3dap_LMg?si=eyzNRimjsVWFezVo"),
        previewImageName: "2",
        progressValues: [1, 0.7, 0.7, 0],
        progressTexts: [" Верх трапеціподібноі.",  "  Ромбоподібна.", "  Шия.", ""],
        progressColors: [.red, .orange, .orange, .yellow]
    ),
    SliderButton(
        title: "Тяга штанги до підборіддя.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://youtube.com/embed/7cEfqmysJfU?feature=share"),
        previewImageName: "3",
        progressValues: [1, 1, 0.8, 0.4],
        progressTexts: ["  Трапеціподібна.", "  Середня дельта.", "  Передня дельта.",  "  Біцепс."]
        ,progressColors: [.red, .red, .orange, .yellow,]
    ),

]



struct Trapezia: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedIndex = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(Tbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Tbuttons[index])) {
                                        SliderButtonView(button: Tbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                                .background(colorScheme == .dark ? .white.opacity(0.8) : .black.opacity(0.2))
                                .cornerRadius(8)
                            }
                            .padding()
                        }
                        
                        .padding(.top, -90)
                        
                    }
                }
                VStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(colorScheme == .dark ? .white : .black)                            .padding(.vertical, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.2))
                }
            }
        }
        .navigationBarBackButtonHidden(true) 
    }
}


struct TMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Trapezia()
    }
}
