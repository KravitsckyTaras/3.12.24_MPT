import SwiftUI
import AVKit
import WebKit


let Corebuttons = [
    
    SliderButton(
        title: "Скручування на римському стільці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/HMXGXV2Yt78?si=DbM4RqFjO_y-j9ZT"),
        previewImageName: "44",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Підйом колін висячи.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/FtiAWLYl2f0?si=5YXAJwzgZU-DDinc"),
        previewImageName: "48",
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямий м'яз стегна.",  "  Стегна квадрицепс : Гребінчаста."]
        ,progressColors: [.red, .red, .orange, .green,]
    ),
    SliderButton(
        title: "Зворотні скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/_4UYva94jVA?si=FR7jRMCMT_J0JDoK"),
        previewImageName: "47",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Скручування на колінах у блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "46",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),

    SliderButton(
        title: "Підйом ніг у висі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "49",
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямий м'яз стегна.",  "  Стегна квадрицепс : Гребінчаста."]
        ,progressColors: [.red, .red, .orange, .green,]
    ),
    SliderButton(
        title: "Косі скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "50",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Скручування на лаві з нахилом вниз.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "45",
        progressValues: [1, 1, 0.3, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  Прямая мышца бедра.",  ""]
        ,progressColors: [.red, .red, .green, .yellow,]
    ),
    SliderButton(
        title: "Скручування.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "43",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Зовнішня коса.", "  Прямая мышца живота.", "  .",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),




]



struct Core: View {
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
                                ForEach(Corebuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Corebuttons[index])) {
                                        SliderButtonView(button: Corebuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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


struct FMuscleCore_Previews: PreviewProvider {
    static var previews: some View {
        Core()
    }
}
