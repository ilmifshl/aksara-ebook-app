class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Selamat datang di Aksara",
    image: "lib/assets/onboarding_1.png",
    desc: "Temukan dunia pengetahuan melalui ribuan judul dengan sentuhan jari Anda di toko buku digital kami.",
  ),
  OnboardingContents(
    title: "Baca Buku Di Mana Saja",
    image: "lib/assets/onboarding_2.png",
    desc:
    "Nikmati momen pribadi Anda dengan membaca di mana saja dan kapan saja dengan akses ke berbagai genre dan penulis terkenal",
  ),
  OnboardingContents(
    title: "Mulai Cari Buku Favoritmu Sekarang",
    image: "lib/assets/onboarding_3.png",
    desc:
    "Dalam dunia kata-kata, setiap halaman adalah jendela ke dunia yang baru dan tak terbatas",
  ),
];