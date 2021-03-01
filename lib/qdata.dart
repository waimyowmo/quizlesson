class Questions {
  String question;
  bool answer;

  Questions({this.question, this.answer});
}

int questionnum = 0;

class Qdata {
  List<Questions> quickbrain = [
    Questions(
        question: 'Bhamo Township is located in Shan State.', answer: false),
    Questions(
        question: 'Yangon is the capital city of Myanmar.', answer: false),
    Questions(
        question: 'Myitkyinar City is located in Kachin State.', answer: true),
    Questions(
        question: 'General Aung San was borned in February 13,1915.',
        answer: true),
    Questions(question: 'Myanmar Country is located in Europe', answer: false),
    Questions(question: 'All Done!', answer: true),
  ];

  String question(int questionnum) {
    return quickbrain[questionnum].question;
  }

  bool answer(int questionnum) {
    return quickbrain[questionnum].answer;
  }

  int qlen() {
    return quickbrain.length;
  }
}
