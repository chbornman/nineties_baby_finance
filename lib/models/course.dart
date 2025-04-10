class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int durationMinutes;
  final List<String> topics;

  Course({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl = '',
    required this.durationMinutes,
    required this.topics,
  });
}

// Sample courses for young professionals
final List<Course> sampleCourses = [
  Course(
    id: 'employer_match',
    title: '401(k) Employer Match',
    description: 'Learn how to maximize your employer\'s 401(k) match and why it\'s essentially free money.',
    durationMinutes: 15,
    topics: ['Retirement', 'Investing', 'Employee Benefits'],
  ),
  Course(
    id: 'interest_rates',
    title: 'Understanding Interest Rates',
    description: 'How interest rates affect your loans, savings, and investment decisions.',
    durationMinutes: 20,
    topics: ['Personal Finance', 'Loans', 'Savings'],
  ),
  Course(
    id: 'student_loans',
    title: 'Tackling Student Loan Debt',
    description: 'Strategies for efficiently paying off student loans while building wealth.',
    durationMinutes: 25,
    topics: ['Debt Management', 'Student Loans', 'Financial Planning'],
  ),
  Course(
    id: 'first_home',
    title: 'Buying Your First Home',
    description: 'Everything you need to know about mortgages, down payments, and the home buying process.',
    durationMinutes: 30,
    topics: ['Real Estate', 'Mortgages', 'Investing'],
  ),
  Course(
    id: 'emergency_fund',
    title: 'Building an Emergency Fund',
    description: 'How to create a financial safety net and where to keep your emergency savings.',
    durationMinutes: 10,
    topics: ['Savings', 'Financial Security', 'Budgeting'],
  ),
  Course(
    id: 'tax_optimization',
    title: 'Tax Optimization Strategies',
    description: 'Legal ways to minimize your tax burden and make the most of tax-advantaged accounts.',
    durationMinutes: 25,
    topics: ['Taxes', 'Investing', 'Financial Planning'],
  ),
  Course(
    id: 'salary_negotiation',
    title: 'Salary Negotiation',
    description: 'Techniques to maximize your compensation and benefits when starting a new job or asking for a raise.',
    durationMinutes: 20,
    topics: ['Career', 'Negotiation', 'Income'],
  ),
  Course(
    id: 'investing_basics',
    title: 'Investing Basics for Millennials',
    description: 'Start your investing journey with the fundamentals of stocks, bonds, and index funds.',
    durationMinutes: 30,
    topics: ['Investing', 'Stocks', 'Personal Finance'],
  ),
];