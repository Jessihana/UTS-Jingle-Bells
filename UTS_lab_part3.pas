program MedStock;

var
  // Variabel Utama Menu & Kontrol
  pilihan: integer;                 // untuk menentukan pilihan program mana yang mau digunakan
  lanjutMenu: boolean;              // untuk menentukan dilanjutkan atau tidaknya program tersebut

  // Data Obat 1
  nama1: string;                    // nama obat
  stok1: integer;                   // jumlah stok obat yang tersedia
  harga1: real;                     // harga persatuan obat. Menggunakan tipe data 'real' in case di dunia nyata harga obat tidak bulat
  batas1: integer;                  // Batas aman stok obat

  // Data Obat 2
  nama2: string;
  stok2: integer;
  harga2: real;
  batas2: integer;

  // Data Obat 3
  nama3: string;
  stok3: integer;
  harga3: real;
  batas3: integer;

  // Variabel Transaksi dan Resep
  pilihObat, jumlahTransaksi: integer;          // Untuk memilih obat, Jumlah obat yang mau digunakan
  totalResep: real;                             // harga akhir obat
  lagiResep: char;                              // untuk menambahkan resep obat lain
  counter: integer;                             // hitung mundur 

  // Variabel Pembayaran Cash
  uangCash: real;                               // uang cash yang dikeluarkan pelanggan
  kembalian: real;                              // kembalian uang untuk pelanggan

