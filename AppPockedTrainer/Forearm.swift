import SwiftUI
import AVKit
import WebKit

let Fbuttons = [
    SliderButton(
        title: "Згинання запьястка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/U7DReKMtKz0?si=WZTxgK5x3UWBO-LV"),
        previewImageName: "81",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  
    ),
    SliderButton(
        title: "Згинання запьястка з верх. блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/F6emEG2Ow_g?si=pAgVyowy2AK6I0qp"),
        previewImageName: "19",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]
    ),
    SliderButton(
        title: "Згинання запьястка нижн. блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Rggxw-j4aw8?si=o3T2cMl0qLBBa3_T"),
        previewImageName: "forearm99",
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  
    ),




]



struct Forearm: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedIndex = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(Fbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Fbuttons[index])) {
                                        SliderButtonView(button: Fbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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


struct FMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Forearm()
    }
}
