import SwiftUI

struct TrainerInfo {
    let imageName: String
    let name: String
    let telegramURL: String
    let instagramURL: String
}

struct ByContactTrainer: View {
    @Environment(\.colorScheme) var colorScheme

    @Environment(\.openURL) var openURL
    
    // Массив с данными тренеров с индивидуальными URL
    let trainerData: [TrainerInfo] = [
        TrainerInfo(imageName: "Sasha", name: "Саша", telegramURL: "https://t.me/Sash88FRDM", instagramURL: "https://www.instagram.com/sasha_fitness_coach/profilecard/?igsh=Z3h1NWNvM2lwajJs"),
        TrainerInfo(imageName: "Taras", name: "Тарас", telegramURL: "https://t.me/trener_taras", instagramURL: "https://www.instagram.com/trener_taras"),
        
       
    ]
    
    @State private var showCustomAlert = false
    @State private var selectedTrainer: TrainerInfo?

    var body: some View {
        ZStack {

            Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Обери тренера.")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.1))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    .padding()
                
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(trainerData, id: \.name) { trainer in
                            VStack {
                                
                                Button(action: {
                                    selectedTrainer = trainer
                                    showCustomAlert = true
                                }) {
                                    Image(trainer.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180, height: 180)
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                }
                                
                                
                                ZStack {
                                    Color.black.opacity(0.5)
                                        .cornerRadius(10)

                                    Text("Тренер: \(trainer.name)")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(5)
                                }
                                .frame(width: 150)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding()
                }
            }
            .overlay(
                VStack {
                    if showCustomAlert {
                        VStack(spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Тренер: \(selectedTrainer?.name ?? "Тренер")")
                                        .font(.system(size: 18, weight: .bold))

                                    HStack(spacing: 20) {
                                        Button(action: {
                                            if let url = URL(string: selectedTrainer?.telegramURL ?? "") {
                                                openURL(url)
                                            }
                                        }) {
                                            Image("telega")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                        }
                                      

                                        Button(action: {
                                            if let url = URL(string: selectedTrainer?.instagramURL ?? "") {
                                                openURL(url)
                                            }
                                        }) {
                                            Image("insta")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                        }
                                    }

                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                

                               
                            }
                            .padding(.horizontal)

                           

                           
                        }
                        .frame(width: 280, height: 220)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 20)
                        .overlay(
                            Button(action: {
                                showCustomAlert = false
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.red)
                                    .font(.system(size: 30))
                                    .padding(.top, 10)
                            }
                            .padding(.trailing, 10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        )
                    }
                }
            )

        }
    }
}

struct ByContactTrainer_Previews: PreviewProvider {
    static var previews: some View {
        ByContactTrainer()
    }
}
