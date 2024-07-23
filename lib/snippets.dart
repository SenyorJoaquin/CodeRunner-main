class CodeSegment {
  final String text;
  final bool editable;

  CodeSegment(this.text, {this.editable = false});
}

class CodeLine {
  final List<CodeSegment> segments;

  CodeLine(this.segments);

  String get fullText {
    return segments.map((segment) => segment.text).join('');
  }
}

class CodeSnippet {
  final String description;
  final List<CodeLine> codeSnippet;

  CodeSnippet(this.description, this.codeSnippet);
}

List<CodeSnippet> flutterEasySnippets = [
  //1
  CodeSnippet(
    'Fill in the blanks to complete the code for the text widget',
    [
      CodeLine([
        CodeSegment('Text', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Text Widget'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //2
  CodeSnippet(
    'Fill in the blanks to complete the code for centering a widget',
    [
      CodeLine([
        CodeSegment('Center', editable: true),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('child', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Centered Text'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //3
  CodeSnippet(
    'Fill in the blanks to complete the code for displaying a Star Icon:',
    [
      CodeLine([
        CodeSegment('Icon', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('Icons', editable: true),
        CodeSegment('.star', editable: true),
        CodeSegment(')', editable: true),
      ]),
    ],
  ),

  //4
  CodeSnippet(
    'Fill in the blanks to complete the code for adding padded text inside a container:',
    [
      CodeLine([
        CodeSegment('Container', editable: false),
        CodeSegment('('),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('padding', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('EdgeInsets', editable: false),
        CodeSegment('.', editable: false),
        CodeSegment('all', editable: false),
        CodeSegment('(16.0)'),
        CodeSegment(','),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('child', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Padded text'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment(')'),
      ]),
    ],
  ),
  //5
  CodeSnippet(
    'Fill in the blanks to complete the code for a text field with decoration and a label:',
    [
      CodeLine([
        CodeSegment('TextField', editable: false),
        CodeSegment('('),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('decoration', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('InputDecoration', editable: false),
        CodeSegment('('),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('labelText', editable: true),
        CodeSegment(':'),
        CodeSegment(' '),
        CodeSegment('\'', editable: true),
        CodeSegment('Enter your name'),
        CodeSegment('\'', editable: true),
        CodeSegment(','),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment(')'),
      ]),
      CodeLine([
        CodeSegment(')'),
      ]),
    ],
  ),
  //6
];

List<CodeSnippet> flutterMediumSnippets = [
  //1
  CodeSnippet(
    'Fill in the blanks to complete the code for a ListView with ListTile children:',
    [
      CodeLine([
        CodeSegment('ListView', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('children', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('[', editable: true)
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('ListTile', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('title', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Item 1'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment('),', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('ListTile', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('title', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Item 2'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment('),', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('ListTile', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('title', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Item 3'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment('),', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment(']', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //2

  CodeSnippet(
    'Fill in the blanks to complete the code for a Checkbox with an onChanged action:',
    [
      CodeLine([
        CodeSegment('Checkbox', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('value', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('true'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('onChanged', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('(', editable: true),
        CodeSegment('bool', editable: true),
        CodeSegment(' value'),
        CodeSegment(')', editable: true),
        CodeSegment(' {', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('// Action when checkbox state changes', editable: false),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('}', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //3
  CodeSnippet(
    'Fill in the blanks to complete the code for a TextField with decoration and a label:',
    [
      CodeLine([
        CodeSegment('TextField', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('decoration', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('InputDecoration', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('labelText', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('\'', editable: true),
        CodeSegment('Enter your name'),
        CodeSegment('\'', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //4
  CodeSnippet(
    'Fill in the blanks to complete the code for a ListTile with leading Icon, title, and subtitle:',
    [
      CodeLine([
        CodeSegment('ListTile', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('leading', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Icon', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('Icons', editable: false),
        CodeSegment('.person'),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('title', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('John Doe'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('subtitle', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('johndoe@example.com'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),

//5
  CodeSnippet(
    'Fill in the blanks to complete the code for a TextButton with an action:',
    [
      CodeLine([
        CodeSegment('TextButton', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('onPressed', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('()', editable: true),
        CodeSegment(' {', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('// Action when button is pressed', editable: false),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('}', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('child', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('BUTTON 1'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
];

List<CodeSnippet> flutterHardSnippets = [
  //1
  CodeSnippet(
    'Fill in the blanks to complete the code for creating 3 columns of text widgets',
    [
      CodeLine([
        CodeSegment('Column', editable: true),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('children', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('[', editable: true),
      ]),
      CodeLine([
        CodeSegment('    '),
        CodeSegment('Text', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Line 1'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('    '),
        CodeSegment('Text', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Line 2'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('    '),
        CodeSegment('Text', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment('\'', editable: true),
        CodeSegment('Line 3'),
        CodeSegment('\'', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment(']', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //2
  CodeSnippet(
    'Fill in the blanks to complete the code for displaying an Icon with color and size:',
    [
      CodeLine([
        CodeSegment('Icon', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('Icons', editable: false),
        CodeSegment('.star'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('color', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Colors', editable: false),
        CodeSegment('.yellow'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('size', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('30'),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //3
  CodeSnippet(
    'Fill in the blanks to complete the code for displaying styled text with font size, font weight, and font color:',
    [
      CodeLine([
        CodeSegment('Text', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('\'', editable: true),
        CodeSegment('Hello, Flutter!'),
        CodeSegment('\'', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('style', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('TextStyle', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('fontSize', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('20'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('fontWeight', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('FontWeight', editable: false),
        CodeSegment('.bold'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('       '),
        CodeSegment('color', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('Colors', editable: false),
        CodeSegment('.blue'),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //4
  CodeSnippet(
    'Fill in the blanks to complete the code for displaying a network image with size and fit properties:',
    [
      CodeLine([
        CodeSegment('Image', editable: false),
        CodeSegment('.network', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('\'', editable: true),
        CodeSegment('https://example.com/image.jpg'),
        CodeSegment('\'', editable: true),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('width', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('150'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('height', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('150'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('fit', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('BoxFit', editable: false),
        CodeSegment('.cover'),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  //5
  CodeSnippet(
    'Fill in the blanks to complete the code for displaying a CircularProgressIndicator with stroke width and value color properties:',
    [
      CodeLine([
        CodeSegment('CircularProgressIndicator', editable: false),
        CodeSegment('(', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('strokeWidth', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('3'),
        CodeSegment(',', editable: true),
      ]),
      CodeLine([
        CodeSegment('   '),
        CodeSegment('valueColor', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' '),
        CodeSegment('AlwaysStoppedAnimation', editable: false),
        CodeSegment('<Color>', editable: false),
        CodeSegment('('),
        CodeSegment('Colors', editable: false),
        CodeSegment('.blue'),
        CodeSegment(')'),
      ]),
      CodeLine([
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
];

List<CodeSnippet> swiftEasySnippets = [
  CodeSnippet(
    'Fill in the blanks to complete the code for printing "Hello, World!" to the console:',
    [
      CodeLine([
        CodeSegment('print', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\"', editable: true),
        CodeSegment('Hello, World!'),
        CodeSegment('\"', editable: true),
        CodeSegment(')', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for declaring a constant with value 10:',
    [
      CodeLine([
        CodeSegment('let', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('constant', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('=', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('10'),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for creating a variable with value "Swift":',
    [
      CodeLine([
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('variable'),
        CodeSegment(' ', editable: false),
        CodeSegment('=', editable: true),
        CodeSegment('\"', editable: true),
        CodeSegment('Swift'),
        CodeSegment('\"', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for declaring a function that takes two integers and returns their sum:',
    [
      CodeLine([
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('sum', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('a', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(',', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('b', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('->', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(' '),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('a', editable: true),
        CodeSegment('+', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('b', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for creating an empty array of integers:',
    [
      CodeLine([
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('array', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('[Int]', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('=', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('[]', editable: true),
      ]),
    ],
  ),
];

List<CodeSnippet> swiftMediumSnippets = [
  CodeSnippet(
    'Fill in the blanks to complete the code for creating a class named Person with properties name and age:',
    [
      CodeLine([
        CodeSegment('class', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Person', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('name', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('String', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('age', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for declare a function that returns true if a number is even, false otherwise:',
    [
      CodeLine([
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('isEven', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('number', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(')', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('->', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Bool', editable: true),
        CodeSegment(' '),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('number', editable: true),
        CodeSegment('%', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('2', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('==', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('0', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for creating an extension for Int that adds a squared computed property:',
    [
      CodeLine([
        CodeSegment('extension', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('squared', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('  '),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('self', editable: true),
        CodeSegment('*', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('self', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('}', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for declaring a protocol named Printable with a method printDetails:',
    [
      CodeLine([
        CodeSegment('protocol', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Printable', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('printDetails', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for creating a dictionary with keys "name" and "age", and values "John" and 30:',
    [
      CodeLine([
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('person', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('[String: Any]', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('=', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('['),
      ]),
      CodeLine([
        CodeSegment('  '),
        CodeSegment('\"', editable: true),
        CodeSegment('name'),
        CodeSegment('\"', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('\"', editable: true),
        CodeSegment('John'),
        CodeSegment('\"', editable: true),
        CodeSegment(',', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('\"', editable: true),
        CodeSegment('age'),
        CodeSegment('\"', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('30'),
      ]),
      CodeLine([
        CodeSegment(']', editable: true),
      ]),
    ],
  ),
];

List<CodeSnippet> swiftHardSnippets = [
  CodeSnippet(
    'Fill in the blanks to complete the code for defining an enumeration named "Direction" with north, south, east, and west cases:',
    [
      CodeLine([
        CodeSegment('enum', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Direction', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('case', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('north', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('case', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('south', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('case', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('east', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('case', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('west', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for implementing a simple protocol named Greetable and a Person class conforming to it:',
    [
      CodeLine([
        CodeSegment('protocol', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Greetable', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('greet', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('}', editable: true),
      ]),
      CodeLine([
        CodeSegment('class', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Person', editable: true),
        CodeSegment(':', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Greetable', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('greet', editable: true),
        CodeSegment('(', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('    {', editable: true),
      ]),
      CodeLine([
        CodeSegment('        ', editable: false),
        CodeSegment('print', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\"', editable: true),
        CodeSegment('Hello!'),
        CodeSegment('\"', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('    }'),
      ]),
      CodeLine([
        CodeSegment('}'),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for writing a function that returns a closure:',
    [
      CodeLine([
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('closure'),
        CodeSegment('(', editable: true),
        CodeSegment(
          'increment: Int',
        ),
        CodeSegment(')', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('->', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('()', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('->', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Int', editable: true),
      ]),
      CodeLine([
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('total', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('= 0', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('let', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('incrementer', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('=', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('() -> Int', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('in', editable: true),
      ]),
      CodeLine([
        CodeSegment('        ', editable: false),
        CodeSegment('total', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('+=', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('incrementAmount', editable: true),
      ]),
      CodeLine([
        CodeSegment('        ', editable: false),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('total', editable: true),
      ]),
      CodeLine([
        CodeSegment('    }'),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('incrementer', editable: true),
      ]),
      CodeLine([
        CodeSegment('}'),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for defining a simple extension for the String class:',
    [
      CodeLine([
        CodeSegment('extension', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('String', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('reversed', editable: true),
        CodeSegment('()', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('->', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('String', editable: true),
      ]),
      CodeLine([
        CodeSegment('    {', editable: true),
      ]),
      CodeLine([
        CodeSegment('        ', editable: false),
        CodeSegment('return', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('String', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('self.reversed()', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('    }'),
      ]),
      CodeLine([
        CodeSegment('}'),
      ]),
    ],
  ),
  CodeSnippet(
    'Fill in the blanks to complete the code for creating a structure with a method:',
    [
      CodeLine([
        CodeSegment('struct', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('Person', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('{', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('var', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('name', editable: true),
        CodeSegment(': ', editable: false),
        CodeSegment('String', editable: true),
      ]),
      CodeLine([
        CodeSegment('    ', editable: false),
        CodeSegment('func', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('greet', editable: true),
        CodeSegment('()', editable: true),
      ]),
      CodeLine([
        CodeSegment('    {', editable: true),
      ]),
      CodeLine([
        CodeSegment('        ', editable: false),
        CodeSegment('print', editable: false),
        CodeSegment('(', editable: true),
        CodeSegment('\"', editable: true),
        CodeSegment('Hello, ', editable: false),
        CodeSegment('\"', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('+', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('name', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('+', editable: true),
        CodeSegment(' ', editable: false),
        CodeSegment('\"', editable: true),
        CodeSegment('!'),
        CodeSegment('\"', editable: true),
        CodeSegment(')', editable: true),
      ]),
      CodeLine([
        CodeSegment('    }'),
      ]),
      CodeLine([
        CodeSegment('}'),
      ]),
    ],
  ),
];
