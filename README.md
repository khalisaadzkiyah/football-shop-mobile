Football Shop - Flutter App
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
