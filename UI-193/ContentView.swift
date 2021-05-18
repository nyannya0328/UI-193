//
//  ContentView.swift
//  UI-193
//
//  Created by にゃんにゃん丸 on 2021/05/18.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var todoList : [String] = []
    var body: some View {
        VStack{
            
            
            HStack{
                
                Text("New Task")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                
                Spacer()
                
                
                Image(systemName: "gear")
                    .font(.title2)
            }
            
            HStack{
                
                TextField("Enter Task", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: .black.opacity(text == "" ? 0 : 0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(text == "" ? 0 : 0.3), radius: 5, x: -5, y: -5)
                
                
                Button(action: {
                    
                    todoList.append(text)
                    text = ""
                    UserDefaults.standard.set(todoList, forKey: "TEXT")
                }, label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red,lineWidth: 5)
                            .frame(width: 50, height: 35)
                          
                        
                        Text("ADD")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            
                            
                            
                    }
                })
                .disabled(text == "")
                .opacity(text == "" ? 0.7  : 1)
            }
            .padding(.horizontal)
            
            
            HStack{
                
                Text("To Do List")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                EditButton()
                    .font(.title2)
                    .foregroundColor(.red)
                
                
            }
            .padding([.horizontal,.top])
            
            
            List{
                
                
                ForEach(todoList,id:\.self){index in
                    
                    Text(index)
                        .font(.title)
                        .fontWeight(.heavy)
                        
                    
                }
              
                
                .onDelete(perform: { indexSet in
                    todoList.remove(atOffsets: indexSet)
                    UserDefaults.standard.set(todoList, forKey: "TEXT")
                })
                .onMove(perform: { indices, newOffset in
                    todoList.move(fromOffsets: indices, toOffset: newOffset)
                    UserDefaults.standard.set(todoList, forKey: "TEXT")
                })
            }
            .listStyle(InsetListStyle())
           
            
        
            
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.ignoresSafeArea())
        .onAppear(perform: {
            guard let defaultItem = UserDefaults.standard.array(forKey: "TEXT") as? [String] else {
                
                
                return
            }
            
            todoList = defaultItem
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
