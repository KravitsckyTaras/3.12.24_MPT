import SwiftUI 


let CalfMusculesbuttons = [
    
    SliderButton(
        title: "Підйом на носки стоячі.",
        description: "Опис кнопки",
        videoURL: URL(string: "https://www.youtube.com/embed/r4mD0TD8880?si=BJe0IraJo9uSRSZv"),
        previewImageName: "77",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["   Ікроніжна.", "  Камболоподібна.", "  Довга малогомілкова.",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
    
    SliderButton(
        title: "Підйом платформи у тренажері.",
        description: "Опис кнопки",
        videoURL: URL(string: "https://www.youtube.com/embed/lpdvUgM1VDY?si=XyP9laQ_LQHQtgSI"),
        previewImageName: "78",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Гомілка.", "  Камболоподібна.", "",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
    SliderButton(
        title: "Підйом на носки сидячі.",
        description: "Опис кнопки",
        videoURL: URL(string: ""),
        previewImageName: "79",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Гомілка.", "  Камболоподібна.", "",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
    SliderButton(
        title: "Підйоми носки в гору.",
        description: "Опис кнопки",
        videoURL: URL(string: ""),
        previewImageName: "80",
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Передня великогомілкова.", "  Довгий розгинач пальців стопи.", "  ",  ""],
        progressColors: [.red, .red, .red, .yellow]
    ),
]


struct CalfMuscules: View {
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
                                ForEach(CalfMusculesbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: CalfMusculesbuttons[index])) {
                                        SliderButtonView(button: CalfMusculesbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                                .background(colorScheme == .dark ? .white.opacity(0.8) : .black.opacity(0.2))
                                .cornerRadius(8)
                            }
                            .padding()                         }
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


struct CalfMusculesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalfMuscules()
    }
}
