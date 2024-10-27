import SwiftUI

// Модель даних для зображень
struct ImageData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

// Структура для тренувальних днів
struct TrainingDayView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let exercises: [[String]]
    
    var body: some View {
        ZStack{
            
            VStack {
                ScrollView {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black.opacity(0.6) : Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .padding(.bottom)

                    ForEach(0..<exercises.count, id: \.self) { dayIndex in
                        VStack {
                            Text("День \(dayIndex + 1)")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(colorScheme == .dark ? Color.black.opacity(0.7) : Color.white.opacity(0.7))

                            
                            
                            ForEach(exercises[dayIndex], id: \.self) { exercise in
                                Text(exercise) // Відображаємо назви вправ
                                    .font(.title3)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity, alignment: .center) // Центруємо текст
                                    .padding()
                                    .background(colorScheme == .dark ? Color.black.opacity(0.7) : Color.white.opacity(0.7))                                .cornerRadius(10)
                            }
                        }
                        .padding(.bottom)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        
                    }
                    
                }
                
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
                    .background(Color.black.opacity(0.2))

                }
            }
        }
        
        
        .navigationBarBackButtonHidden(true)
        
    }
    
}

// Структура для відображення інформації про бодибілдерів
struct BodybuilderView: View {
    let imageName: String
    let description: String
    let title: String
    let exercises: [[String]]

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                TrainingDayView(title: title, exercises: exercises)
            }
        }
    }
}

// Специфічні представлення для кожного бодібілдера
struct Arny2View: View {
    let exercises = [
        ["ГРУДЬ-СПИНА:",
         "Жим штанги: 3-4*10",
         "Жим штанги під кутом: 40г. 3-4*10",
         "Пуловер з гантеллю: 3-4*10",
         "Підтягування зворотнім хватом: 3-4*10",
         "Тяга штанги у нахилі: 3-4*10",
         "Станова тяга: 3-4*10",
         "Скручування: 5*25"],
        ["РУКИ:",
         "Швунг: 3-4*10",
         "Махи гантель через боки: 3-4*10 ",
         "Протяжка до підборіддя: 3-4*10",
         "Армійский жим: 3-4*10",
         "Згинання рук зі штангою: 3-4*10",
         "Згинання рук з гантелями: 3-4*10",
         "Жим штанги вузьким хватом: 3-410",
         "Французький із под голови: 3-4*10",
         "Згинання запьястка зі штангою: 3-4*10",
         "Зворотні скпучування: 5*25"],
        ["НОГИ:",
         "Присідання зі штангою: 3-4*10",
         "Впади: 3-4*10", "Сгинання ніг лежачі: 3-4*10", "Станова тяга: 3-4*10",
         "Доброго ранку: 3-4*10",
         "Підйом на носки зі штангою: 3-4*10", "Скручування: 5*25"],
        ["ГРУДЬ-СПИНА:",
         "Жим штанги: 3-4*10",
         "Жим штанги під кутом: 40г. 3-4*10",
         "Пуловер з гантеллю: 3-4*10",
         "Підтягування зворотнім хватом: 3-4*10",
         "Тяга штанги у нахилі: 3-4*10",
         "Станова тяга: 3-4*10",
         "Скручування: 5*25"],
        ["РУКИ:",
         "Швунг: 3-4*10",
         "Махи гантель через боки: 3-4*10 ",
         "Протяжка до підборіддя: 3-4*10",
         "Армійский жим: 3-4*10",
         "Згинання рук зі штангою: 3-4*10",
         "Згинання рук з гантелями: 3-4*10",
         "Жим штанги вузьким хватом: 3-410",
         "Французький із под голови: 3-4*10",
         "Згинання запьястка зі штангою: 3-4*10",
         "Зворотні скпучування: 5*25"],
        ["НОГИ:",
         "Присідання зі штангою: 3-4*10",
         "Впади: 3-4*10", "Сгинання ніг лежачі: 3-4*10", "Станова тяга: 3-4*10",
         "Доброго ранку: 3-4*10",
         "Підйом на носки зі штангою: 3-4*10", "Скручування: 5*25"],
        ["Відпочинок"]
        
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Arny2",
                        description: "Опис для Arny2",
                        title: "План тренування: \nАрнольда Шварценегера.",
                        exercises: exercises)
    }
}

