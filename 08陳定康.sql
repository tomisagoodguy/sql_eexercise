USE NorthwindC

--1.�Ьd�߳��10��(�t)�H�U�����~

SELECT * FROM ���~��� WHERE ��� <=10
SELECT * FROM ���~���O

--2.�Ьd�߳������20~25�H��50~70�����~
SELECT * FROM ���~��� WHERE ��� >=20  and  ��� <25
SELECT * FROM ���~��� WHERE ��� >=50  and  ��� <70
SELECT * FROM ���~��� WHERE (��� >=20  and  ��� <25) or (��� >=50  and  ��� <70)
--3.�ЦC�X�����������(���୫��)�̰����e5�W
SELECT * FROM ���~���O where  ���O�W��='����'
select  * from ���~���

select top 5 * 
from dbo.���~���


--4.�Ч�X1996�~�q���`���B�̰����e5�W
select * from �q�f����  -- d
select * from �q�f�D��  -- o

select Top 5 o.�q�渹�X,
             sum(d.��� * d.�ƶq * (1 - d.�馩)) as �`���B
from �q�f�D�� as o join �q�f���� as d on o.�q�渹�X = d.�q�渹�X
where year(o.�q����) = 1996
group by o.�q�渹�X
order by �`���B desc;



--5.�ЦC�X��P���~���O����ۦP�����~��������~���O

select * from ���~���

select ���O�s��, ���
from ���~���
group by ���O�s��, ���
having count(*) > 1;


--6.�έp1996�~�U���~���O�������P��ƶq

select * from �q�f����  -- D
select * from �q�f�D��  -- M

select D.���~�s��, avg(D.�ƶq) as �����P��ƶq
from �q�f���� as D join �q�f�D�� as M on D.�q�渹�X = M.�q�渹�X
where year(M.�q����) = 1996
group by D.���~�s��


--7.�Ч�X1996�~�q�ʼƶq�̦h����2�W���~

select * from �q�f����  -- D
select * from �q�f�D��  -- M

select Top 3 D.���~�s��, sum(D.�ƶq) as �q�ʼƶq
from �q�f���� as D join �q�f�D�� as M on D.�q�渹�X = M.�q�渹�X
where year(M.�q����) = 1996
group by D.���~�s��
order by �q�ʼƶq desc;

--8.�p��1997�~�C�ӫȤ�ϥΰe�f�覡��"�l�H"������ (�t���U�q��)

select * from �q�f�D��  -- M
select * from �f�B���q  -- W

select M.�Ȥ�s��, count(M.�e�f�覡) as �l�H�e�f����
from �q�f�D�� as M join �f�B���q as W on M.�e�f�覡 = W.�f�B���q�s��
where (year(M.�q����) = 1997) and (M.�e�f�覡 = 2)
group by M.�Ȥ�s��, M.�e�f�覡