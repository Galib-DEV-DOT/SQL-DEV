-- find deptname where atleast one emp working --
SELECT * FROM dbo.DEPT; 
select * from dbo.EMP group by DEPTNO having count(distinct empno)>1;