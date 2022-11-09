# Tugas Flutter
repo tugas

# tugas 7
## _stateless widget_ dan _stateful widget_
_state_ adalah informasi yang dapat dibaca saat widget dibuat.
<br><br>
_stateless widget_ adalah _widget_ yang _state_ nya tidak dapat diubah setelah dibuat. perubahan pada variabel, tombol, atau data tidak dapat mengubah _state_ dari _widget_ tersebut.
<br><br>
_stateful widget_ adalah _widget_ yang _state_ nya dapat diubah setelah dibuat. _state_ dari _widget_ ini dapat diubah beberapa kali selama masa hidupnya.
<br><br>
_stateless widget_ berguna ketika bagian dari _user interface_ yang Anda buat tidak bergantung pada apa pun selain informasi konfigurasi sedangkan _stateful berguna ketika bagian dari _user interface_ yang Anda buat dapat berubah secara dinamis.
## widget yang digunakan dalam program
-
## Apa fungsi dari setState()?
pemanggilan setState() memberi tahu _framework_ bahwa keadaan internal objek ini telah berubah dan berkemungkinan memengaruhi _user interface_ dalam _subtree_ yang berkaitan. setelah pemanggilan tersebut Flutter membangun kembali widget yang berkaitan dan semua turunannya yang tentunya berarti Flutter harus me-_render_ ulang semuanya. Jika seluruh aplikasi Anda hanya berisi satu widget, maka widget ini akan dibangun kembali yang membuat aplikasi Anda lambat.
## perbedaan antara const dengan final
<b>const</b>:
Jika nilai yang Anda miliki dihitung saat _runtime_, contohnya `dateTime.now()`, maka Anda tidak dapat menggunakan const. Namun, jika nilainya diketahui pada waktu _compile_, contohnya `const num = 2;`, maka Anda dapat menggunakan const. perbedaan besar lainnya antara const dan final adalah _collection_ yang berupa _const_ memiliki semua anggota-anggotanya juga berupa _const_, tetapi _collection_ yang berupa _final_ belum tentu anggota-anggotanya juga berupa _final_.
<br><br>
<b>final:</b>
_final_ dapat digunakan jika Anda tidak tahu nilainya pada waktu _compile_ dan ingin nilainya dihitung/diambil saat _runtime_. Jika Anda menginginkan respons HTTP yang tidak dapat diubah, jika Anda ingin mendapatkan sesuatu dari database, atau jika Anda ingin membaca dari file lokal, gunakan _final_.
##  cara mengimplementasikan tugas
