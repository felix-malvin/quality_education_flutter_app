import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/models/badge_model.dart';

List<Course> courses = [
  Course(
    id: '1',
    image: 'assets/math_course_1.jpg',
    name: 'Mastering Math',
    category: 'Math',
    categoryBaseColor: 'FFC524',
    duration: '20h 10m',
    tutor: 'Budi Hartono',
    price: 160000,
    level: 'Beginner',
    rating: 4.9,
    totalRatings: 200,
    language: 'English',
    totalStudents: '5000+',
    isCertificate: true,
    description:
        'Welcome to Mastering Math, the best place to master mathematics effectively and enjoyably! \n\nWe understand that math is often seen as challenging and difficult. That’s why this course is here to help you grasp mathematical concepts easily, step by step, through interactive and structured learning methods',
    badges: [
      Badge(badgeName: 'Best seller', badgeColor: 'FFC524'),
      Badge(badgeName: 'Recommendation', badgeColor: '00B569'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction',
        duration: '45 minutes',
        lessons: ['Introduction to Math', 'Importance of Math in Life'],
      ),
      LessonSection(
        sectionTitle: 'Numbers',
        duration: '1h 30 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Fractions',
        duration: '1h 30 minutes',
        lessons: ['Understanding Fractions', 'Simplifying Fractions '],
      ),
      LessonSection(
        sectionTitle: 'Decimals',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Algebra',
        duration: '1h 30 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Geometry',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Ratios',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Measurement',
        duration: '1h 45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Graphs',
        duration: '1h 13 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Probability ',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
    ],
  ),
  Course(
    id: '2',
    image: 'assets/physics_course_1.jpg',
    name: 'Physics for Beginner',
    category: 'Physics',
    categoryBaseColor: '0A192F',
    duration: '15h 45m',
    tutor: 'Victor Dorian',
    price: 125000,
    level: 'Beginner',
    rating: 4.7,
    totalRatings: 150,
    language: 'English',
    totalStudents: '2800+',
    isCertificate: true,
    description:
        'Welcome to Physics for Beginner, the best place to master mathematics effectively and enjoyably! \n\nWe understand that math is often seen as challenging and difficult. That’s why this course is here to help you grasp mathematical concepts easily, step by step, through interactive and structured learning methods',
    badges: [
      Badge(badgeName: 'Beginner Friendly', badgeColor: '2196F3'),
      Badge(badgeName: 'Recommendation', badgeColor: '00B569'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Intro',
        duration: '45 minutes',
        lessons: ['What is Physics?', 'Why Physics Matters'],
      ),
      LessonSection(
        sectionTitle: 'Motion',
        duration: '1h 30 minutes',
        lessons: ['Types of Motion', 'Newton\'s Laws'],
      ),
      LessonSection(
        sectionTitle: 'Energy',
        duration: '1h 15 minutes',
        lessons: ['Work and Power', 'Energy Conservation'],
      ),
      LessonSection(
        sectionTitle: 'Waves',
        duration: '1h 10 minutes',
        lessons: ['Wave Basics', 'Sound Waves'],
      ),
      LessonSection(
        sectionTitle: 'Light',
        duration: '1h',
        lessons: ['Reflection and Refraction', 'Lenses and Mirrors'],
      ),
      LessonSection(
        sectionTitle: 'Electricity',
        duration: '1h 30 minutes',
        lessons: ['Electric Current', 'Magnetic Fields'],
      ),
      LessonSection(
        sectionTitle: 'Heat',
        duration: '1h',
        lessons: ['Temperature and Heat', 'Thermodynamics'],
      ),
      LessonSection(
        sectionTitle: 'Modern',
        duration: '1h 15 minutes',
        lessons: ['Quantum Basics', 'Nuclear Physics'],
      ),
      LessonSection(
        sectionTitle: 'Applied',
        duration: '45 minutes',
        lessons: ['Physics in Devices', 'Technology and Innovation'],
      ),
    ],
  ),
  Course(
    id: '3',
    image: 'assets/chemistry_course_1.jpg',
    name: 'Fundamentals of Chemistry',
    category: 'Chemistry',
    categoryBaseColor: 'FF6F61',
    duration: '18h 45m',
    tutor: 'Dr. Ratna Lestari',
    price: 175000,
    level: 'Beginner',
    rating: 4.8,
    totalRatings: 150,
    language: 'English',
    totalStudents: '3200+',
    isCertificate: true,
    description:
        'Explore the exciting world of atoms, molecules, and reactions in this beginner-friendly chemistry course. Learn through practical examples and engaging visuals to build a solid understanding of chemical principles.',
    badges: [
      Badge(badgeName: 'Recommended', badgeColor: '00B569'),
      Badge(badgeName: 'New', badgeColor: 'FF6F61'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction',
        duration: '30 minutes',
        lessons: ['Welcome to Chemistry', 'Course Overview'],
      ),
      LessonSection(
        sectionTitle: 'Atomic Structure',
        duration: '1h 30 minutes',
        lessons: ['Atoms and Elements', 'Electron Configuration'],
      ),
      LessonSection(
        sectionTitle: 'Chemical Bonds',
        duration: '1h 45 minutes',
        lessons: ['Ionic and Covalent Bonds', 'Bond Polarity'],
      ),
      LessonSection(
        sectionTitle: 'Stoichiometry',
        duration: '2h 00 minutes',
        lessons: ['Mole Concept', 'Balancing Equations'],
      ),
      LessonSection(
        sectionTitle: 'Acids and Bases',
        duration: '1h 20 minutes',
        lessons: ['pH Scale', 'Neutralization Reactions'],
      ),
    ],
  ),
  Course(
    id: '4',
    image: 'assets/biology_course_1.jpg',
    name: 'Principles of Economics',
    category: 'Economy',
    categoryBaseColor: '4CAF50',
    duration: '22h 30m',
    tutor: 'Andi Wijaya, SE',
    price: 180000,
    level: 'Intermediate',
    rating: 4.7,
    totalRatings: 180,
    language: 'English',
    totalStudents: '4100+',
    isCertificate: true,
    description:
        'Understand the fundamental concepts of micro and macroeconomics, market structures, and policy-making. Ideal for students and professionals aiming to build a solid foundation in economic thinking.',
    badges: [
      Badge(badgeName: 'Popular Choice', badgeColor: 'FFC524'),
      Badge(badgeName: 'New', badgeColor: 'FF6F61'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction to Economics',
        duration: '45 minutes',
        lessons: ['What is Economics?', 'Types of Economic Systems'],
      ),
      LessonSection(
        sectionTitle: 'Supply and Demand',
        duration: '1h 15 minutes',
        lessons: ['Market Mechanism', 'Price Elasticity'],
      ),
      LessonSection(
        sectionTitle: 'Macroeconomics',
        duration: '2h 00 minutes',
        lessons: ['GDP and Inflation', 'Monetary Policy'],
      ),
      LessonSection(
        sectionTitle: 'Microeconomics',
        duration: '1h 40 minutes',
        lessons: ['Consumer Behavior', 'Cost Structures'],
      ),
      LessonSection(
        sectionTitle: 'Market Structures',
        duration: '1h 10 minutes',
        lessons: ['Perfect Competition', 'Monopoly and Oligopoly'],
      ),
    ],
  ),
  Course(
    id: '5',
    image: 'assets/biology_course_1.jpg',
    name: 'Intro to Human Biology',
    category: 'Biology',
    categoryBaseColor: '8BC34A',
    duration: '19h 20m',
    tutor: 'Dr. Tania Rahmawati',
    price: 170000,
    level: 'Beginner',
    rating: 4.7,
    totalRatings: 140,
    language: 'English',
    totalStudents: '3500+',
    isCertificate: true,
    description:
        'This course covers the basics of human anatomy, cell biology, and organ systems. Perfect for beginners looking to understand how the human body functions in a simple and interactive format.',
    badges: [
      Badge(badgeName: 'Student Favorite', badgeColor: '00B569'),
      Badge(badgeName: 'New', badgeColor: 'FF6F61'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction',
        duration: '35 minutes',
        lessons: ['Biology Overview', 'Scientific Tools'],
      ),
      LessonSection(
        sectionTitle: 'Cell Biology',
        duration: '1h 15 minutes',
        lessons: ['Cell Structure', 'Cell Functions'],
      ),
      LessonSection(
        sectionTitle: 'Human Anatomy',
        duration: '2h 00 minutes',
        lessons: ['Skeletal System', 'Muscular System'],
      ),
      LessonSection(
        sectionTitle: 'Organ Systems',
        duration: '1h 50 minutes',
        lessons: ['Circulatory System', 'Digestive System'],
      ),
      LessonSection(
        sectionTitle: 'Genetics and DNA',
        duration: '1h 20 minutes',
        lessons: ['DNA Basics', 'Inheritance'],
      ),
    ],
  ),
  Course(
    id: '6',
    image: 'assets/biology_course_1.jpg',
    name: 'Introduction to AI & Machine Learning',
    category: 'Technology',
    categoryBaseColor: '009688',
    duration: '24h 00m',
    tutor: 'Rizky Pratama, M.Kom',
    price: 200000,
    level: 'Intermediate',
    rating: 4.9,
    totalRatings: 210,
    language: 'English',
    totalStudents: '5800+',
    isCertificate: true,
    description:
        'Discover the fundamentals of Artificial Intelligence and Machine Learning. Learn how machines learn from data and how AI is transforming various industries through hands-on exercises and projects.',
    badges: [
      Badge(badgeName: 'Top Rated', badgeColor: 'FFC524'),
      Badge(badgeName: 'Trending', badgeColor: '00B569'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction to AI',
        duration: '45 minutes',
        lessons: ['History of AI', 'AI Today'],
      ),
      LessonSection(
        sectionTitle: 'Types of Machine Learning',
        duration: '1h 30 minutes',
        lessons: ['Supervised vs Unsupervised', 'Reinforcement Learning'],
      ),
      LessonSection(
        sectionTitle: 'Data Preparation',
        duration: '1h 45 minutes',
        lessons: ['Data Cleaning', 'Feature Engineering'],
      ),
      LessonSection(
        sectionTitle: 'Modeling & Evaluation',
        duration: '2h 00 minutes',
        lessons: ['Training Models', 'Evaluation Metrics'],
      ),
      LessonSection(
        sectionTitle: 'Real-World Applications',
        duration: '1h 30 minutes',
        lessons: ['AI in Healthcare', 'AI in Finance'],
      ),
    ],
  ),
];