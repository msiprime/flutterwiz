import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/ai_test/presentation/blocs/gemini_bloc.dart';
import 'package:flutter_exploring/widget/app_textfield.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AiPromptScreen extends StatelessWidget {
  const AiPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeminiBloc(),
      child: const AiPromptView(),
    );
  }
}

class AiPromptView extends StatelessWidget {
  const AiPromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini AI Prompt'),
      ),
      body: BlocBuilder<GeminiBloc, GeminiState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: GeminiResponseTypeView(
                builder: (context, child, response, loading) {
                  if (loading) {
                    return CupertinoActivityIndicator();
                  }

                  if (response != null) {
                    return Markdown(
                      data: response,
                      selectable: true,
                    );
                  } else {
                    /// idle state
                    return const Center(child: Text('Search something!'));
                  }
                },
              )),
              GeminiTextField(controller: TextEditingController()),
            ],
          );
        },
      ),
    );
  }
}

class GeminiTextField extends StatefulWidget {
  const GeminiTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<GeminiTextField> createState() => _GeminiTextFieldState();
}

class _GeminiTextFieldState extends State<GeminiTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: AppTextField.roundedBorder(
              textController: widget.controller,
              onChanged: (value) {
                context.read<GeminiBloc>().add(GeminiTextFieldChanged(value));
              },
              hintText: 'Write a story about a magic backpack.',
            ),
          ),
          IconButton(
            onPressed: () {
              final prompt = widget.controller.text.trim();
              if (prompt.isNotEmpty) {
                context
                    .read<GeminiBloc>()
                    .add(GeminiTextFieldSubmitted(prompt));
              }
            },
            icon: const Icon(
              Icons.send_sharp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ResponseBuilder extends StatelessWidget {
  const ResponseBuilder({super.key, required this.candidates});

  final Candidates? candidates;

  @override
  Widget build(BuildContext context) {
    if (candidates == null || candidates?.output?.isEmpty == true) {
      return const Center(
        child: Text('No results to display. Try a different prompt!'),
      );
    }

    return ListView.builder(
      itemCount: candidates?.output?.length,
      itemBuilder: (context, index) {
        final output = candidates?.output![index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              output ?? '',
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
      },
    );
  }
}
