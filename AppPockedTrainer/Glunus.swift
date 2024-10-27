import SwiftUI
import AVKit
import WebKit






let Glutusbuttons = [
    SliderButton(
        title: "Жим ногам.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "66",
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Сідниці", "  Бедра квадрицепс.", "  Бедра бицепс .",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Руминська тяга.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Sg-1ks5XMYI?si=Zx06syMUIdJO5ctI"),
        previewImageName: "72",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  Спина.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  
    ),
    SliderButton(
        title: "Станова тяга.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/gYI-ItE8al0?si=I8aETwN0hNJnqKTs"),
        previewImageName: "60",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Бедра квадрицепс.", "   Стегна біцепс.",  "Спина"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Гіперестензія.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "73",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  Спина: Розгинач хребта.",  "Гомілка: Ікроніжна."]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Випади із гантелями.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Uga41iTHXzc?si=bzjeHGNDoky-_vQK"),
        previewImageName: "85",
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Стегна біцепс.",  "  Спина: Розгинач хребта"]
        ,progressColors: [.red, .red, .yellow, .green,]
    ),
    
    SliderButton(
        title: "Присідання.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/OKh6bbwDo7M?si=NsiUS1iWA9Fa5qfw"),
        previewImageName: "62",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці : Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Спина: Розгинач хребта.",  "  Стегна біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Сіндничний місток.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/0Cm8dOLjQs4?si=Baw5J5bVDTesUfc8"),
        previewImageName: "199",
        progressValues: [1, 1, 1, 0.7],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  М'язи кору.",  "  Стегна квадрицепс."]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),




]



struct Glutus: View {
    @Environment(\.colorScheme) var colorScheme

    @Environment(\.presentationMode) var presentationMode

    @State private var selectedIndex = 0
    
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
                                ForEach(Glutusbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Glutusbuttons[index])) {
                                        SliderButtonView(button: Glutusbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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


struct GlutusDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Glutus()
    }
}




