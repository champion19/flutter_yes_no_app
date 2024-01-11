import "package:flutter/material.dart";
import "package:yes_no_app/domain/entities/message.dart";

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context)
        .colorScheme; //busca el tema dentro del contexto,el primer tema que encuentre,es el que va a usar,pero va a usar el tema global

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //mediaqeury da nformacion referente  al dispositivo que lo esta ejecutando , context:hace referenica al arbol de widgets, ahi tambien estan kas dimensiones  y diferentes caracteristicas del dispositivo que lo esta corriendo

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          //'https://yesno.wtf/assets/no/6-4bf0a784c173f70a0cab96efd9ff80c9.gif',
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi prima me esta buscando'),
            );
          },
        ));
  }
}
