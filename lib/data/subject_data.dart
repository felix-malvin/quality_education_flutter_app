import 'package:flutter/material.dart';
import 'package:quality_education_app/models/quiz_model.dart';
import 'package:quality_education_app/models/subject_model.dart';

List<Subject> subjects = [
  Subject(
    title: "Math",
    image: "assets/math_logo_secondary.png",
    imagePrimary: "assets/math_logo_primary.png",
    baseColor: Colors.orange,
    quarterColor: Colors.amber,
    quiz: [
      Quiz(
        question: 'What is the value of π (pi) to 2 decimal places?',
        options: ['3.12', '3.14', '3.16', '3.18'],
        answer: '3.14',
      ),
      Quiz(
        question: 'Solve: 5² = ?',
        options: ['10', '15', '25', '30'],
        answer: '25',
      ),
      Quiz(
        question: 'What is the square root of 81?',
        options: ['9', '8', '7', '6'],
        answer: '9',
      ),
      Quiz(
        question: 'What is 15% of 200?',
        options: ['20', '25', '30', '35'],
        answer: '30',
      ),
      Quiz(
        question: 'Simplify: 4x + 2x = ?',
        options: ['6', '4x', '6x', '8x'],
        answer: '6x',
      ),
      Quiz(
        question: 'Which is a prime number?',
        options: ['9', '21', '31', '33'],
        answer: '31',
      ),
      Quiz(
        question: 'What is the formula for area of a circle?',
        options: ['πr²', '2πr', 'πd', 'r²'],
        answer: 'πr²',
      ),
      Quiz(
        question: 'What is 144 ÷ 12?',
        options: ['10', '12', '14', '16'],
        answer: '12',
      ),
      Quiz(
        question: 'Convert 0.75 to a fraction.',
        options: ['3/4', '2/3', '1/2', '5/6'],
        answer: '3/4',
      ),
      Quiz(
        question: 'What is the next number in the sequence: 2, 4, 8, 16, ...?',
        options: ['18', '24', '32', '64'],
        answer: '32',
      ),
    ],
  ),
  Subject(
    title: "Physics",
    image: "assets/physics_logo_secondary.png",
    imagePrimary: "assets/physics_logo_primary.png",
    baseColor: Colors.indigo.shade900,
    quarterColor: Colors.grey.shade400,
    quiz: [
      Quiz(
        question: 'What is the unit of force?',
        options: ['Watt', 'Newton', 'Joule', 'Pascal'],
        answer: 'Newton',
      ),
      Quiz(
        question: 'What is the acceleration due to gravity on Earth?',
        options: ['9.8 m/s²', '10 m/s²', '8.9 m/s²', '9 m/s²'],
        answer: '9.8 m/s²',
      ),
      Quiz(
        question: 'What is the formula for speed?',
        options: [
          'Speed = Distance × Time',
          'Speed = Distance / Time',
          'Speed = Time / Distance',
          'Speed = Acceleration × Time',
        ],
        answer: 'Speed = Distance / Time',
      ),
      Quiz(
        question: 'What does a voltmeter measure?',
        options: ['Current', 'Voltage', 'Resistance', 'Power'],
        answer: 'Voltage',
      ),
      Quiz(
        question: 'Who discovered the law of gravity?',
        options: ['Newton', 'Einstein', 'Galileo', 'Tesla'],
        answer: 'Newton',
      ),
      Quiz(
        question: 'What is the SI unit of energy?',
        options: ['Watt', 'Joule', 'Newton', 'Volt'],
        answer: 'Joule',
      ),
      Quiz(
        question: 'Which phenomenon explains rainbow formation?',
        options: ['Reflection', 'Refraction', 'Diffraction', 'Polarization'],
        answer: 'Refraction',
      ),
      Quiz(
        question: 'Light year is a unit of?',
        options: ['Time', 'Distance', 'Speed', 'Light'],
        answer: 'Distance',
      ),
      Quiz(
        question: 'What is Ohm’s law?',
        options: ['V = IR', 'F = ma', 'P = VI', 'E = mc²'],
        answer: 'V = IR',
      ),
      Quiz(
        question: 'Which particle carries a negative charge?',
        options: ['Proton', 'Electron', 'Neutron', 'Photon'],
        answer: 'Electron',
      ),
    ],
  ),
  Subject(
    title: "Biology",
    image: "assets/biology_logo_secondary.png",
    imagePrimary: "assets/biology_logo_primary.png",
    baseColor: Colors.green,
    quarterColor: Colors.brown.shade400,
    quiz: [
      Quiz(
        question: 'Which organ pumps blood through the body?',
        options: ['Lung', 'Heart', 'Brain', 'Liver'],
        answer: 'Heart',
      ),
      Quiz(
        question: 'What is the powerhouse of the cell?',
        options: ['Nucleus', 'Mitochondria', 'Ribosome', 'Chloroplast'],
        answer: 'Mitochondria',
      ),
      Quiz(
        question: 'Which vitamin is produced when skin is exposed to sunlight?',
        options: ['A', 'B', 'C', 'D'],
        answer: 'D',
      ),
      Quiz(
        question: 'Which organ helps in breathing?',
        options: ['Lungs', 'Heart', 'Liver', 'Kidney'],
        answer: 'Lungs',
      ),
      Quiz(
        question: 'Which part of plant conducts photosynthesis?',
        options: ['Root', 'Stem', 'Leaf', 'Flower'],
        answer: 'Leaf',
      ),
      Quiz(
        question: 'What is the largest organ in the human body?',
        options: ['Heart', 'Liver', 'Skin', 'Lung'],
        answer: 'Skin',
      ),
      Quiz(
        question: 'DNA stands for?',
        options: [
          'Deoxyribo Nucleic Acid',
          'Double Nucleic Acid',
          'Dense Nuclear Acid',
          'None',
        ],
        answer: 'Deoxyribo Nucleic Acid',
      ),
      Quiz(
        question: 'How many bones are in adult human body?',
        options: ['206', '210', '205', '200'],
        answer: '206',
      ),
      Quiz(
        question: 'Which blood cells fight infections?',
        options: ['RBC', 'WBC', 'Platelets', 'Plasma'],
        answer: 'WBC',
      ),
      Quiz(
        question: 'Which human sense organ detects light?',
        options: ['Ear', 'Eye', 'Nose', 'Skin'],
        answer: 'Eye',
      ),
    ],
  ),
  Subject(
    title: "Chemistry",
    image: "assets/chemistry_logo_secondary.png",
    imagePrimary: "assets/chemistry_logo_primary.png",
    baseColor: Colors.red.shade700,
    quarterColor: Colors.orange.shade100,
    quiz: [
      Quiz(
        question: 'What is the chemical symbol for water?',
        options: ['O2', 'H2O', 'CO2', 'HO'],
        answer: 'H2O',
      ),
      Quiz(
        question: 'Which gas is used in balloons?',
        options: ['Oxygen', 'Hydrogen', 'Helium', 'Nitrogen'],
        answer: 'Helium',
      ),
      Quiz(
        question: 'Atomic number of Carbon is?',
        options: ['6', '12', '14', '8'],
        answer: '6',
      ),
      Quiz(
        question: 'NaCl is commonly known as?',
        options: ['Baking Soda', 'Salt', 'Vinegar', 'Sugar'],
        answer: 'Salt',
      ),
      Quiz(
        question: 'Which acid is found in lemon?',
        options: ['Acetic acid', 'Citric acid', 'Sulfuric acid', 'Nitric acid'],
        answer: 'Citric acid',
      ),
      Quiz(
        question: 'pH value of neutral substance is?',
        options: ['0', '7', '14', '5'],
        answer: '7',
      ),
      Quiz(
        question: 'Which element is liquid at room temperature?',
        options: ['Gold', 'Mercury', 'Iron', 'Sodium'],
        answer: 'Mercury',
      ),
      Quiz(
        question: 'Symbol of Iron is?',
        options: ['I', 'Ir', 'Fe', 'In'],
        answer: 'Fe',
      ),
      Quiz(
        question: 'What is dry ice?',
        options: [
          'Solid oxygen',
          'Solid nitrogen',
          'Solid carbon dioxide',
          'Solid hydrogen',
        ],
        answer: 'Solid carbon dioxide',
      ),
      Quiz(
        question: 'What kind of bond is in water molecule?',
        options: ['Ionic', 'Hydrogen', 'Covalent', 'Metallic'],
        answer: 'Covalent',
      ),
    ],
  ),
  Subject(
    title: "Economy",
    image: "assets/economy_logo_secondary.png",
    imagePrimary: "assets/economy_logo_primary.png",
    baseColor: Colors.blue.shade900,
    quarterColor: Colors.yellow.shade600,
    quiz: [
      Quiz(
        question: 'What is GDP?',
        options: [
          'Gross Domestic Product',
          'Global Debt Policy',
          'General Demand Price',
          'Government Development Plan',
        ],
        answer: 'Gross Domestic Product',
      ),
      Quiz(
        question: 'What is the basic problem in economics?',
        options: ['Profit', 'Scarcity', 'Money', 'Inflation'],
        answer: 'Scarcity',
      ),
      Quiz(
        question: 'Who is known as the father of economics?',
        options: ['Adam Smith', 'Karl Marx', 'Keynes', 'Milton Friedman'],
        answer: 'Adam Smith',
      ),
      Quiz(
        question: 'Which is a direct tax?',
        options: ['VAT', 'Income Tax', 'Sales Tax', 'Excise Duty'],
        answer: 'Income Tax',
      ),
      Quiz(
        question: 'What is inflation?',
        options: [
          'Rise in production',
          'Rise in prices',
          'Fall in money supply',
          'Fall in demand',
        ],
        answer: 'Rise in prices',
      ),
      Quiz(
        question: 'What is barter system?',
        options: [
          'Trading with money',
          'Exchange of goods',
          'Use of gold',
          'Use of cheque',
        ],
        answer: 'Exchange of goods',
      ),
      Quiz(
        question: 'What does RBI stand for?',
        options: [
          'Reserve Bank of India',
          'Rural Bank of India',
          'Royal Bank of India',
          'Regional Bank of India',
        ],
        answer: 'Reserve Bank of India',
      ),
      Quiz(
        question: 'Demand curve usually slopes?',
        options: ['Upward', 'Downward', 'Vertical', 'Horizontal'],
        answer: 'Downward',
      ),
      Quiz(
        question: 'Which sector includes agriculture?',
        options: ['Primary', 'Secondary', 'Tertiary', 'Quaternary'],
        answer: 'Primary',
      ),
      Quiz(
        question: 'What is opportunity cost?',
        options: [
          'Extra cost',
          'Cost of next best alternative',
          'Fixed cost',
          'Sunk cost',
        ],
        answer: 'Cost of next best alternative',
      ),
    ],
  ),
  Subject(
    title: "Geography",
    image: "assets/geography_logo_secondary.png",
    imagePrimary: "assets/geography_logo_primary.png",
    baseColor: Colors.brown,
    quarterColor: Colors.yellow.shade600,
    quiz: [
      Quiz(
        question: 'What is the longest river in the world?',
        options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
        answer: 'Nile',
      ),
      Quiz(
        question: 'Which continent is the Sahara Desert located in?',
        options: ['Asia', 'Africa', 'Australia', 'Europe'],
        answer: 'Africa',
      ),
      Quiz(
        question: 'What is the capital of Japan?',
        options: ['Seoul', 'Beijing', 'Tokyo', 'Bangkok'],
        answer: 'Tokyo',
      ),
      Quiz(
        question: 'Which is the largest ocean?',
        options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
        answer: 'Pacific',
      ),
      Quiz(
        question: 'Mount Everest is located in?',
        options: ['India', 'Nepal', 'China', 'Bhutan'],
        answer: 'Nepal',
      ),
      Quiz(
        question: 'Which country has the most population?',
        options: ['India', 'USA', 'China', 'Brazil'],
        answer: 'China',
      ),
      Quiz(
        question: 'What is the smallest continent?',
        options: ['Europe', 'Australia', 'South America', 'Antarctica'],
        answer: 'Australia',
      ),
      Quiz(
        question:
            'What line divides the Earth into Northern and Southern Hemispheres?',
        options: [
          'Prime Meridian',
          'Equator',
          'Tropic of Cancer',
          'Arctic Circle',
        ],
        answer: 'Equator',
      ),
      Quiz(
        question: 'Which country is known as the Land of Thousand Lakes?',
        options: ['Sweden', 'Norway', 'Finland', 'Canada'],
        answer: 'Finland',
      ),
      Quiz(
        question: 'Which island is the largest in the world?',
        options: ['Borneo', 'Greenland', 'Madagascar', 'Sumatra'],
        answer: 'Greenland',
      ),
    ],
  ),
  Subject(
    title: "History",
    image: "assets/history_logo_secondary.png",
    imagePrimary: "assets/history_logo_secondary.png",
    baseColor: Colors.teal.shade700,
    quarterColor: Colors.green.shade300,
    quiz: [
      Quiz(
        question: 'Who was the first president of the United States?',
        options: [
          'Thomas Jefferson',
          'Abraham Lincoln',
          'George Washington',
          'John Adams',
        ],
        answer: 'George Washington',
      ),
      Quiz(
        question: 'In which year did World War II end?',
        options: ['1944', '1945', '1946', '1947'],
        answer: '1945',
      ),
      Quiz(
        question: 'Who was known as the Iron Lady?',
        options: [
          'Angela Merkel',
          'Indira Gandhi',
          'Margaret Thatcher',
          'Golda Meir',
        ],
        answer: 'Margaret Thatcher',
      ),
      Quiz(
        question: 'Which empire built the Colosseum?',
        options: ['Greek', 'Ottoman', 'Roman', 'Byzantine'],
        answer: 'Roman',
      ),
      Quiz(
        question: 'Who was the leader of Nazi Germany?',
        options: ['Mussolini', 'Hitler', 'Churchill', 'Stalin'],
        answer: 'Hitler',
      ),
      Quiz(
        question: 'Where did the Renaissance begin?',
        options: ['France', 'Germany', 'Italy', 'England'],
        answer: 'Italy',
      ),
      Quiz(
        question: 'Who discovered America in 1492?',
        options: ['Magellan', 'Columbus', 'Cook', 'Vasco da Gama'],
        answer: 'Columbus',
      ),
      Quiz(
        question: 'Who was the first human to travel in space?',
        options: [
          'Neil Armstrong',
          'Yuri Gagarin',
          'Buzz Aldrin',
          'Alan Shepard',
        ],
        answer: 'Yuri Gagarin',
      ),
      Quiz(
        question: 'Which wall fell in 1989?',
        options: [
          'China Wall',
          'Berlin Wall',
          'Jerusalem Wall',
          'Hadrian’s Wall',
        ],
        answer: 'Berlin Wall',
      ),
      Quiz(
        question: 'Who wrote the Communist Manifesto?',
        options: ['Karl Marx', 'Lenin', 'Trotsky', 'Mao Zedong'],
        answer: 'Karl Marx',
      ),
    ],
  ),
];
