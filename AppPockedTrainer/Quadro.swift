import SwiftUI
import AVKit
import WebKit


let Quadrobuttons = [
    SliderButton(
        title: "Присідання.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/OKh6bbwDo7M?si=NsiUS1iWA9Fa5qfw"),
        previewImageName: "62",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""),
        previewImageName: "63",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Фронтальні присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/siBvG_gKhfU?si=2ilP72GxKVfxcHNm"),
        previewImageName: "64",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]      ),
    SliderButton(
        title: "Гак-присідання.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""),
        previewImageName: "65",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Виподи зі штангою.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/PiVE_Ulh_F0?si=1FSokkVbEEhxk34p"),
        previewImageName: "67",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Підйом на платформу.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""),
        previewImageName: "68",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Розгинання ніг сидячі.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/VBrRYOI-jfM?si=xtZ6LS8i0ujVIRFz"),
        previewImageName: "69",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Стегна квадрицепс: Широка медіальна.", "  Стегна квадрицепс: Широка латеральна.", "  Стегна квадрицепс: Прямий м'яз стегна.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    
    SliderButton(
        title: "Ривок штанги на груди.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""),
        previewImageName: "70",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Плечі.", "  Сідниці.", "  Стегна квадрицепс.",  "  Стегна біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    

]

struct Quadro: View {
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
                                ForEach(Quadrobuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Quadrobuttons[index])) {
                                        SliderButtonView(button: Quadrobuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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


struct QuadroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Quadro()
    }
}
