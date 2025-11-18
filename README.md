Football Shop - Flutter App

Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
   Widget tree adalah struktur hierarki dari semua widget yang ada dalam aplikasi Flutter. Setiap widget di Flutter adalah node dalam tree ini, dan widget dapat memiliki widget anak (child) atau beberapa widget anak (children). Hubungan parent-child artinya:
-  Parent: Widget yang menampung atau membungkus widget lain (misal: Column, Row, Scaffold).
-  Child: Widget yang berada di dalam parent dan menerima layout atau properti dari parent.
   Contoh:
   Column(
   children: [
   Text('Hello'),   // child
   Icon(Icons.star) // child
   ],
   )
   Di atas, Column adalah parent, Text dan Icon adalah children.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
-  MaterialApp: Root widget aplikasi, menyediakan tema, routing, dan banyak fitur Material Design.
-  Scaffold: Struktur dasar halaman, termasuk AppBar, body, dan floatingActionButton.
-  AppBar: Bagian atas halaman, biasanya berisi judul dan aksi.
-  Column & Row: Widget layout untuk menata children secara vertikal (Column) atau horizontal (Row).
-  Padding: Memberikan jarak internal di sekeliling widget.
-  Card: Widget berbentuk kartu dengan shadow dan elevation.
-  GridView.count: Menampilkan item dalam grid.
-  Text: Menampilkan teks.
-  Icon: Menampilkan ikon.
-  Material + InkWell: Memberikan efek klik dan interaksi pada item.
-  SnackBar: Menampilkan pesan pop-up sementara di bagian bawah layar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
   MaterialApp adalah widget root untuk aplikasi berbasis Material Design. Fungsinya:
-  Menyediakan tema (warna, font, dsb.) ke seluruh aplikasi.
-  Mengatur routing dan navigasi antar layar.
-  Menyediakan fitur bawaan seperti snackbar, dialog, dan scaffold messenger.
   Sering digunakan sebagai root karena hampir semua aplikasi Flutter berbasis Material memerlukan struktur dan tema konsisten.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
-  StatelessWidget: Widget yang tidak memiliki state internal dan tidak berubah sendiri. Contoh: Text, Icon.
-  StatefulWidget: Widget yang memiliki state dan dapat berubah saat runtime. Contoh: tombol yang menampilkan snackbar saat diklik.
   Pemilihan:
-  Gunakan StatelessWidget jika UI statis atau bergantung hanya pada input parent.
-  Gunakan StatefulWidget jika widget perlu merespon perubahan data, event, atau interaksi pengguna.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
   BuildContext adalah objek yang mereferensikan posisi widget di widget tree. Penting karena:
-  Digunakan untuk mengakses theme, media query, dan parent widget.
-  Diperlukan saat memanggil ScaffoldMessenger.of(context) untuk menampilkan snackbar.
   Di metode build(), BuildContext diberikan sebagai parameter otomatis agar widget tahu di mana ia berada di tree.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
-  Hot Reload: Memuat ulang perubahan kode tanpa mereset state aplikasi. Cocok untuk UI tweaks dan cepat testing.
-  Hot Restart: Memuat ulang seluruh aplikasi dari awal, state hilang. Cocok untuk perubahan di main() atau global state.

7.  Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.
    Untuk berpindah antar layar di Flutter:
-   Gunakan Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen())) untuk pindah ke layar baru.
-   Gunakan Navigator.pop(context) untuk kembali ke layar sebelumnya.

Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() 
- Fungsi ini menambahkan halaman (route) baru di atas halaman saat ini ke dalam stack navigasi.
- Halaman sebelumnya tetap ada di stack.
- Pengguna dapat kembali ke halaman sebelumnya menggunakan tombol Back (kembali) pada AppBar atau perangkat.

Navigator.pushReplacement() 
- Fungsi ini menggantikan halaman (route) saat ini dengan halaman baru di dalam stack navigasi.
- Halaman yang digantikan dihapus dari stack.
- Pengguna tidak dapat kembali ke halaman sebelumnya menggunakan tombol Back.

Penggunaan dalam Aplikasi Football Shop:
- Navigator.push() digunakan pada ItemCard di halaman utama (menu.dart) saat menekan tombol "Create Product". Ini memungkinkan pengguna untuk menekan tombol Back di ProductFormPage dan kembali ke halaman utama.
- Navigator.pushReplacement() digunakan di LeftDrawer (left_drawer.dart) saat memilih opsi Halaman Utama atau Tambah Produk. Ini adalah praktik terbaik untuk drawer karena mencegah penumpukan halaman yang sama berulang kali di stack navigasi, sehingga menekan tombol Back akan menutup aplikasi (atau kembali ke halaman sebelum drawer dibuka) alih-alih melewati banyak halaman yang sama.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Pemanfaatan Scaffold, AppBar, dan Drawer sangat krusial untuk membangun struktur halaman yang konsisten (consistent page structure) di seluruh aplikasi.

