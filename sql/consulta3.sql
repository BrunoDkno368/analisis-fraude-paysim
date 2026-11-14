-- Cobertura de la regla (origen vaciado en TRANSFER O CASH_OUT)
use fraude_paysim;
SELECT
    ROUND(100 * SUM(en_regla) / COUNT(*), 1) AS pct_transacciones_revisadas,
    ROUND(100 * SUM(en_regla * isFraud) / SUM(isFraud), 1) AS pct_fraudes_cubiertos,
    ROUND(100 * SUM(en_regla * isFraud * amount) / SUM(isFraud * amount), 1) AS pct_dinero_cubierto
FROM tabla_paysim;