struct KayGView: View {
    let exercises = [
        ["ГРУДНІ МʼЯЗИ:",
         "Гирьєвий жим лежачи: 3 * 20,15,12",
         "Жим штанги позетивний кут 3*20,15,12",
         "Жим штанги горізотально 3*20,15,12",
         "Зведення гантель позет. кут 3*2-,25,12",
          "", ""],
        ["БІЦЕИС - ТРІЦЕПС:",
         "Концентрований підйом штанги 4*10-12",
         "Підйом гантель 4*8-10",
         "Підйом гантель на наклоній лавці 4*8-10",
         "Підйом штанги зворотнім хватом 4*8-10",
         "Розгинання рук під нахилом 3*20,15,10",
         "Розгинання рук стоячі за голови 3*20,15,12",
         "Розгинання рук з верхнього блоку 3*20,15,12",
         ""],
        ["НОГИ:",
         "Згинання ніг у тренажері 3*15-20",
         "Присідання 3*15-20",
         "Підйом на носки стоячі 4*20",
         "Жим ногами 3*15-20",
         "Присідання-Зворотня станова 3*12-15",
         ""],
        ["СПИНА:",
         "Тяга штанги у нахилі 3*10",
         "Тяга верхнього блоку 3*12-15",
         "Тяга гантель під кутом 3*12-15",
         "Тяга нижнього блоку 3*10",
         "Тяга штанги за один кінець 3*12-15",
         ""],
        ["ПЛЕЧІ:",
         "Жим Арнольда 3*12-15",
         "Жим штанги за голову 3*12",
         "Шраги 3*12-15",
         "Підйом штанги перед собою 3*12-15",
         "Розведення гантель в боки 3*12-15",
         "Протяжка гантельями 3*12-15"],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        
    ]
    
    var body: some View {
        BodybuilderView(imageName: "KayG",
                        description: "",
                        title: "План тренування: \nКая Гріна.",
                        exercises: exercises)
    }
}

struct KevinView: View {
    let exercises = [
        [
         "ГРУДНІ, ПЛЕЧІ, ТРІЦЕПС:",
         "Жим штанги лежачі 4*6-8",
         "Жми під позетивним кутом 4*6-8",
         "Жим у хамері 4*12-15",
         "Зведення у кроссовері 4*12-15",
         "Жим гантель 4*6-8",
         "Відведення гантель через боки 4*12-15",
         "Шраги 4*15",
         "Жим штанги вузьким хватом 4*6-8",
         "", "", ""],
        
        ["СПИНА - БІЦЕПС:",
         "Тяга верхнього блоку 4*6-8",
         "Тяга Т-гріф 4*6-8",
         "Тягна гантель у нахилі 4*6-8",
         "Тяга нижнього блоку 4*6-8",
         "Пуловер з верхнього блоку 4*12-15",
         "Біцепс гантелями на лавці 4*6-8",
         "Молотки стоячі 4*6-8",
         "Лавка Скотта 4*12-15"],
        
        ["НОГИ-ПРЕС:",
         "Гакк присідання 4*6-8",
         "Сгинання ніг у тренажері 4*6-8",
         "Жим ногами 4*12-15",
         "Підйом на носки стоячі 4*15",
         "Скручування 4*24",
         "Підйом ніг висячі 4*25"],
       
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Kevin",
                        description: "",
                        title: "План тренування: \nКевіна Леврона.",
                        exercises: exercises)
    }
}

struct KhrisView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Khris",
                        description: "Ось ваш план тренування для Кріса Бумстеда",
                        title: "План тренування: \nКріса Бумстеда.",
                        exercises: exercises)
    }
}

struct OhernView: View {
    let exercises = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
    ]
    
    var body: some View {
        BodybuilderView(imageName: "Ohern",
                        description: "",
                        title: "План тренування: \nМайка Охерна.",
                        exercises: exercises)
    }
}

// Основне представлення NextView, яке відображає вибране зображення
struct NextView: View {
    var imageName: String
    
    var body: some View {
        switch imageName {
        case "Arny2":
            Arny2View()
        case "KayG":
            KayGView()
        case "Kevin":
            KevinView()
        case "Khris":
            KhrisView()
        case "Ohern":
            OhernView()
        default:
            Text("Зображення не знайдено")
                .font(.headline)
                .padding()
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextView(imageName: "Arny2")
                .previewDisplayName("Arny2 Preview")
            
            NextView(imageName: "KayG")
                .previewDisplayName("KayG Preview")
            
            NextView(imageName: "Kevin")
                .previewDisplayName("Kevin Preview")
            
            NextView(imageName: "Khris")
                .previewDisplayName("Khris Preview")
            
            NextView(imageName: "Ohern")
                .previewDisplayName("Ohern Preview")
        }
    }
}