1. Scaffold: Berfungsi sebagai kanvas dasar untuk sebuah halaman (page) di Material Design. Semua widget struktural lainnya (AppBar, body, Drawer, dll.) adalah properti dari Scaffold. Ini memastikan setiap halaman memiliki struktur dasar yang sama.
- Contoh: Kedua halaman (MyHomePage dan ProductFormPage) menggunakan Scaffold sebagai root widget, menjamin konsistensi visual dan fungsionalitas.

2. AppBar: Menjamin semua halaman memiliki header yang konsisten. Dengan menempatkan title, warna, dan gaya teks yang sama pada AppBar di MyHomePage dan ProductFormPage, aplikasi mempertahankan identitas merek ('Football Shop') dan skema warna utama.

3. Drawer: Menyediakan panel navigasi global yang dapat diakses dari mana saja. Dengan membuat Drawer sebagai widget terpisah (LeftDrawer) dan menggunakannya kembali di Scaffold kedua halaman, saya memastikan menu navigasi utama (Halaman Utama dan Tambah Produk) dapat diakses secara konsisten dari setiap bagian aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Layout widget seperti Padding, SingleChildScrollView, dan ListView sangat penting dalam konteks desain antarmuka, terutama saat bekerja dengan form, karena meningkatkan keterbacaan dan kemudahan penggunaan (usability).

1. Padding:
- Kelebihan: Memberikan jarak yang memadai di sekitar elemen, mencegah widget saling menempel (cramping), dan meningkatkan keterbacaan. Ini membuat antarmuka terasa lebih bersih dan terstruktur.
- Contoh Penggunaan: Digunakan secara ekstensif di ProductFormPage di sekitar setiap TextFormField (const EdgeInsets.all(8.0)) untuk memisahkan input dan di MyHomePage untuk memberikan batas luar pada konten utama (const EdgeInsets.all(16.0)).

2. SingleChildScrollView:
- Kelebihan: Mencegah overflow piksel (kesalahan "Bottom overflowed by...") pada layar kecil atau ketika keyboard muncul. Ini memastikan pengguna dapat menggulir (scroll) dan mengakses semua elemen form, terlepas dari ukuran layar atau jumlah elemen form.
- Contoh Penggunaan: Digunakan sebagai wrapper di sekitar Column dalam ProductFormPage untuk memastikan form dapat di-scroll jika isinya melebihi tinggi layar.

3. ListView (atau GridView untuk tata letak 2D):
- Kelebihan: Efisien untuk menampilkan daftar elemen, dan ListView secara inheren dapat digulir. GridView digunakan untuk tata letak 2D yang rapi.
- Contoh Penggunaan:
- ListView digunakan di LeftDrawer untuk menyusun opsi navigasi (ListTile) secara vertikal dan memberikan fungsi gulir jika opsi bertambah.
- GridView.count digunakan di MyHomePage untuk menampilkan item menu (ItemCard) dalam tata letak kisi (grid) yang rapi, memanfaatkan ruang secara efisien.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema disesuaikan di file main.dart untuk memberikan identitas visual yang konsisten dengan brand toko:

// main.dart
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );

- primarySwatch: Colors.blue: Mengatur warna utama (primer) aplikasi menjadi biru. Warna ini secara otomatis digunakan oleh AppBar (di menu.dart dan productentry_form.dart) melalui Theme.of(context).colorScheme.primary. Warna biru sering dikaitkan dengan olahraga dan logo sepak bola, memberikan identitas yang relevan dengan "Football Shop".

- Warna Aksen Tambahan:
- Di LeftDrawer, DrawerHeader diberi warna Colors.indigo (biru tua) untuk memberikan kontras dan kesan profesional.
- Di ProductFormPage, tombol "Simpan" diberi warna Colors.indigo untuk menyorot aksi utama pada halaman form.
- Di ItemCard (product_card.dart), item menu diberi warna berbeda (Colors.blue, Colors.green, Colors.red) untuk membedakan fungsi (All Products, My Products, Create Product) sambil tetap menjaga latar belakang dan tekstur Material Design.

