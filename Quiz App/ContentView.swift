//
//  ContentView.swift
//  Quiz App
//
//  Created by Jolie Lim on 15/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var questions = [Question(title: "Which planet has the most moons?",
                                  option1: "Saturn",
                                  option2: "Mecury",
                                  option3: "Earth",
                              option4: "Mars",
                              correctOption: 1),
                         Question(title: "How many dots appear on a pair of dice",
                                  option1: "41",
                                  option2: "42",
                                  option3: "21",
                                  option4: "48",
                                  correctOption: 2),
                         Question(title: "Where did sushi originate?",
                                  option1: "China",
                                  option2: "Japan",
                                  option3: "Korea",
                                  option4: "America",
                                  correctOption: 1),
                     Question(title:"What height is a regulation NBA basket?",
                              option1: "14 feet",
                              option2: "11 feet",
                              option3: "20 feet",
                              option4: "10 feet",
                              correctOption: 4)]
    
    @State var currentQuestion = 0
    @State var isAlertPresented = false
    @State var isCorrect = false
    @State var correctAnswers = 0
    @State var isModalPresented = false
                     
    var body: some View {
        VStack{
            ProgressView(value: Double(currentQuestion),
                         total: Double(questions.count))
                .padding()
            
            Text(questions[currentQuestion].title)
                .padding()
                .foregroundColor(.black)
            HStack {
                VStack {
                    Button {
                        TapOption(optionNumber: 1)
                    } label: {
                        Image(systemName: "triangle.fill")
                        Text(questions[currentQuestion].option1)
                    }
                    .frame(width: 100.0, height: 50.0)
                    .background(.green)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    Button {
                        TapOption(optionNumber: 2)
                    } label: {
                        Image(systemName: "circle.fill")
                        Text(questions[currentQuestion].option2)
                    }
                    .frame(width: 100.0, height: 50.0)
                    .background(.yellow)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                }
                .padding()
                VStack {
                    Button {
                        TapOption(optionNumber: 3)
                    } label: {
                        Image(systemName: "diamond.fill")
                        Text(questions[currentQuestion].option3)
                    }
                    .frame(width: 100.0, height: 50.0)
                    .background(.cyan)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    Button {
                        TapOption(optionNumber: 4)
                    } label: {
                        Image(systemName: "square.fill")
                        Text(questions[currentQuestion].option4)
                    }
                    .frame(width: 100.0, height: 50.0)
                    .background(.gray)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    
                }
                .padding()
                
            }
            .padding()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                  message: Text(isCorrect ? "Congratulations🎉" : "Unfortunately, You are Wrong 👎"),
                  dismissButton: .default(Text("OK")) {
                currentQuestion += 1
                
                if currentQuestion == questions.count {
                    isModalPresented = true
                    currentQuestion = 0
                }
            })
        }
        .sheet(isPresented: $isModalPresented,
               onDismiss: {
            correctAnswers = 0
            
        },
               content: {
            Score_View(score: correctAnswers,
                      totalQuestions: questions.count)
        })
    }
    
    func TapOption(optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong")
            isCorrect = false
        }
        isAlertPresented = true
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