begin

  // Inisialisasi Data Obat
  nama1 := 'Paracetamol 500mg';
  stok1 := 50;
  harga1 := 5000.0;
  batas1 := 10;

  nama2 := 'Amoxicillin 500mg';
  stok2 := 8;                                   // sengaja
  harga2 := 12000.0;
  batas2 := 15;

  nama3 := 'Antasida Doen';
  stok3 := 30;
  harga3 := 7500.0;
  batas3 := 10;

  lanjutMenu := true;

  // Perulangan Menu Utama
  repeat
    writeln('========================================');
    writeln('       MEDSTOCK: KLINIK & APOTEK        ');
    writeln('========================================');
    writeln('1. Catat Obat Masuk / Keluar');
    writeln('2. Lihat Daftar Stok & Cek Jumlah Stok');
    writeln('3. Kalkulasi Total Harga Tebus Resep');
    writeln('4. Keluar');
    write('Pilih menu (1-4): ');
    readln(pilihan);
    writeln('----------------------------------------');

    // MENU 1: Pencatatan Obat Masuk / Keluar
    if pilihan = 1 then
    begin
      writeln('--- PENCATATAN OBAT MASUK / KELUAR ---');
      writeln('Pilih nomor obat:');
      writeln('1. ', nama1);
      writeln('2. ', nama2);
      writeln('3. ', nama3);
      write('Masukkan pilihan nomor obat (1-3): ');
      readln(pilihObat);

      if (pilihObat >= 1) and (pilihObat <= 3) then
      begin
        writeln('1. Obat Masuk (Tambah)');
        writeln('2. Obat Keluar (Kurangi)');
        write('Pilih jenis transaksi (1/2): ');
        readln(pilihan);

        if (pilihan = 1) or (pilihan = 2) then
        begin
          write('Masukkan jumlah obat: ');
          readln(jumlahTransaksi);

          if jumlahTransaksi <= 0 then
            writeln('Jumlah obat harus lebih dari 0.')

          else if pilihan = 1 then
          begin
            if pilihObat = 1 then
              stok1 := stok1 + jumlahTransaksi
            else if pilihObat = 2 then
              stok2 := stok2 + jumlahTransaksi
            else
              stok3 := stok3 + jumlahTransaksi;

            writeln('Obat berhasil ditambahkan.');
          end

          else
          begin
            if pilihObat = 1 then
            begin
              if jumlahTransaksi <= stok1 then
              begin
                stok1 := stok1 - jumlahTransaksi;
                writeln('Sisa stok ', nama1, ': ', stok1);
              end
              else
                writeln('Gagal! Stok tidak mencukupi.');
            end

            else if pilihObat = 2 then
            begin
              if jumlahTransaksi <= stok2 then
              begin
                stok2 := stok2 - jumlahTransaksi;
                writeln('Sisa stok ', nama2, ': ', stok2);
              end
              else
                writeln('Gagal! Stok tidak mencukupi.');
            end

            else
            begin
              if jumlahTransaksi <= stok3 then
              begin
                stok3 := stok3 - jumlahTransaksi;
                writeln('Sisa stok ', nama3, ': ', stok3);
              end
              else
                writeln('Gagal! Stok tidak mencukupi.');
            end;
          end;
        end
        else
          writeln('Pilihan transaksi tidak valid.');
      end
      else
        writeln('Nomor obat tidak valid.');
    end

    // MENU 2: Melihat Stok dan Peringatan
    else if pilihan = 2 then
    begin
      writeln('--- DAFTAR STOK OBAT ---');

      write('1. ', nama1, ' | Stok: ', stok1,
            ' | Harga: Rp ', harga1:0:2);
      if stok1 <= batas1 then
        writeln(' [STOK MENIPIS!]')
      else
        writeln(' [Aman]');

      write('2. ', nama2, ' | Stok: ', stok2,
            ' | Harga: Rp ', harga2:0:2);
      if stok2 <= batas2 then
        writeln(' [STOK MENIPIS!]')
      else
        writeln(' [Aman]');

      write('3. ', nama3, ' | Stok: ', stok3,
            ' | Harga: Rp ', harga3:0:2);
      if stok3 <= batas3 then
        writeln(' [STOK MENIPIS!]')
      else
        writeln(' [Aman]');
    end

    // MENU 3: Menghitung Resep dan Pembayaran Cash
    else if pilihan = 3 then
    begin
      writeln('--- KALKULASI TOTAL HARGA TEBUS RESEP ---');

      totalResep := 0.0;
      lagiResep := 'y';

      repeat
        writeln;
        writeln('Daftar Obat:');
        writeln('1. ', nama1, ' | Stok: ', stok1,
                ' | Harga: Rp ', harga1:0:2);
        writeln('2. ', nama2, ' | Stok: ', stok2,
                ' | Harga: Rp ', harga2:0:2);
        writeln('3. ', nama3, ' | Stok: ', stok3,
                ' | Harga: Rp ', harga3:0:2);

        write('Pilih nomor obat (1-3): ');
        readln(pilihObat);

        write('Jumlah yang diminta: ');
        readln(jumlahTransaksi);

        if jumlahTransaksi <= 0 then
          writeln('Gagal! Jumlah harus lebih dari 0.')

        else if pilihObat = 1 then
        begin
          if jumlahTransaksi <= stok1 then
          begin
            totalResep := totalResep +
                          (harga1 * jumlahTransaksi);
            stok1 := stok1 - jumlahTransaksi;
            writeln('Obat berhasil ditambahkan ke resep.');
          end
          else
            writeln('Gagal! Stok Paracetamol tidak mencukupi.');
        end

        else if pilihObat = 2 then
        begin
          if jumlahTransaksi <= stok2 then
          begin
            totalResep := totalResep +
                          (harga2 * jumlahTransaksi);
            stok2 := stok2 - jumlahTransaksi;
            writeln('Obat berhasil ditambahkan ke resep.');
          end
          else
            writeln('Gagal! Stok Amoxicillin tidak mencukupi.');
        end

        else if pilihObat = 3 then
        begin
          if jumlahTransaksi <= stok3 then
          begin
            totalResep := totalResep +
                          (harga3 * jumlahTransaksi);
            stok3 := stok3 - jumlahTransaksi;
            writeln('Obat berhasil ditambahkan ke resep.');
          end
          else
            writeln('Gagal! Stok Antasida tidak mencukupi.');
        end

        else
          writeln('Pilihan obat tidak valid.');

        write('Tambah obat lain ke resep? (y/n): ');
        readln(lagiResep);

      until (lagiResep = 'n') or (lagiResep = 'N');

      writeln;
      writeln('----------------------------------------');
      writeln('TOTAL HARGA OBAT: Rp ', totalResep:0:2);

      // Pembayaran Cash
      write('Masukkan uang pembayaran cash: Rp ');
      readln(uangCash);

      if uangCash >= totalResep then
      begin
        kembalian := uangCash - totalResep;

        writeln('UANG PEMBAYARAN: Rp ', uangCash:0:2);
        writeln('TOTAL KEMBALIAN: Rp ', kembalian:0:2);
        writeln('Pembayaran berhasil!');
      end
      else
      begin
        writeln('Uang pembayaran tidak cukup!');
        writeln('Kekurangan: Rp ',
                (totalResep - uangCash):0:2);
      end;

      writeln('----------------------------------------');
    end

    // MENU 4: Keluar
    else if pilihan = 4 then
    begin
      writeln('Terima kasih telah menggunakan MedStock!');
      write('Keluar dalam hitungan: ');

      for counter := 3 downto 1 do
        write(counter, '.. ');

      writeln('Selesai.');
      lanjutMenu := false;
    end

    else
      writeln('Pilihan menu tidak valid.');

    writeln;

  until lanjutMenu = false;

end.