import SwiftUI
import AVKit
import WebKit





let TRIbuttons = [
    SliderButton(
        title: "Жим вузьким хватом.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/d6OV-6sFDoQ?si=eom731RcfW5jtPEM"),
        previewImageName: "22",
        progressValues: [1, 0.8, 0.8, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .yellow, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Віджимання від лавки.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/99yC_HA2ahM?si=MaF8uLJENUYzawf2"),
        previewImageName: "23",
        progressValues: [1, 0.9, 0.9, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .orange, .orange, .yellow,]
    ),
    SliderButton(
        title: "Французкий жим.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/ko7UzkV_R5Q?si=2VyosRBYVWajjyl7"),
        previewImageName: "24",
        progressValues: [1, 1, 0.9, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
   
    SliderButton(
        title: "Тріцепс в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/GuCSlMZOptI?si=OdBYN_sACBBccdn4"),
        previewImageName: "27",
        progressValues: [1, 1, 0.8, 0],
        progressTexts:  [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Однією рукою в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/nlJLgk4NjIw?si=ijDZEeQrDKTaK28x"),
        previewImageName: "28",
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Розгинання руки над головою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/eP5QtmGFUg0?si=czD29uDkdQMT7ICx"),
        previewImageName: "29",
        progressValues: [1, 1, 0.8, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),SliderButton(
        title: "Розгинання рукм в нахилі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/doQXzXHW6E8?si=QyPcSUPM61TAH2R6"),
        previewImageName: "30",
        progressValues: [1, 1, 0.9, 0.8],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]
    ),
    SliderButton(
        title: "Розгинання за голови.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/onjo4edF6v0?si=yLWQMMtE24fTPb0E"),
        previewImageName: "25",
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]
    ),
    
    SliderButton(
        title: "Французький жим сидячі з низ. блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/dz1kJI5sE9k?si=Gy23ui4Lv0GUmjju"),
        previewImageName: "26",
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]  
    ),




]



struct Triceps: View {
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
                                ForEach(TRIbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: TRIbuttons[index])) {
                                        SliderButtonView(button: TRIbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
                }            }
        }
        .navigationBarBackButtonHidden(true)     }
}


struct TRYMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Triceps()
    }
}
