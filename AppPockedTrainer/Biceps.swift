
import SwiftUI
import AVKit
import WebKit


// Пример данных для кнопок слайдера
let Bibuttons = [
    SliderButton(
        title: "Підйом штанги.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/jOMFGhJCOsA?si=INU-X2BB0mtcQMT1"),
        previewImageName: "13",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Молотки.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""),
        previewImageName: "14",
        progressValues: [1, 1, 0.9, 0.9],
        progressTexts: ["Передплічча.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.", "  Біцепс: Плечева."],
        progressColors: [.red, .red, .orange, .orange]
    ),
    SliderButton(
        title: "Підйом гантель сидячі.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""),
        previewImageName: "21",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .yellow,]
    ),

    SliderButton(
        title: "Біцепс з нижнього блоку.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""),
        previewImageName: "16",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange]
    ),
    SliderButton(
        title: "Біцепс у кроссовері.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://www.youtube.com/embed/4NHqYPlIp1A?si=3UanEljZYFpRodlT"),
        previewImageName: "17",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."]
        ,progressColors: [.red, .red, .red, .orange,]
    ),
    SliderButton(
        title: "Підйом з упором в коліно.",
        description: "Описание кнопки 3",
        videoURL: URL(string: "https://www.youtube.com/embed/OGze5hZjXMk?si=nYTo9VFiI2RVJQ1Y"),
        previewImageName: "18",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]
    ),
    SliderButton(
        title: "Підйом з супінаціею.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://www.youtube.com/embed/r4Y5BRMaayE?si=zxJ-Z_sjYkb88Psf"),
        previewImageName: "89",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]
    ),
   
    SliderButton(
        title: "Біцепс зі штангою на лавці скотта.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""),
        previewImageName: "95",
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]
    ),
    SliderButton(
        title: "Підйом гантель супінація.",
        description: "2",
        videoURL: URL(string: ""),
        previewImageName: "20",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]
    ),
    
    SliderButton(
        title: "Підйом зворотнім хватом.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://www.youtube.com/embed/0ju_qBeuG3k?si=rJ0GvoYvTTPTyhoj"),
        previewImageName: "N19",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передплічча.", "  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  ],
        progressColors: [.red, .red, .red, .yellow,]  
    ),
    



]



struct Biceps: View {
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
                                ForEach(Bibuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Bibuttons[index])) {
                                        SliderButtonView(button: Bibuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct BiMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Biceps()
    }
}
