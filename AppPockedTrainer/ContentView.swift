import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var showContactTrainer = false
    let images = ["Ohern", "Arny2", "KayG", "Kevin", "Khris"]

    var body: some View {
        NavigationView {
            ZStack {
                
                Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Верхняя строка с тремя кнопками
                    HStack(spacing: 15){
                        VStack {
                            NavigationLink(destination: Muscules()) {
                                Image("worckaut")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Вправи.") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }

                        VStack {
                            NavigationLink(destination: MyData2()) {
                                Image("biceps")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Заміри.") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }

                        VStack {
                            NavigationLink(destination: NewTrainingWindow()) {
                                Image("blaknot")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("План") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }
                        
                        VStack {
                            NavigationLink(destination: Calckulator()) {
                                Image("CalCalc")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Кальк...") // Добавьте текст под кнопкой
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                        }
                    }

                    Spacer()

                    GeometryReader { geometry in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 25) {
                                ForEach(images, id: \.self) { imageName in
                                    NavigationLink(destination: NextView(imageName: imageName)) {
                                        Image(imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(
                                                width: sliderWidth(for: geometry.size.width),
                                                height: sliderHeight(for: geometry.size.width)
                                            )
                                            .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                    }
                                }
                            }
                        }
                        .frame(height: sliderHeight(for: geometry.size.width)) // Общая высота слайдера
                    }
                    .padding()
                    .padding(.vertical, -20)

                    Spacer()

                    // Нижнее меню
                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                showContactTrainer.toggle()
                            }) {
                                Image(systemName: "arrowshape.forward.fill")
                                    
                                    .font(.largeTitle)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)

                                    .padding(.vertical, 10)
                                Text("Замовити план тренування")
                                    .fontWeight(.bold)

                                    .font(.system(size: 23))
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            
                                

                            .frame(maxWidth: .infinity)
                            .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                        }
                    }
                }
                .sheet(isPresented: $showContactTrainer) {
                    ByContactTrainer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // Функция для вычисления ширины слайдера в зависимости от ширины экрана
    private func sliderWidth(for screenWidth: CGFloat) -> CGFloat {
        switch screenWidth {
        case ..<375:
            return screenWidth * 1 // Для маленьких экранов
        case 375...414:
            return screenWidth * 1 // Для средних экранов
        case 415...:
            return screenWidth * 1 // Для больших экранов
        default:
            return screenWidth * 0.8
        }
    }

    // Функция для вычисления высоты слайдера в зависимости от ширины экрана
    private func sliderHeight(for screenWidth: CGFloat) -> CGFloat {
        switch screenWidth {
        case ..<375:
            return screenWidth * 1.3 // Для маленьких экранов
        case 375...414:
            return screenWidth * 1.4 // Для средних экранов
        case 415...:
            return screenWidth * 1.3 // Для больших экранов
        default:
            return screenWidth * 0.6
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
