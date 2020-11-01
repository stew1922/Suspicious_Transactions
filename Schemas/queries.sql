--Order the transactions by card holder and date
SELECT cc.id_card_holder, trans.trans_date, trans.amount FROM credit_card AS cc
INNER JOIN transactions AS trans
ON trans.card = cc.card
ORDER BY cc.id_card_holder, trans.trans_date;

--isolate the transactions between 7am and 9pm
SELECT cc.id_card_holder, trans.trans_date, trans.amount FROM credit_card AS cc
INNER JOIN transactions AS trans
ON trans.card = cc.card
WHERE date_part('hour', trans.trans_date) > 7 and date_part('hour', trans.trans_date) < 19
ORDER BY trans.amount DESC;

--count the number of transactions that are below $2.oo and group by card holder
SELECT cc.id_card_holder, count(trans.amount) FROM credit_card AS cc
INNER JOIN transactions AS trans
ON trans.card = cc.card
WHERE trans.amount < 2
GROUP BY cc.id_card_holder
ORDER BY count(trans.amount) DESC;

--count the number of transactions that are below $2.oo and group by merchant
SELECT id_merchant, count(amount) FROM transactions
WHERE amount < 2
GROUP BY id_merchant
ORDER BY count(amount) DESC;

--join merchant and merchant_category to see what the merchants could be fraudulent
SELECT * FROM merchant AS merch
INNER JOIN merchant_category AS merchcat
ON merch.id_merchant_cartegory = merchcat.id_merchant_category;

--load transactions from jan to june  2018 for card holder 25
SELECT id_merchant, date_part('month', trans_date) as trans_month, amount
FROM transactions
WHERE card IN 
	(
	SELECT card
	FROM credit_card
	WHERE id_card_holder = 25
	)
AND date_part('month', trans_date) >= 1 and date_part('month', trans_date) <= 6
AND id_merchant IN
	(
	SELECT id_merchant
	FROM merchant
	WHERE id_merchant_cartegory = 1
	);