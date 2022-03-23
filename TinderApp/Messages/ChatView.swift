//
//  ChatView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    @State private var typingMessage: String = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    
    var body: some View {
        //  Needed to scroll through the messages
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 60)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    // VStack of all messages
                    ScrollViewReader { proxy in
                        LazyVStack {
                            //  Need message and id of each message
                            ForEach(chatMng.messages.indices, id: \.self) { index in
                                let msg = chatMng.messages[index]
                                MessageView(message: msg)
                                    .id(index)
                                // Message now appears to come in from the side
                                    .animation(.easeIn)
                                    .transition(.move(edge: .trailing))
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                    }
                })
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button(action: { sendMessage() }, label: {
                        Text("Send")
                    })
                        .padding(.horizontal)
                    //  Button changes color if the textField contains a message
                        .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                //  Border around the edges of the text field
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first) {
                // Video Action
            }
        }
        
        .modifier(HideNavigationView())
        .onChange(of: chatMng.keyboardIsShowing, perform: { value in
            if value {
                //  Scroll to the bottom
                scrollToBottom()
            }
        })
        
        .onChange(of: chatMng.messages, perform: { _ in
            scrollToBottom()
        })
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMessage))
        // After typing and sending a message, make it empty
        typingMessage = ""
    }
    
    func scrollToBottom() {
        withAnimation {
        scrollProxy?.scrollTo(chatMng.messages.count-1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.examplePerson)
    }
}
