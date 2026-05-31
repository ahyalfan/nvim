Macro di Neovim sangat berguna kalau kamu melakukan **serangkaian edit yang sama berulang-ulang**.

## Dasar Macro

### Rekam macro

Tekan:

```vim
qa
```

Artinya:

- `q` = mulai rekam macro
- `a` = simpan ke register `a`

Lalu lakukan edit yang diinginkan.

Setelah selesai:

```vim
q
```

untuk menghentikan rekaman.

### Jalankan macro

```vim
@a
```

Jalankan macro yang disimpan di register `a`.

Untuk mengulang 10 kali:

```vim
10@a
```

---

## Contoh 1: Menambahkan koma di akhir setiap baris

Awal:

```text
apple
orange
mango
banana
```

Posisikan kursor di `apple`.

Rekam:

```vim
qa
A,<Esc>
j
q
```

Penjelasan:

- `A` → ke akhir baris dan insert
- `,` → tambahkan koma
- `<Esc>` → keluar insert mode
- `j` → turun ke baris berikutnya

Sekarang jalankan:

```vim
3@a
```

Hasil:

```text
apple,
orange,
mango,
banana,
```

---

## Contoh 2: Mengubah daftar menjadi string JavaScript

Awal:

```text
apple
orange
mango
```

Ingin jadi:

```javascript
"apple",
"orange",
"mango",
```

Rekam:

```vim
qa
I"<Esc>
A",<Esc>
j
q
```

Lalu:

```vim
2@a
```

Hasil:

```javascript
"apple",
"orange",
"mango",
```

---

## Contoh 3: Membuat objek dari daftar

Awal:

```text
name
email
phone
```

Menjadi:

```javascript
name: "",
email: "",
phone: "",
```

Rekam:

```vim
qa
A: "",<Esc>
j
q
```

Lalu:

```vim
2@a
```

---

## Trik keren: Jalankan macro sampai gagal

Misalnya macro selalu berakhir dengan `j` (turun satu baris).

Daripada menghitung jumlah baris:

```vim
999@a
```

Neovim akan berhenti sendiri ketika macro tidak bisa dijalankan lagi (misalnya sudah di baris terakhir).

---

## Melihat isi macro

Untuk melihat isi register `a`:

```vim
:reg a
```

atau

```vim
:registers
```

---

Macro jadi sangat kuat kalau digabung dengan:

- `/pattern` (search)
- `f`, `t` (lompat ke karakter)
- `ciw`, `caw` (ubah kata)
- `.` (repeat last change)
