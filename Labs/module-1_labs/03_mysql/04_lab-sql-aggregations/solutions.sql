SELECT  cl.district_id, count(cl.client_id)
FROM bank.client cl
where cl.district_id < '10'
group by cl.district_id
order by cl.district_id asc
limit 10
;

SELECT 
	card.type			as card_type, 
    count(card_id)		as count_numbers
 FROM bank.card 
 group by card_type
 order by count_numbersloan desc 
 ;

SELECT 
	account_id,
	sum(amount) as total_loan_amount
FROM 
	bank.loan
group by
	account_id
order by 
	total_loan_amount desc
limit 10;

SELECT 
	count(loan_id),
    date
FROM 
	bank.loan
where
	date < 930907 
group by 
	date
order by 
	date desc
    ;

SELECT 
	date,
    duration			as duration,
    count(loan_id) 		as num_of_loans
FROM bank.loan
where 
	date > 971200 and date < 980100
group by
	duration, date
order by
	date asc,
    duration asc
;

SELECT 
	account_id, 
    case type										
    when 'PRIJEM' THEN 'Incoming'
    when 'VYDAJ' Then 'Outgoing'
    end as transaction_type,
    round(sum(amount)) 							as total_amount
 FROM bank.trans
 where
	account_id = '396'
group by
	type
order by
	type
 ;
 
 SELECT 
	account_id, 
    round(sum(if(type='PRIJEM', amount, 0))) 							as total_amount_incoming,
    round(sum(if(type='VYDAJ', amount, 0))) 							as total_amount_outgoing,
    round(sum(if(type='PRIJEM', amount, 0))) - round(sum(if(type='VYDAJ', amount, 0)))  as balance
 FROM bank.trans
 where
	account_id = '396'
 ;

SELECT 
	account_id, 
    round(sum(if(type='PRIJEM', amount, 0))) 							as total_amount_incoming,
    round(sum(if(type='VYDAJ', amount, 0))) 							as total_amount_outgoing,
    round(sum(if(type='PRIJEM', amount, 0))) - round(sum(if(type='VYDAJ', amount, 0)))  as balance
 FROM bank.trans
 group by
	account_id
 order by 
	balance desc
limit 10
 ;