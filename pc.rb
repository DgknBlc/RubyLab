puts "Bilgisayar toplama sihirbazına hoşgeldiniz (>//<)"

kur = "TL"
CPU = 200 #çekirdek başına ücret
RAM = 150 #gb başına ücret
GPU = 125 #gb başına ücret
EKRAN = 40 #inc basına ücret
WIN10 = 200 #windows 10 ücreti lisansın kendi ücreti vergi içinde
VERGİ = 0.25 #devletin vergisi
INDIRIM = 0.9 #kampanya indirimi %10

print "Maaşınızı girin :"
maas = gets.chomp.to_i
print "Aylık gider:"
gider = gets.chomp.to_i

print "Win 10 kurulu olsun mu? (e/h)"
win10 = gets.chomp.to_s
if win10 == "e"
  win = true
elsif win10 == "h"
  win = false
else
  loop do
    print "Hatalı giriş yaptınız. Tekrar girin:"
    win10 = gets.chomp.to_s
    break if win10 == "e" || win10 == "h"
  end
end

puts "Kampanyamızdan yararlanmak ister misiniz? (e/h)"
kamp = gets.chomp.to_s
if kamp == "e"
    kampt = true
  elsif win10 == "h"
    kampt = false
  else
    loop do
      print "Hatalı giriş yaptınız. Tekrar girin:"
      kamp = gets.chomp.to_s
      break if kamp == "e" || kamp == "h"
    end
end

kalanmaas = maas - gider #Aylık bize kalan para miktarı

print "Cpu nuzda istediğiniz çekirdek sayısı(max 8): "
cpusayisi = gets.chomp.to_i
if cpusayisi <= 8 && cpusayisi > 0   
else
    loop do
        print "Hatalı giriş yaptınız. Tekrar yazın:"
        cpusayisi = gets.chomp.to_i
        break if cpusayisi <= 8 && cpusayisi > 0
    end      
end

print "Raminizin hafıza kapasitesi(max 32): "
rammiktar = gets.chomp.to_i
if rammiktar <= 32 && rammiktar > 0   
else
    loop do
        print "Hatalı giriş yaptınız. Tekrar yazın:"
        rammiktar = gets.chomp.to_i
        break if rammiktar <= 32 && rammiktar > 0
    end      
end

print "Ekran kartınızın hafıza kapasitesi(max 8): "
gpumiktar = gets.chomp.to_i
if gpumiktar <= 8 && gpumiktar > 0   
else
    loop do
        print "Hatalı giriş yaptınız. Tekrar yazın:"
        gpumiktar = gets.chomp.to_i
        break if gpumiktar <= 8 && gpumiktar > 0
    end      
end

print "İstediğiniz ekranın boyutu (inc 15-100): "
ekraninc = gets.chomp.to_i
if ekraninc <= 100 && ekraninc >= 15   
else
    loop do
        print "Hatalı giriş yaptınız. Tekrar yazın:"
        ekraninc = gets.chomp.to_i
        break if ekraninc <= 100 && ekraninc >= 15
    end      
end

cpufiyat = CPU * cpusayisi
ramfiyat = RAM * rammiktar
gpufiyat = GPU * gpumiktar
ekranfiyat = EKRAN * ekraninc
donanımfiyat = cpufiyat + ramfiyat + gpufiyat + ekranfiyat
vergi = donanımfiyat * VERGİ

puts "------------------------------------------------------------"


puts "#{cpusayisi} çekirdekli işlemci:                           #{cpufiyat} #{kur}"
puts "#{rammiktar} gb RAM:                                       #{ramfiyat} #{kur}"
puts "#{gpumiktar} gb ekran kartı:                               #{gpufiyat} #{kur}"
puts "#{ekraninc} inc ekran:                                   #{ekranfiyat} #{kur}"
if win == true
    puts "Win 10:                                         #{WIN10} #{kur}"
end
puts "------------------------------------------------------------"
if win == true
    totalvergisiz = ekranfiyat + ramfiyat + gpufiyat + cpufiyat + WIN10
else
    totalvergisiz = ekranfiyat + ramfiyat + gpufiyat + cpufiyat
end
vergilitoplam = totalvergisiz + vergi
indirimli = vergilitoplam * INDIRIM

puts "Toplam ücret                                    #{totalvergisiz} #{kur}"
puts "Vergiyle beraber:                               #{vergilitoplam} #{kur}"

if kampt == true
    puts "İndirimli fiyatı:                               #{indirimli} #{kur}"
else
    puts "İndirim Yok"
end

puts "-------------------------------------------------------------"

if kampt == true
    total = indirimli
else
    total = vergilitoplam
end

eksik = total - kalanmaas
ay = eksik / kalanmaas

if kalanmaas > total
    puts "Tebrikler. Bilgisayarı alabilirsiniz."
else
    puts "Üzgünüz bu aya ek olarak #{ay} ay daha çalışmanız lazım."
end