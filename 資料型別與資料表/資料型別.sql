/*----------------------------------------------------------------------------------
   ��ƫ��O
----------------------------------------------------------------------------------*/
--���
declare @i bit
declare @j int
set @i=1
set @j=1234567890
SELECT datalength(@i) '���Φ줸��',@i 'i'
select datalength(@j) '���Φ줸��',@j 'j'
go 



--��T�� �w�](18,0)
declare @i decimal(38)
declare @j numeric
declare @k numeric
set @i=12345678901234567890123456789012345678
set @j=123456789012345678
set @k=123456789
select datalength(@i) '���Φ줸��',@i 'i'
SELECT datalength(@j) '���Φ줸��',@j 'j'
SELECT datalength(@k) '���Φ줸��',@k 'k'
go 



--float���O�An�Ȭ���ǰO���аO�k�A�� n=1~24 �h n=24�A���Ħ��7��F�� n=25~53 �h n=53�A���Ħ��15��
DECLARE @i float(5)
set @i=123456789012345
select datalength(@i) '���Φ줸��',@i 'i'
go



--float(n)�� n �ȹw�]��53
DECLARE @i float
set @i=12345678901234567890
select datalength(@i) '���Φ줸��',@i 'i'
go



-- float�̤j����ܽd��1.79E+308
DECLARE @j float
set @j=1.79E+308
--set @j=1234567890123456
select datalength(@j) '���Φ줸��',@j 'j'
go

--real���O�A�ƭȥi�H��ܨ�7��ơA�Y real=float(24)
declare @i real
set @i=1234567890123456789
select datalength(@i) '���Φ줸��',@i 'i'
go



--real�Mfloat�̤j�i���������Ħ��38��
declare @i float
declare @j real
set @i=12345678901234567890123456789012345678
set @j=12345678901234567890123456789012345678
select datalength(@i) '���Φ줸��',@i 'i' 
select datalength(@j) '���Φ줸��',@j 'j' 
go


--����ɶ�

--DataTime �ɶ��� 24 �p�ɡA��T�ܲ@��A��ȥH .000�B.003 �� .007 ���W�A�ԲӽаѾ\ Online Book ���� DataTime ��ƫ��O
declare @i datetime
set @i='2015-07-03 14:00:00.000'
select @i 'i'
set @i='2015-07-03 14:00:00.001'
select @i 'i'
set @i='2015-07-03 14:00:00.002'
select @i 'i'
set @i='2015-07-03 14:00:00.003'
select @i 'i'
set @i='2015-07-03 14:00:00.004'
select @i 'i'
set @i='2015-07-03 14:00:00.005'
select @i 'i'
go

--SmaillDataTime �ɶ��� 24 �p�ɡA�|�ˤ��J��T�ܡy���z
declare @i smalldatetime
set @i='2014-11-04 10:15:29'
select @i 'i'
go

--Time �ɶ��� 24 �p�ɨ�A��T��100�`��
declare @i time
set @i='10:15:30.1234567'
select @i 'i'
set @i='10:15:30.12345678'
select @i 'i'
go


/*
  datetime2�Pdatetimeoffset�Ҭ�24�p�ɨ�A�O���~�B��B��B�ɡB���B��A��T�׹F100�`��A
  �ߤ@���P��datetimeoffset���X�ɰϷP��(UTC)
  */
declare @i datetimeoffset(3)
declare @j datetimeoffset(3)
declare @k datetime2
set @i='2014-11-04 10:15:30.565 +8:00'
set @j='2014-11-04 10:15:30.565'
set @k='2014-11-04 10:15:30.565 +8:00'
select @i 'i',@j 'j',@k 'k'
go


/*
--�r�ꫬ�O
*/
--varchar���ŧi�ɦ�1Byte
declare @i varchar
set @i='abcdef'
select datalength(@i) '���Φ줸��',@i 'i'
go

