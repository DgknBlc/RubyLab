def sifregir
    print "Şifrenizi giriniz : "
    sifre = gets.chomp.to_s
    while true
        if sifre.size >= 6 && sifre.size < 19
            break
        elsif sifre.size  < 6
            print "Şifreniz olması gerekenden kısa. Tekrar girin : "
            sifre = gets.chomp.to_s
        else
            print "Şifreniz çok uzun. Tekrar girin : "
            sifre = gets.chomp.to_s
        end
    end
    print "Şifreyi tekrar giriniz : "
    tekrar = gets.chomp.to_s
    kayit = [sifre, tekrar]
end

def kayitla(dizi)
    if dizi[0] == dizi[1]
        puts "Şifre kaydedildi"
        return true
    else
        puts "Şifreyi bir daha tanımlayın"
        return false
    end
end

def sifremekanizmasi
    while true
        if kayitla(sifregir)
            break
        end
    end
end

sifremekanizmasi
