import 'package:flutter/material.dart';

// ==========================================
// 1. Models
// ==========================================

class CategoryItem {
  final List<Color> gradientColors;
  final IconData icon;

  const CategoryItem({required this.gradientColors, required this.icon});
}

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String imageUrl;

  const Doctor({
    required this.name,
    this.specialty = '',
    this.rating = 0.0,
    required this.imageUrl,
  });
}

// ==========================================
// 2. Main Screen
// ==========================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<CategoryItem> _categories = [
    CategoryItem(
      gradientColors: [Color(0xFF2753F3), Color(0xFF765AFC)],
      icon: Icons.favorite_border,
    ),
    CategoryItem(
      gradientColors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
      icon: Icons.local_hospital_outlined,
    ),
    CategoryItem(
      gradientColors: [Color(0xFFFD7F43), Color(0xFFFFCF68)],
      icon: Icons.remove_red_eye_outlined,
    ),
    CategoryItem(
      gradientColors: [Color(0xFFFF484C), Color(0xFFFF6C60)],
      icon: Icons.medical_services_outlined,
    ),
  ];

  static const List<Doctor> _popularDoctors = [
    Doctor(
      name: 'Dr. Fillerup Grab',
      specialty: 'Medicine Specialist',
      imageUrl: 'https://placehold.co/190x180',
    ),
    Doctor(
      name: 'Dr. Blessing',
      specialty: 'Dentist Specialist',
      imageUrl: 'https://placehold.co/190x180',
    ),
  ];

  static const List<Doctor> _topRatedDoctors = [
    Doctor(
      name: 'Dr. Crick',
      rating: 3.7,
      imageUrl: 'https://placehold.co/55x56',
    ),
    Doctor(
      name: 'Dr. Strain',
      rating: 3.0,
      imageUrl: 'https://placehold.co/55x56',
    ),
    Doctor(
      name: 'Dr. Lachinet',
      rating: 2.9,
      imageUrl: 'https://placehold.co/55x56',
    ),
    Doctor(
      name: 'Dr. Crick',
      rating: 3.0,
      imageUrl: 'https://placehold.co/55x56',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HomeHeader(),
            const SizedBox(height: 24),
            _buildCategorySection(),
            const SizedBox(height: 24),
            _buildPopularDoctorsSection(),
            const SizedBox(height: 24),
            _buildTopRatedDoctorsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 14),
        itemBuilder: (context, index) =>
            CategoryCard(category: _categories[index]),
      ),
    );
  }

  Widget _buildPopularDoctorsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(title: 'Popular Doctor', onSeeAllPressed: () {}),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 264,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _popularDoctors.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) =>
                PopularDoctorCard(doctor: _popularDoctors[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildTopRatedDoctorsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: 'Top Rated Doctors',
            onSeeAllPressed: () {},
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 134,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _topRatedDoctors.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) =>
                TopRatedDoctorCard(doctor: _topRatedDoctors[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0EBE7E),
        unselectedItemColor: const Color(0xFF677294),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. Extracted Widgets
// ==========================================

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 52, 20, 48),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Handwerker!',
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Find Your Doctor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              ClipOval(
                child: Image.network(
                  'https://placehold.co/60x60',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: -24,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Color(0xFF677294), fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Color(0xFF677294)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onSeeAllPressed,
          child: const Text(
            'See all',
            style: TextStyle(
              color: Color(0xFF677294),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: category.gradientColors,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Icon(category.icon, color: Colors.white, size: 32)),
    );
  }
}

class PopularDoctorCard extends StatelessWidget {
  final Doctor doctor;

  const PopularDoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              doctor.imageUrl,
              width: 190,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            doctor.name,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            doctor.specialty,
            style: const TextStyle(
              color: Color(0xCC677294),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class TopRatedDoctorCard extends StatelessWidget {
  final Doctor doctor;

  const TopRatedDoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.star, size: 12, color: Colors.amber),
              const SizedBox(width: 2),
              Text(
                doctor.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipOval(
            child: Image.network(
              doctor.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            doctor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
