-- find deptname where atleast one emp working --
select DNAME from dbo.DEPT where DEPTNO  in
(select DEPTNO from dbo.EMP group by DEPTNO having count(distinct EMPNO)>1);

-- Correlated Subquery way --
select DNAME from dbo.DEPT dept where exists
(select 1 from dbo.EMP emp where dept.DEPTNO =emp.DEPTNO group by DEPTNO having count(distinct EMPNO)>1);

-- Select all department where no employee is there

select DNAME from dbo.DEPT where DEPTNO not in
(select DEPTNO from dbo.EMP ); -- this will give no result 

-- We have to do separate null handle here
select DNAME from dbo.DEPT where DEPTNO not in
(select DEPTNO from dbo.EMP where deptno is not null);

-- best way is
select DNAME from dbo.DEPT dpt where  not exists
(select DEPTNO from dbo.EMP emp where dpt.deptno = emp.deptno);

