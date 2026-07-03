SQL ile Walmart Satış Verileri Analizi 📊

Bir Endüstri Mühendisliği öğrencisi olarak, makroekonomik faktörlerin, hava durumunun ve dönemselliğin (tatil günlerinin) Walmart'ın haftalık satışları üzerindeki etkilerini inceleyen uçtan uca bir veri analizi projesi.

📌 Proje Özeti

Bu projede, tüketici davranışlarını ve dış ekonomik etkenleri ortaya çıkarmak amacıyla Walmart'a ait 6.435 haftalık perakende verisi analiz edilmiştir. DBeaver (SQLite) kullanılarak ham veriler, stratejik iş kararlarına dönüştürülecek şekilde anlamlandırılmış ve sorgulanmıştır.

🛠️ Kullanılan Teknolojiler ve Araçlar

Veritabanı Yönetim Sistemi: DBeaver

SQL Dili / Veritabanı: SQLite

Temel SQL Konseptleri: Veri Kümeleme (GROUP BY), Koşullu Segmentasyon (CASE WHEN), Filtreleme (WHERE), Sıralama (ORDER BY) ve Matematiksel Yuvarlama (ROUND).

🔍 Önemli Çıktılar ve SQL Sorguları

1. En Yüksek Performans Gösteren Mağazalar (Pareto İlkesi)

Mağaza bazlı yerel başarıyı analiz etmek ve şirketin ciro şampiyonlarını bulmak için en çok satış yapan ilk 5 lokasyon tespit edilmiştir.

SELECT Store AS Magaza_No, ROUND(SUM(Weekly_Sales), 2) AS Toplam_Satis
FROM walmart
GROUP BY Store
ORDER BY Toplam_Satis DESC
LIMIT 5;


2. Dönemsellik ve Tatil Günlerinin Etkisi

Promosyonlu tatil haftalarının, normal haftalara kıyasla haftalık satış ortalamalarını ne ölçüde artırdığı analiz edilmiştir.

SELECT Holiday_Flag AS Tatil_Haftasi, ROUND(AVG(Weekly_Sales), 2) AS Ortalama_Haftalik_Satis
FROM walmart
GROUP BY Holiday_Flag;


3. Hava Durumu ve Sıcaklık Analizi

Sıcaklık değerleri (Fahrenheit cinsinden) 'Soğuk', 'Ilıman' ve 'Sıcak' olarak segmente edilerek iklim koşullarının mağaza cirolarına etkisi incelenmiştir.

SELECT 
    CASE 
        WHEN Temperature < 40 THEN 'Soğuk (<40°F)'
        WHEN Temperature BETWEEN 40 AND 75 THEN 'Ilıman (40°F-75°F)'
        ELSE 'Sıcak (>75°F)'
    END AS Hava_Durumu,
    ROUND(AVG(Weekly_Sales), 2) AS Ortalama_Satis
FROM walmart
GROUP BY Hava_Durumu
ORDER BY Ortalama_Satis DESC;


4. Makroekonomik Etki (Benzin Fiyatları)

Artan lojistik maliyetlerinin ve benzin fiyatlarının, tüketicilerin haftalık ortalama harcamalarını nasıl değiştirdiği araştırılmıştır.

SELECT 
    CASE 
        WHEN Fuel_Price < 3.0 THEN 'Ucuz Benzin (<3.0$)'
        WHEN Fuel_Price BETWEEN 3.0 AND 3.7 THEN 'Normal Benzin (3.0$-3.7$)'
        ELSE 'Pahalı Benzin (>3.7$)'
    END AS Benzin_Maliyeti,
    ROUND(AVG(Weekly_Sales), 2) AS Ortalama_Haftalik_Satis
FROM walmart
GROUP BY Benzin_Maliyeti
ORDER BY Ortalama_Haftalik_Satis DESC;


🎯 Mühendislik ve İş Çıktıları (Outcomes)

Talep Planlaması ve Envanter Yönetimi: Tatil haftalarında satışlarda ciddi dönemsel artışlar gözlemlenmiştir. Bu durum, tedarik zinciri süreçlerinde emniyet stoklarının ve sevkiyat planlamalarının optimize edilmesi gerektiğini göstermektedir.

Risk Yönetimi: Benzin fiyatları ve enflasyon gibi makroekonomik verilerin tüketici harcamaları üzerindeki korelasyonu incelenerek, ekonomik daralma dönemlerinde hangi mağaza segmentlerinin daha dayanıklı olduğu analiz edilmiştir.
