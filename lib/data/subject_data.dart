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
];