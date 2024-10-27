import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let SHbuttons = [
    SliderButton(
        title: "Протяжка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://youtube.com/embed/7cEfqmysJfU?feature=share"),
        previewImageName: "3",
        progressValues: [1, 1, 0.8, 0.30],
        progressTexts: ["  Трапеціподібна.", "  Середня дельта.", "  Передя дельта.",  "  М'язи синергісти"]
        ,progressColors: [.red, .red, .yellow, .green,]
    ),
    SliderButton(
        title: "Жим штанги з за голови.",
        description: "",
        videoURL: URL(string: "https://www.youtube.com/embed/H2cQTrU9fYI?si=ZXXxBFarttTfPTzy"),
        previewImageName: "4",
        progressValues: [1, 0.9, 0.80, 0.80],
        progressTexts: ["  Середня дельта", "  Передня дельта", "  Трапеціподібна",  " Тріцепс"]
        ,progressColors: [.red, .orange, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Жим штанги сидячі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://youtube.com/embed/obAEwJce_Cg?feature=share"),
        previewImageName: "5",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Задня дельта",  " Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Жим гантель сидячі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Pwb-b_nGvcE?si=490Q3lWZj0DofmEi"),
        previewImageName: "6",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Задня дельта",  " Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Жим Арнольда",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Tz6Xsv-16LA?si=L6LcRCZzV7GD_Qr7"),
        previewImageName: "7",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  "  Трицепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]
    ),
    SliderButton(
        title: "Відведення гантель через боки.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/H-2w-Jp21Dw?si=d6eFTexwe2PJJv-H"),
        previewImageName: "8",
        progressValues: [1, 0.9, 0.8, 0.3],
        progressTexts: ["  Середня дельта", "  Передня Дельта", "  трапеціподібна",  " Задня дельта"]
        ,progressColors: [.red, .orange, .yellow, .green,]
    ),
    
    SliderButton(
        title: "Підйом гантель перд собою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/PHP6KnhdUxE?si=GaUeruqqqYFKN95m"),
        previewImageName: "9",
        progressValues: [1, 0.9, 0.8, 0.3],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  " м'язи стабілізатори"]
        ,progressColors: [.red, .orange, .yellow, .yellow,]
    ),
    
    SliderButton(
        title: "Відведденя гантель у нахилі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/RTIKTjzrGjk?si=1B7jKRBA2CZ0TPFO"),
        previewImageName: "10",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Задня дельта", "  Мала кругла", "  Ромбоподібна",  " Трапеціподібна"]
        ,progressColors: [.red, .red, .orange, .orange,]
    ),
    
    SliderButton(
        title: "Зворотні розведення рук.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/qjuhaAXyAxQ?si=FB4JPc9FkGsAhoyF"),
        previewImageName: "11",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Задня дельта", "  Мала кругла", "  Ромбоподібна",  " Трапеціподібна"]
        ,progressColors: [.red, .red, .orange, .orange,]
    ),
    
    SliderButton(
        title: "Зведення гантель над головою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""),
        previewImageName: "12",
        progressValues: [1, 1, 0.8, 0.30],
        progressTexts: ["  Передня дельта", "  Середня дельта", "  Трапеціподібна",  " м'язи стабілізатори"]
        ,progressColors: [.red, .red, .yellow, .green,]
    ),
    

]

struct Sholder: View {
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
                                ForEach(SHbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: SHbuttons[index])) {
                                        SliderButtonView(button: SHbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
        .navigationBarBackButtonHidden(true)
    }
}


struct SHMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Sholder()
    }
}
