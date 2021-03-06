-- The script outputs the 48 half hour periods for the embedded settlement date as half hour values for all WCIs (Total WCI Volume) that have a WCI Class Id within the following list:
-- 00, N0,  SM, GC, RA, VE, VX and VS
-- The list can be modified as appropriate to validate a Total Volume report comprising a given set of WCI Class Ids.  To use the script the script must be edited to enter the actual settlement date required in the conditional clause WHERE T2.SETTLEMENT_DATE = '12/sep/2012'.

SELECT wci_agg.settlement_date,
       ROUND(SUM(wci_agg.hh1), 3) as hh1,
       ROUND(SUM(wci_agg.hh2), 3) as hh2,
       ROUND(SUM(wci_agg.hh3), 3) as hh3,
       ROUND(SUM(wci_agg.hh4), 3) as hh4,
       ROUND(SUM(wci_agg.hh5), 3) as hh5,
       ROUND(SUM(wci_agg.hh6), 3) as hh6,
       ROUND(SUM(wci_agg.hh7), 3) as hh7,
       ROUND(SUM(wci_agg.hh8), 3) as hh8,
       ROUND(SUM(wci_agg.hh9), 3) as hh9,
       ROUND(SUM(wci_agg.hh10), 3) as hh10,
       ROUND(SUM(wci_agg.hh11), 3) as hh11,
       ROUND(SUM(wci_agg.hh12), 3) as hh12,
       ROUND(SUM(wci_agg.hh13), 3) as hh13,
       ROUND(SUM(wci_agg.hh14), 3) as hh14,
       ROUND(SUM(wci_agg.hh15), 3) as hh15,
       ROUND(SUM(wci_agg.hh16), 3) as hh16,
       ROUND(SUM(wci_agg.hh17), 3) as hh17,
       ROUND(SUM(wci_agg.hh18), 3) as hh18,
       ROUND(SUM(wci_agg.hh19), 3) as hh19,
       ROUND(SUM(wci_agg.hh20), 3) as hh20,
       ROUND(SUM(wci_agg.hh21), 3) as hh21,
       ROUND(SUM(wci_agg.hh22), 3) as hh22,
       ROUND(SUM(wci_agg.hh23), 3) as hh23,
       ROUND(SUM(wci_agg.hh24), 3) as hh24,
       ROUND(SUM(wci_agg.hh25), 3) as hh25,
       ROUND(SUM(wci_agg.hh26), 3) as hh26,
       ROUND(SUM(wci_agg.hh27), 3) as hh27,
       ROUND(SUM(wci_agg.hh28), 3) as hh28,
       ROUND(SUM(wci_agg.hh29), 3) as hh29,
       ROUND(SUM(wci_agg.hh30), 3) as hh30,
       ROUND(SUM(wci_agg.hh31), 3) as hh31,
       ROUND(SUM(wci_agg.hh32), 3) as hh32,
       ROUND(SUM(wci_agg.hh33), 3) as hh33,
       ROUND(SUM(wci_agg.hh34), 3) as hh34,
       ROUND(SUM(wci_agg.hh35), 3) as hh35,
       ROUND(SUM(wci_agg.hh36), 3) as hh36,
       ROUND(SUM(wci_agg.hh37), 3) as hh37,
       ROUND(SUM(wci_agg.hh38), 3) as hh38,
       ROUND(SUM(wci_agg.hh39), 3) as hh39,
       ROUND(SUM(wci_agg.hh40), 3) as hh40,
       ROUND(SUM(wci_agg.hh41), 3) as hh41,
       ROUND(SUM(wci_agg.hh42), 3) as hh42,
       ROUND(SUM(wci_agg.hh43), 3) as hh43,
       ROUND(SUM(wci_agg.hh44), 3) as hh44,
       ROUND(SUM(wci_agg.hh45), 3) as hh45,
       ROUND(SUM(wci_agg.hh46), 3) as hh46,
       ROUND(SUM(wci_agg.hh47), 3) as hh47,
       ROUND(SUM(wci_agg.hh48), 3) as hh48
  FROM (select t.tva_id,
               t.settlement_date,
               t.wci,
               t.wci_class_id,
               t.hh1,
               t.hh2,
               t.hh3,
               t.hh4,
               t.hh5,
               t.hh6,
               t.hh7,
               t.hh8,
               t.hh9,
               t.hh10,
               t.hh11,
               t.hh12,
               t.hh13,
               t.hh14,
               t.hh15,
               t.hh16,
               t.hh17,
               t.hh18,
               t.hh19,
               t.hh20,
               t.hh21,
               t.hh22,
               t.hh23,
               t.hh24,
               t.hh25,
               t.hh26,
               t.hh27,
               t.hh28,
               t.hh29,
               t.hh30,
               t.hh31,
               t.hh32,
               t.hh33,
               t.hh34,
               t.hh35,
               t.hh36,
               t.hh37,
               t.hh38,
               t.hh39,
               t.hh40,
               t.hh41,
               t.hh42,
               t.hh43,
               t.hh44,
               t.hh45,
               t.hh46,
               t.hh47,
               t.hh48
          FROM TVA_TOTAL_VOLUME_AVERAGES t
         WHERE t.tva_id IN
               (SELECT tva_ids
                  FROM (SELECT MAX(t2.tva_id) as tva_ids, t2.wci
                          FROM TVA_TOTAL_VOLUME_AVERAGES t2
                         WHERE T2.SETTLEMENT_DATE = '12/sep/2012'
                           AND T2.wci_class_id in ('00',
                                                   'N0',
                                                   'SM',
                                                   'ZZ',
                                                   'GC',
                                                   'RA',
                                                   'VE',
                                                   'VX',
                                                   'VS')
                         GROUP BY t2.wci, t2.settlement_date))) wci_agg
 GROUP BY wci_agg.settlement_date
 order by wci_agg.settlement_date;

