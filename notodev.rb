notlar = [
    ['Ahmet', 50, 60], ['Mehmet', 60, 90],
    ['Temel', 70, 20], ['Dursun', 0, 100],
    ['Fadime', 100, 100], ['Zeynep', 30, 30], ['Doğukan', 60, 49], ['Aliemre', 40, 60]
] #2 farklı öğrenci ekleyerek olabilecek sıkıntılara baktım

puts "Verilen öğrenciler ve notları #{notlar}"
puts "-----------------------------------------------------------"

VIZESABITI = 0.4
FINALSABITI = 0.6
FINALGECIS = 50
ORTGECIS = 60
canaraligi = [20, 80]
DIREKGECIS = 60
GECIS = 40
donemsonu = [] #ogrencileri ortalamalarınıyla beraber sıralamak için
toplamnot = 0 #genel ortalama için
cantoplam = 0 #can ortalama icin

sonnot = notlar.map {|ogrenci| ogrenci[1] * VIZESABITI + ogrenci[2] * FINALSABITI}

notlar.each.with_index do |ogrenci, i| #öğrencileri ve donem notlarını bir araya alıyorum
    donemsonu << [ogrenci.first]
    donemsonu[i] << sonnot[i]
end

sonnot.each do |notu|
    toplamnot = toplamnot + notu
end

genelort = toplamnot / sonnot.size

puts "Öğrencilerin dönem sonu ortalamaları #{donemsonu}"
puts "-----------------------------------------------------------"

canagiren = donemsonu.select {|ogrenci| canaraligi.first < ogrenci[1] && ogrenci[1] < canaraligi.last } #can aralığını önceden dizi olarak kaydetmiştim.

puts "Çana giren öğrenciler #{canagiren}"
puts "-----------------------------------------------------------"

canagiren.each do |foo|
    cantoplam = foo[1] + cantoplam
end

canort = cantoplam / canagiren.size

donemsonu.each.with_index do |final, i|  #Bunu yapmamın sebebi ortalamalarla finalleri birlikte tutup işi kolaylaştırmak
    final << notlar[i].last
end

gecen = donemsonu.select { |ogrenci| ogrenci.last >= FINALGECIS && (ogrenci[1] >= ORTGECIS || (ogrenci[1] >= GECIS && ogrenci[1] > canort)) }
#yukarda öğrencilerin gecme şartlarını yazdım

gecen.each do |ogrenci|
    puts "#{ogrenci.first} isimli öğrenci #{ogrenci[1]} Not ortalamasıyla  dersi geçmiştir."
end

yuzde = gecen.size * 100 / notlar.size

puts "-----------------------------------------------------------"
puts "- Toplam Öğrenci Sayısı: #{notlar.size}"
puts "-"
puts "- Geçen Öğrenci Sayısı: #{gecen.size}"
puts "-"
puts "- Genel Sınıf Ortalaması: #{genelort.round(1)}" #roundları normalde işlemedik ama sayılar virgüllü çok uzun duruyor diye koydum.
puts "-"
puts "- Çana Girenlerin Ortalaması: #{canort.round(1)}"
puts "-"
puts "- Geçenlerin Yüzdesi %#{yuzde}"


#Hocanın denemek için sorusu

yeni = []
notlar.each do |isim, v , f|
    v = isim.size + v
    f = isim.size + f
    yeni << [isim, v, f]
end

print yeni