--varchar�ϥΦh�ִN���h��Bytes
declare @i varchar(20)
set @i='abcdefgh'
select datalength(@i) '���Φ줸��',@i 'i'
go

--�W�LVarchar�ŧi���ת��r��,�|�Q�I�_
declare @i varchar(20)
set @i='abcdefghijklmnopqrstuvwxyz'
select datalength(@i) '���Φ줸��',@i 'i'
go

--char���צ��S���Χ�,�����o��h��Bytes
declare @i char(20)
set @i='abcdefg'
select datalength(@i) '���Φ줸��',@i 'i ��','['+@i+']'  '��� i ��'
go


/*
--Unicode�r�ꫬ�O
*/
--nvarchar���ŧi�ɦ�1�Ӧr��
declare @i nvarchar
set @i='abcdefg'
select datalength(@i) '���Φ줸��',@i 'i'
go

--nvarchar�ϥΦh�ִN���h�֭Ӧr��
declare @i nvarchar(20)
set @i='abcdefg'
select datalength(@i) '���Φ줸��',@i 'i'
go

--nchar���צ��S���Χ�,�����o��h�Ӧr��
declare @i nchar(20)
set @i='abcdefg'
select datalength(@i) '���Φ줸��',@i 'i ��','['+@i+']' '��� i ��',replace(@i,' ','@') '�ťոm��'
go

--�W�Lnvarchar�ŧi���ת��r��,�|�Q�I�_
declare @i nvarchar(20)
set @i='abcdefghijklmnopqrstuvwxyz'
select datalength(@i) '���Φ줸��',@i 'i'
go


--�f�����A�����ƭȥ[�d����A��T�ר�p�Ʋ�4�� 
declare @i varchar(15)
set @i='10,000.12345'
select @i 'i',CAST(@i as money) '�f������'
go

--binary���O
declare @i bigint
declare @j varbinary(20)
set @i=123456
set @j=@i
select @i,@j,cast(@j as int),DATALENGTH(@j)
go





--�аO���A
create database mydb
go
USE MyDB
CREATE TABLE [TBL_1](
	[COL1] [nvarchar](50),
	timestamp,
    [COL2] [uniqueidentifier] NOT NULL DEFAULT NEWID()    
) ON [PRIMARY]
GO
CREATE TABLE [TBL_2](
	[COL1] [nvarchar](50) NOT NULL,
	[COL2] rowversion,
    [COL3] [uniqueidentifier] NOT NULL DEFAULT NEWID()    
) ON [PRIMARY]
go


INSERT INTO TBL_1 (COL1) VALUES ('12345')
INSERT INTO TBL_2 (COL1) VALUES ('12345')
go

SELECT * from TBL_1
SELECT * from TBL_2
go 

UPDATE TBL_1 SET COL1='ABCDEF' WHERE COL1='12345'
UPDATE TBL_2 SET COL1='BBBBBBBBB' WHERE COL1='12345'
SELECT * from TBL_1
SELECT * from TBL_2

drop table tbl_1
drop table tbl_2


--sql_variant���A
USE MyDB
CREATE TABLE [TBL_3](
	[COL1] [int] IDENTITY(1,1) NOT NULL,
	[COL2] [sql_variant] NOT NULL
) ON [PRIMARY]

INSERT INTO TBL_3 (COL2) VALUES ('��Ʀs��')
INSERT INTO TBL_3 (COL2) VALUES (N'��Ʀs��')
INSERT INTO TBL_3 (COL2) VALUES (100.33)
INSERT INTO TBL_3 (COL2) VALUES ('12/12/2007 13:13:13.000')
INSERT INTO TBL_3 (COL2) VALUES (CAST('12/12/2007 13:13:13.000' AS DATETIME))
SELECT * from TBL_3
SELECT col1,
	   SQL_VARIANT_PROPERTY(COL2,'BaseType') �򥻸�ƫ��A,
	   SQL_VARIANT_PROPERTY(COL2,'PRECISION') ��T��,
	   COL2
FROM TBL_3