Tugas 9

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Kita perlu membuat model Dart untuk merepresentasikan struktur data JSON karena:
- Validasi tipe: Setiap field pada JSON dipetakan ke tipe Dart yang sesuai (String, int, bool, dll.). Ini membantu mencegah error runtime ketika data tidak sesuai tipe.
- Null-safety: Model memungkinkan kita menentukan field yang nullable atau required, sehingga lebih aman saat mengakses data.
- Maintainability: Dengan model, kode lebih mudah dibaca, di-maintain, dan di-refactor dibanding langsung menggunakan Map<String, dynamic> yang rentan typo atau salah akses key.

Konsekuensi jika langsung menggunakan Map<String, dynamic>:
- Tidak ada validasi tipe otomatis -> mudah terjadi runtime error.
- Null-safety sulit diterapkan -> sering harus cek null manual.
- Kode menjadi kurang jelas -> developer lain sulit memahami struktur data.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

- http: Digunakan untuk melakukan request HTTP standar (GET, POST, PUT, DELETE) ke backend Django, tapi tidak otomatis menangani cookie/session. Cocok untuk request stateless.
- CookieRequest: Mempermudah komunikasi dengan backend Django yang menggunakan session/cookie untuk autentikasi. Secara otomatis menyimpan dan mengirim cookie saat login, sehingga kita bisa tetap logged-in di berbagai request.

Perbedaan utama:
- http -> stateless, harus kelola cookie manual jika ingin autentikasi.
- CookieRequest -> stateful, otomatis menyimpan cookie, lebih cocok untuk aplikasi dengan login session.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

- Instance CookieRequest menyimpan state login dan cookie session.
- Dengan membagikannya (misal melalui Provider), semua widget di aplikasi bisa mengakses status login dan melakukan request ke backend tanpa membuat instance baru.
- Menghindari duplikasi dan inkonsistensi data session di berbagai halaman.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter bisa berkomunikasi dengan Django, diperlukan beberapa konfigurasi:
- 10.0.2.2 di ALLOWED_HOSTS
Saat menggunakan Android Emulator, localhost merujuk ke emulator, bukan komputer host.
10.0.2.2 menunjuk ke host PC dari emulator. Tanpa ini, request akan ditolak Django.
- Aktifkan CORS (Cross-Origin Resource Sharing)
Agar aplikasi Flutter (di browser atau emulator) bisa mengakses API Django tanpa ditolak karena policy origin berbeda.
- Pengaturan SameSite/Cookie
Agar cookie session bisa dikirim dari Flutter ke backend secara aman, terutama di Web dan emulator.
- Izin Internet di AndroidManifest.xml
Dibutuhkan untuk Flutter mobile agar bisa mengakses internet.

Jika konfigurasi ini tidak dilakukan:
- Request ke backend akan gagal (403, 404, atau CORS error).
- Login dan fetch data tidak berjalan.

5.  Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

- User mengisi form di Flutter (misal nama produk, harga).
- Flutter memvalidasi input (required, tipe data, format URL).
- Flutter mengirim data ke backend Django menggunakan CookieRequest.postJson().
- Django menerima JSON, memproses, menyimpan di database, dan mengembalikan response JSON.
- Flutter menerima response dan menampilkan notifikasi/success message.
- Jika berhasil, halaman Flutter bisa update otomatis menampilkan data baru (misal list produk).

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Register:
- User input username & password di Flutter.
- Flutter kirim data ke endpoint Django /auth/register/.
- Django validasi data, buat akun baru, dan return status.
- Flutter menampilkan notifikasi berhasil/failed.

Login:
- User input username & password di Flutter.
- Flutter kirim request ke /auth/login/ menggunakan CookieRequest.
- Django cek kredensial, set session cookie, dan return username + message.
- Flutter menyimpan session cookie otomatis melalui CookieRequest.
- User dialihkan ke halaman utama (MyHomePage).

Logout:
- Flutter memanggil endpoint /auth/logout/.
- Django menghapus session, cookie invalidated.
- Flutter kembali ke halaman login, session hilang.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- Membuat model Dart untuk tiap data JSON (Product, User).
- Membuat UI sesuai tema Socceria (pink pastel, pink tua, dark pink/purple).
- Membuat halaman login & register menggunakan CookieRequest.
- Membuat halaman CRUD produk dengan validasi form.
- Membuat drawer & navigasi untuk mempermudah user berpindah halaman.
- Menambahkan FutureBuilder & ListView untuk menampilkan list produk dari API.
- Testing koneksi antara Flutter dan Django (emulator + browser + Android).
- Memastikan state login konsisten di semua halaman dengan Provider<CookieRequest>.
- Memastikan semua warna, teks, dan tema konsisten di seluruh aplikasi.