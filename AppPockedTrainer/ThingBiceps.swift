import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Thingbuttons = [
    SliderButton(
        title: "Станова тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/gYI-ItE8al0?si=9ECOFKux_nUWLkax"),
        previewImageName: "60",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Стегна біцепс.",  "Спина."]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Гуд морнінг.",
        description: "Опис кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "61",
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Спина.", "  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    
    SliderButton(
        title: "Мертва тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/o26GO32SS8A?si=EBc7K1x9W-uOGgP7"),
        previewImageName: "71",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  "Трапеція, Ромбоподібна"]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Румунська тяга.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Sg-1ks5XMYI?si=cYcAlyWUjBJZYYid"),
        previewImageName: "72",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Гіперестензія.",
        description: "Опис кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "73",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Спина .", "  Сідниці.", "  Стегна біцепс.",  "  Спина, Гомілка"]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Згинання ніг лежачі.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/ivlMVQGVkg0?si=VrMfdotNnGJ-oojv"),
        previewImageName: "74",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Стегна біцепс: Двоголовий м'яз стегна.", "  Стегна біцепс : Напівсухожильна.", "  Стегна біцепс : Напівперетинчаста.",  "Гомілка: Ікроніжна."]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
   





]



struct ThingBiceps: View {
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
                                ForEach(Thingbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Thingbuttons[index])) {
                                        SliderButtonView(button: Thingbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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


struct ThingBicepsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThingBiceps()
    }
}
