USE NorthwindC

--1.請查詢單價10元(含)以下的產品

SELECT * FROM 產品資料 WHERE 單價 <=10
SELECT * FROM 產品類別

--2.請查詢單價介於20~25以及50~70的產品
SELECT * FROM 產品資料 WHERE 單價 >=20  and  單價 <25
SELECT * FROM 產品資料 WHERE 單價 >=50  and  單價 <70
SELECT * FROM 產品資料 WHERE (單價 >=20  and  單價 <25) or (單價 >=50  and  單價 <70)
--3.請列出飲料類的單價(不能重覆)最高的前5名
SELECT * FROM 產品類別 where  類別名稱='飲料'
select  * from 產品資料

select top 5 * 
from dbo.產品資料


--4.請找出1996年訂單總金額最高的前5名
select * from 訂貨明細  -- d
select * from 訂貨主檔  -- o

select Top 5 o.訂單號碼,
             sum(d.單價 * d.數量 * (1 - d.折扣)) as 總金額
from 訂貨主檔 as o join 訂貨明細 as d on o.訂單號碼 = d.訂單號碼
where year(o.訂單日期) = 1996
group by o.訂單號碼
order by 總金額 desc;



--5.請列出具同產品類別中具相同的產品單價的產品類別

select * from 產品資料

select 類別編號, 單價
from 產品資料
group by 類別編號, 單價
having count(*) > 1;


--6.統計1996年各產品類別的平均銷售數量

select * from 訂貨明細  -- D
select * from 訂貨主檔  -- M

select D.產品編號, avg(D.數量) as 平均銷售數量
from 訂貨明細 as D join 訂貨主檔 as M on D.訂單號碼 = M.訂單號碼
where year(M.訂單日期) = 1996
group by D.產品編號


--7.請找出1996年訂購數量最多的第2名產品

select * from 訂貨明細  -- D
select * from 訂貨主檔  -- M

select Top 3 D.產品編號, sum(D.數量) as 訂購數量
from 訂貨明細 as D join 訂貨主檔 as M on D.訂單號碼 = M.訂單號碼
where year(M.訂單日期) = 1996
group by D.產品編號
order by 訂購數量 desc;

--8.計算1997年每個客戶使用送貨方式為"郵寄"的次數 (含未下訂單)

select * from 訂貨主檔  -- M
select * from 貨運公司  -- W

select M.客戶編號, count(M.送貨方式) as 郵寄送貨次數
from 訂貨主檔 as M join 貨運公司 as W on M.送貨方式 = W.貨運公司編號
where (year(M.訂單日期) = 1997) and (M.送貨方式 = 2)
group by M.客戶編號, M.送貨方式