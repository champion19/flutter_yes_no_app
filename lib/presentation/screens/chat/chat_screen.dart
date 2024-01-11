import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://1000logos.net/wp-content/uploads/2018/04/Blink-182-Symbol.png'),
          ),
        ),
        title: const Text('mi banda favorita'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                //builder tipo de funcion  que  en tiempo de ejecucion flutter va a ejecutar para crear este widget, esto permite  crear  una lista de infinitos elementos.
                child: ListView.builder(
                    controller:
                        chatProvider.chatScrollController, //los enlazamos
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            //Caja de texto
            MessageFieldBox(
              //onValue: (value) =>chatProvider.sendMessage(value),
              onValue: chatProvider
                  .sendMessage, //en misma cantidad de argumentos y posiciones podemos borrar ese onValue y mandamos la referencia a la funcion
            ),
          ],
        ),
      ),
    );
  }
}
