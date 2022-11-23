# Tugas Flutter
repo tugas
# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
bisa saja sebenarnya, tapi _model_ sangat berguna untuk mengelompokkan data-data terkait dalam satu _class_ sehingga adanya _model_ sangat meningkatkan _readability_.
## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
FutureBuilder - menjalankan fungsi _asynchronous_ dan menampilkan _widget_ berdasarkan _return_ yang didapat dari fungsi tersebut.
RichText - mirip seperti `Text` dengan fitur-fitur tambahan yang dapat digunakan untuk mengubah gaya teks.
TextSpan - merupakan _child_ dari RichText dan digunakan untuk membatasi pengubahan gaya pada rangkaian teks.
## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
pengambilan data berawal dari pemanggilan fungsi http.get. Data yang didapat dari pemanggilan fungsi itu akan disimpan dalam state (bentuknya Future). Lalu, data yang JSON tersebut akan di parse ke objek model. Terakhir, FutureBuilder akan merender data tersebut dengan widget yang bersesuaian.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Pertama, saya menambahkan tombol navigasi pada drawer/hamburger yang akan melakukan routing ke halaman mywatchlist. Lalu, saya perlu membuat sebuah file dart yang merupakan model untuk mywatchlist. Kemudian, saya membuat halaman mywatchlist yang berisi data-data watchlist yang ada pada endpoint JSON. Setelah itu, embuat navigasi 
Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut.
<br>
# tugas 8
## perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push()` mendorong rute yang diberikan ke tumpukan rute. sedangkan `Navigator.pushReplacement()` mengganti rute saat ini dengan mendorong rute yang diberikan dan kemudian membuang rute sebelumnya setelah rute baru selesai dianimasikan.
## _widget_ yang digunakan dalam program
Scaffold - mengimplementasikan struktur tata letak visual
Text - menampilkan string teks dengan satu baris
Column - menampilkan _children_ nya dalam larik vertikal
SingleChildScrollView - dapat menampung sebuah _widget_ yang dapat di-_scroll_
## jenis-jenis _event_ yang ada pada Flutter
onPressed, onLongPress, onHover, onFocusChange.
## cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Rute adalah abstraksi untuk "layar" atau "halaman" dari sebuah aplikasi, dan Navigator adalah _widget_ yang mengelola rute. Navigator menyimpan riwayat _child widgets_ berbasis _stack_. Navigator dapat _push_ dan _pop_ rute untuk membantu pengguna berpindah dari layar ke layar.
## cara mengimplementasikan tugas
pertama saya membuat, drawer dalam file terpisah agar bisa direferensikan berkali-kali dalam halaman lain tanpa menulis ulang kode yang digunakan. setelah itu, saya membuat model yang berkaitan dengan permintaan soal. kemudian, saya membuat form untuk menerima input. Langkah ini relatif mudah dilakukan karena saya hanya perlu menyusun beberapa _widget_ dari Flutter yang sudah siap digunakan. input yang diterima nantinya akan disimpan dalam model sebelumnya dan ditampilkan pada sebuah halaman khusus, yang juga disusun oleh _widget_ siap pakai dari Flutter.
<br>
# tugas 7
## _stateless widget_ dan _stateful widget_
_state_ adalah informasi yang dapat dibaca saat widget dibuat.
<br><br>
_stateless widget_ adalah _widget_ yang _state_ nya tidak dapat diubah setelah dibuat. perubahan pada variabel, tombol, atau data tidak dapat mengubah _state_ dari _widget_ tersebut.
<br><br>
_stateful widget_ adalah _widget_ yang _state_ nya dapat diubah setelah dibuat. _state_ dari _widget_ ini dapat diubah beberapa kali selama masa hidupnya.
<br><br>
_stateless widget_ berguna ketika bagian dari _user interface_ yang Anda buat tidak bergantung pada apa pun selain informasi konfigurasi sedangkan _stateful widget_ berguna ketika bagian dari _user interface_ yang Anda buat dapat berubah secara dinamis.
## widget yang digunakan dalam program
- MyApp (_custom widget_ yang meng-_extend_ _stateless widget_): merupakan widget root yang menampilkan keseluruhan aplikasi.
- ShowCount (_custom widget_ yang meng-_extend_ _stateless widget_): Berfungsi untuk menampilkan nilai _counter_. Widget ini memiliki _property_ berupa `counter` yang diberi dari _parent_ nya.
- MyHomePage (_custom widget_ yang meng-_extend_ _stateful widget_): berfungsi mengubah nilai dari _counter_ ketika ada _event_ berupa _onPressed_.
## Apa fungsi dari setState()?
pemanggilan setState() memberi tahu _framework_ bahwa keadaan internal objek ini telah berubah dan berkemungkinan memengaruhi _user interface_ dalam _subtree_ yang berkaitan. setelah pemanggilan tersebut Flutter membangun kembali widget yang berkaitan dan semua turunannya yang tentunya berarti Flutter harus me-_render_ ulang semuanya. Jika seluruh aplikasi Anda hanya berisi satu widget, maka widget ini akan dibangun kembali yang membuat aplikasi Anda lambat.
## perbedaan antara const dengan final
<b>const</b>:
Jika nilai yang Anda miliki dihitung saat _runtime_, contohnya `dateTime.now()`, maka Anda tidak dapat menggunakan const. Namun, jika nilainya diketahui pada waktu _compile_, contohnya `const num = 2;`, maka Anda dapat menggunakan const. perbedaan besar lainnya antara const dan final adalah _collection_ yang berupa _const_ memiliki semua anggota-anggotanya juga berupa _const_, tetapi _collection_ yang berupa _final_ belum tentu anggota-anggotanya juga berupa _final_.
<br><br>
<b>final:</b>
_final_ dapat digunakan jika Anda tidak tahu nilainya pada waktu _compile_ dan ingin nilainya dihitung/diambil saat _runtime_. Jika Anda menginginkan respons HTTP yang tidak dapat diubah, jika Anda ingin mendapatkan sesuatu dari database, atau jika Anda ingin membaca dari file lokal, gunakan _final_.
##  cara mengimplementasikan tugas
pada dasarnya saya hanya perlu membuat macam-macam _widget_ yang dibutuhkan dalam pengerjakan proyek Flutter ini. _widget-widget_ tersebut sebenarnya hanyalah _class_ yang mengandung _property_ dan _function_. jenis _function_ yang digunakan untuk menampilkan sesuatu pada layar adalah build(). selain itu, _widget-widget_ tersebut juga memiliki children yang bisa berupa tombol, graf, variabel, atau lainnya yang disusun dalam _subtree_. pada proyek ini tampilan _children_ dari _widget_ yang saya buat saya susun dalam stack().
