program MedStock;
uses crt;

var
  // Variabel Utama Menu & Kontrol
  pilihan: integer;
  lanjutMenu: boolean;
  
  // Data Obat 1
  nama1: string;
  stok1: integer;
  harga1: real;
  batas1: integer;

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

  // Variabel Bantu Transaksi / Resep
  cariNama: string;
  pilihObat, jumlahTransaksi: integer;
  totalResep: real;
  lagiResep: char;
  counter: integer; // untuk contoh perulangan for

begin
clrscr;
  // Inisialisasi Data Obat 1, 2, dan 3
  nama1 := 'Paracetamol 500mg';
  stok1 := 50;
  harga1 := 5000.0;
  batas1 := 10;

  nama2 := 'Amoxicillin 500mg';
  stok2 := 8;                       // Stok di bawah batas minimum (Sengaja)
  harga2 := 12000.0;
  batas2 := 15;

  nama3 := 'Antasida Doen';
  stok3 := 30;
  harga3 := 7500.0;
  batas3 := 10;

  lanjutMenu := true;

  // Perulangan Utama menggunakan REPEAT-UNTIL
  repeat
    writeln('========================================');
    writeln('       MEDSTOCK: KLINIK & APOTEK        ');
    writeln('========================================');
    writeln('1. Catat Obat Masuk / Keluar');
    writeln('2. Lihat Daftar Stok & Cek Jumlah Stok Obat');
    writeln('3. Kalkulasi Total Harga Tebus Resep');
    writeln('4. Keluar');
    write('Pilih menu (1-4): ');
    readln(pilihan);
    writeln('----------------------------------------');

    // Percabangan menggunakan IF-THEN
    if pilihan = 1 then
    begin
      writeln('--- PENCATATAN OBAT MASUK / KELUAR ---');
      writeln('Pilih nomor obat yang ingin diubah:');
      writeln('1. ', nama1);
      writeln('2. ', nama2);
      writeln('3. ', nama3);
      write('Masukkan pilihan nomor obat (1-3): ');
      readln(pilihObat);

      if (pilihObat >= 1) and (pilihObat <= 3) then
      begin
        writeln('Pilih jenis transaksi:');
        writeln('1. Obat Masuk (Tambah)');
        writeln('2. Obat Keluar (Kurangi)');
        write('Pilihan (1/2): ');
        readln(pilihan); // Menggunakan variabel pilihan sementara

        if pilihan = 1 then
        begin
          write('Masukkan jumlah obat masuk: ');
          readln(jumlahTransaksi);
          
          // Percabangan IF-THEN untuk menentukan variabel mana yang ditambah
          if pilihObat = 1 then
          begin
            stok1 := stok1 + jumlahTransaksi;
            writeln('Berhasil! Stok baru ', nama1, ': ', stok1);
          end
          else if pilihObat = 2 then
          begin
            stok2 := stok2 + jumlahTransaksi;
            writeln('Berhasil! Stok baru ', nama2, ': ', stok2);
          end
          else if pilihObat = 3 then
          begin
            stok3 := stok3 + jumlahTransaksi;
            writeln('Berhasil! Stok baru ', nama3, ': ', stok3);
          end;
        end
        else if pilihan = 2 then
        begin
          write('Masukkan jumlah obat keluar: ');
          readln(jumlahTransaksi);

          // Pengecekan stok cukup atau tidak menggunakan IF-THEN
          if pilihObat = 1 then
          begin
            if jumlahTransaksi <= stok1 then
            begin
              stok1 := stok1 - jumlahTransaksi;
              writeln('Berhasil! Sisa stok ', nama1, ': ', stok1);
            end
            else
              writeln('Gagal! Stok tidak mencukupi.');
          end
          else if pilihObat = 2 then
          begin
            if jumlahTransaksi <= stok2 then
            begin
              stok2 := stok2 - jumlahTransaksi;
              writeln('Berhasil! Sisa stok ', nama2, ': ', stok2);
            end
            else
              writeln('Gagal! Stok tidak mencukupi.');
          end
          else if pilihObat = 3 then
          begin
            if jumlahTransaksi <= stok3 then
            begin
              stok3 := stok3 - jumlahTransaksi;
              writeln('Berhasil! Sisa stok ', nama3, ': ', stok3);
            end
            else
              writeln('Gagal! Stok tidak mencukupi.');
          end;
        end
        else
        begin
          writeln('Pilihan transaksi tidak valid.');
        end;

      end
      else
      begin
        writeln('Nomor obat tidak valid.');
      end;

    end
    
    else if pilihan = 2 then
    begin
      writeln('--- DAFTAR STOK & PERINGATAN OBAT MENIPIS ---');
      
      // Menampilkan obat 1
      write('1. ', nama1, ' | Stok: ', stok1, ' | Harga: Rp  ', harga1:0:2);
      if stok1 <= batas1 then
        writeln(' [STATUS: STOK MENIPIS!]')
      else
        writeln(' [STATUS: Aman]');

      // Menampilkan obat 2
      write('2. ', nama2, ' | Stok: ', stok2, ' | Harga: Rp ', harga2:0:2);
      if stok2 <= batas2 then
        writeln(' [STATUS: STOK MENIPIS!]')
      else
        writeln(' [STATUS: Aman]');

      // Menampilkan obat 3
      write('3. ', nama3, '     | Stok: ', stok3, ' | Harga: Rp  ', harga3:0:2);
      if stok3 <= batas3 then
        writeln(' [STATUS: STOK MENIPIS!]')
      else
        writeln(' [STATUS: Aman]');

    end
    
    else if pilihan = 3 then
    begin
      writeln('--- KALKULASI TOTAL HARGA TEBUS RESEP ---');
      totalResep := 0.0;
      lagiResep := 'y';

      // Perulangan REPEAT-UNTIL untuk resep
      repeat
        writeln('Daftar obat: 1. Paracetamol | 2. Amoxicillin | 3. Antasida');
        write('Pilih nomor obat yang diresepkan (1-3): ');
        readln(pilihObat);
        
        write('Jumlah yang diminta: ');
        readln(jumlahTransaksi);

        // Kalkulasi harga menggunakan IF-THEN
        if pilihObat = 1 then
          totalResep := totalResep + (harga1 * jumlahTransaksi)
        else if pilihObat = 2 then
          totalResep := totalResep + (harga2 * jumlahTransaksi)
        else if pilihObat = 3 then
          totalResep := totalResep + (harga3 * jumlahTransaksi)
        else
          writeln('Pilihan obat tidak valid, subtotal tidak dihitung.');

        write('Tambah obat lain ke resep? (y/n): ');
        readln(lagiResep);
      until (lagiResep = 'n') or (lagiResep = 'N');

      writeln('----------------------------------------');
      writeln('TOTAL HARGA TEBUS RESEP: Rp ', totalResep:0:2);
      writeln('----------------------------------------');

    end
    
    else if pilihan = 4 then
    begin
      writeln('Terima kasih telah menggunakan MedStock!');
      
      // Contoh penggunaan perulangan FOR sederhana
      write('Keluar dalam hitungan: ');
      for counter := 3 downto 1 do
      begin
        write(counter, '.. ');
      end;
      writeln('Selesai.');

      lanjutMenu := false;
    end
    
    else
    begin
      writeln('Pilihan menu tidak valid.');
    end;

    writeln;
  until lanjutMenu = false;

end.