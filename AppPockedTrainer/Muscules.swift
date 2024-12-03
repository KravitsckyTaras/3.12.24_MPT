import SwiftUI

// Пример перечисления для типов мышц
enum MuscleType: CaseIterable {
    case chest, back, trapezia, shoulder, biceps, triceps, quad, thighBiceps, gluteus, calf, forearm, core
    
    var icon: Image {
        switch self {
        case .chest: return Image("IconMuscle5")
        case .back: return Image("IconMuscle1")
        case .trapezia: return Image("IconMuscle12")
        case .shoulder: return Image("IconMuscle10")
        case .biceps: return Image("IconMuscle3")
        case .triceps: return Image("IconMuscle11")
        case .quad: return Image("IconMuscle9")
        case .thighBiceps: return Image("IconMuscle2")
        case .gluteus: return Image("IconMuscle8")
        case .calf: return Image("IconMuscle7")
        case .forearm: return Image("IconMuscle4")
        case .core: return Image("IconMuscle6")
        }
    }
}

// Экран Muscules
struct Muscules: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme // Получаем текущую тему экрана

    var body: some View {
        NavigationView {
            ZStack {
                // Фоновое изображение зависит от темы экрана
                Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            let iconWidth = (geometry.size.width / 3) - 20
                            let iconHeight = iconWidth * 1.27
                            
                            ForEach(MuscleType.allCases, id: \.self) { muscle in
                                NavigationLink(destination: destinationView(for: muscle)) {
                                    muscle.icon
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: iconWidth, height: iconHeight)
                                        .background(colorScheme == .dark ? Color.black.opacity(0.3) : Color.black.opacity(0.3))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    }
                    Spacer()
                        .padding(.top, 40)
                }
            
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "house.fill")
                                .font(.largeTitle)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.vertical, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black.opacity(0.2) : Color.black.opacity(0.2))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Три столбца в сетке
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    }
    
    // Функция для получения представления в зависимости от типа мышцы
    @ViewBuilder
    private func destinationView(for muscle: MuscleType) -> some View {
        switch muscle {
        case .chest:      Chest()
        case .back:       Back()
        case .trapezia:   Trapezia()
        case .shoulder:   Sholder()
        case .biceps:     Biceps()
        case .triceps:    Triceps()
        case .quad:       Quadro()
        case .thighBiceps: ThingBiceps()
        case .gluteus:    Glutus()
        case .calf:       CalfMuscules()
        case .forearm:    Forearm()
        case .core:       Core()
        }
    }
}

struct Muscules_Previews: PreviewProvider {
    static var previews: some View {
        Muscules()
            .preferredColorScheme(.light) // Превью для светлой темы
        Muscules()
            .preferredColorScheme(.dark) // Превью для тёмной темы
    }
}
