PRAGMA table_info(walmart);
SELECT 
    Store AS Magaza_No, 
    ROUND(SUM(Weekly_Sales), 2) AS Toplam_Satis
FROM walmart
GROUP BY Store
ORDER BY Toplam_Satis DESC
LIMIT 5;
SELECT 
    Holiday_Flag AS Tatil_Haftasi,
    ROUND(AVG(Weekly_Sales), 2) AS Ortalama_Haftalik_Satis
FROM walmart
GROUP BY Holiday_Flag;
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
SELECT 
    CASE 
        WHEN CPI < 150 THEN 'Düşük Enflasyon'
        WHEN CPI BETWEEN 150 AND 200 THEN 'Orta Enflasyon'
        ELSE 'Yüksek Enflasyon'
    END AS Enflasyon_Seviyesi,
    ROUND(AVG(Weekly_Sales), 2) AS Ortalama_Haftalik_Satis,
    COUNT(*) AS Veri_Sayisi
FROM walmart
GROUP BY Enflasyon_Seviyesi
ORDER BY Ortalama_Haftalik_Satis DESC;
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
