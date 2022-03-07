# 第三章 SQL

![image-20220224161604197](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/ffefe315fc9cdf66c8301e4f97609f31-image-20220224161604197-fc0a47.png)

## 一、SQL查询语言概览

SQL包含一下部分

+ **数据定义语言（data-defination language，DDL）**：提供定义关系模式、删除关系以及修改关系模式的命令
+ **数据操纵语言（data-manipulation language，DML）**
  + 插入元祖
  + 删除元组
  + 修改元组
+ **完整性（integrity）**
  + DDL包括定义完整性约束的命令
  + 破坏完整性约束的更新是不允许
+ **视图定义（view defination）**
  + DDL定义视图的命令
+ **事务控制（transaction control）**
  + SQL包括定义事务的开始或结束的命令
+ **嵌入式SQL和动态SQL（embedded SQL and dynamic SQL）**
  + Embedded sql and dynamic sql如何嵌入到通用编程语言，如C、C++和java
+ **授权（authorization）**
  + DDL包括定义对关系和视图的访问权限命令

## 基本类型

![image-20220224170344627](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/dd5f0297da4698fb2f97137559cd03ab-image-20220224170344627-073d28.png)

每种类型都可能包含一个被称作**空**值的特殊值。

该值可能存在但并不为人所知，可能根本不存在

### create table construct

```sql
create table r(A1D1, A2D2, ..., AnDn,
               integrity-constraint1,
               ...
               integrity-constraintk)
```

![image-20220224182741912](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/c1c4c4fed106dc9dbfebd3765c4e8532-image-20220224182741912-8f2b25.png)

### integrity constraints完整性约束

+ not null
+ Primary key($A_1, ..., A_n$)
+ Foreign key($A_m,...,A_n$)  references r

```sql
create table instructor(
	ID char(5),
  name varchar(20) not null,
  dept_name varchar(20),
  salary varchar(20),
  salary numeric(8,2),
  primary key(ID),
  foreign key(dept_name) references department);
```

+ **primary key**自动保证字段为**not null**

### Integrity Constraints in Tables表的完整性约束

完整性约束保证数据库的修改不会导致数据一致性的丢失

+ primary key
+ foreign key
+ [not] null
+ unique
+ default
+ check
+ assertion

### update

+ insert
  + `insert into instructor values(.....)`
+ delete
  + `delete from student where...`
+ drop table
+ alter
  + `alter table r add A D`
    + A是attribute
    + D是domain
  + `alter table r drop A`

## SQL查询的基本结构

结果也是一个关系

### 执行顺序

![image-20220224190011570](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/e4e24032b0fc1c8e217908c26a897be9-image-20220224190011570-876999.png)

### select语句

大小写不敏感
$$
\text { Name } \equiv N A M E \equiv \text { name }
$$

#### 结果的元组重复

+ allow duplicates in relations as well as in query results.

  允许query结果中存在重复元组

+ force elimination of duplicates, 在select后添加**distinct**

  ```sql
  select distinct dept_name
  from instructor
  ```

+ 使用**all**关键字显示保留重复值

  ```sql
  select all dept_name
  from instructor
  ```

#### 星号 asterisk

asterisk * 表示all attributes

```sql
select *
from instructor
```

#### 属性可以是字面值

##### 没有from语句

```sql
select '457'
```

+ 结果是一个一行一列的表，值为`'457'`
+ 可以给列命名

```sql
select '233' as FOO
```

##### 使用from语句

```sql
select 'A'
from instructor
```

+ 结果一列n行（n是instructor表的行数）
+ 每一行的值都会“A”

#### 可以使用算术表达式

```sql
select ID, name, salary/12
from instructor
```

返回的relation中salary属性的值均除以12

可以对该字段进行重命名

```sql
select ID, name, salary/12 as monthly_salary
```

### where语句

### from语句

### rename operation

```sql
select distinct T.name
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Comp.Sci'
```

### 自连接例子

find the supervisor of the supervisor of "Bob"

![image-20220224214328708](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/d5cacd42d4f1da8b8d057d78825cb78e-image-20220224214328708-205c99.png)

```sql
select S.supervisor
from emp_super as T, emp_super as S
where T.person = 'Bob' and T.supervisor = S.person 
```

### like

+ **percent%**：匹配任意子串
+ **underscore_**：匹配任意字符

Find the names of all instructors whose name includes the substring "dar"

```sql
select name
from instructor
where name like "%dar%"
```

如果匹配字符串“100%”

```sql
like '100\%' escape '\' 
```

Esacpe '\'指定转义字符

+ 是大小写敏感的

### 排序

```sql
select distinct name
from instructor
order by name
```

+ 指定顺序逆序
  + desc 降序
  + asc 升序
  + `order by name desc`
+ 根据多个属性排序
  + `order by dept_nam, name`

### 重复

![image-20220224222411494](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/4fa387eb8664460284a485d7cde9dd32-image-20220224222411494-d73657.png)

### 集合操作

![image-20220224222809086](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/7909a50d1b61fa2e46236bf7476a12c4-image-20220224222809086-cb26fd.png)

+ union：并
+ intersect：交
+ except：差

上述操作默认消除重复元组，使用`union\intersect\except all`保留重复

![image-20220224223137185](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/666b7300783ffb718c1a3ca46114ad8f-image-20220224223137185-01ca52.png)

### 集合操作例子

**题目：找出最高的工资**

#### 找出工资不是最高的instructor的工资

```sql
select distinct T.salary
from instructor as S, instructor as T
where T.salary < S.salary
```

#### 用总体的减去上述结果

```sql
(select distinct salary
from instructor)
except
(select distinct T.salary
from instructor as T, instructor as S
where T.salary < S.salary)
```

## Null values

+ null表示未知值或不存在的值

+ 任何包含null的数学表达式的结果都是null

+ `is null`可以用来检查null值

  + example

  + Find all instructors whose salary is null

    ```sql
    select name from instructor
    where salary is null
    ```

## unknown

+ 三个逻辑值
  + true
  + false
  + unknown
+ 任何与null值进行的比较都返回unknown
  + example：`5<null or null <> null or null = null`

![image-20220224230930159](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/41955c2a9d490b5d232ed1a11c6c084e-image-20220224230930159-ec90ef.png)

对于上述操作，令unknown为true或false，如果得到结果一致，则结果是对应结果，如果结果不一致，则结果是unknown

## 聚合函数

+ avg
+ min
+ max
+ sum
+ count

![image-20220224231639299](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/75b492ec426d5225902c04024b82d410-image-20220224231639299-2f63c1.png)

## group by

**找出每个学院教师的平均工资**

```sql
select dept_name avg(salary) as avg_salary
from instructor
group by dept_name
```

**注意：**在`group by`中出现的属性，必须在select中出现，不能出现其他属性（除了聚合函数）

### having语句

找出所有平均工资超过42000的学院

```sql
select dept_name, avg(salary)
from instructor
group by dept_name
having avg(salary) > 42000
```

> having语句中是在group by之后进行的

### null值和聚合

```sql
select sum(salary)
from instructor
```

+ 上述语句忽略空值
+ 如果没有非空值则查询结果是null
+ 除了$count(*)$，所有聚合函数都忽略在被聚合属性上是空值的元组

## 嵌套子查询

### where语句中的嵌套子查询

+ set成员
+ set比较
+ set基数

### membership

Find courses offered in Fall 2009 and in Spring 2010

```sql
select distinct course_id
from section 
where semester = 'Fall' and year = 2009 and
course_id in (select course_id
             from section
             where semester='Spring' and year = 2010)
```

Find courses offered in Fall 2009 but not in Spring 2010

```sql
select distinct course_id
from section
where semester = 'Fall' and year = 2009 and 
course_id not in (select course_id
                 from section
                 where semester='Spring' and year=2010);
```

可以考察更多属性的membership

```sql
select count(distinct ID)
from takes
where (course_id, sec_id, semester, year) in
	(select course_id, sec_id, semester, year
  from teaches
  where teaches.ID=10101);
```

### comparison——"some"

找出收入高于生物学院的instructor

```sql
select distinct T.name
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name='Biology';
```

等同于用some

```sql
select distinct name
from instructor
where salary > some(select salary
                   from instructor
                   where dept_name='Biology');
```

![image-20220225004414855](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/638ad3035ce4c39cecc6d68563b11fe8-image-20220225004414855-ef2d21.png)

### comparison——all

![image-20220225004459248](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/a7693513eb28980a0df155e70aac3582-image-20220225004459248-b60a97.png)

### Comparison——'exists'

当子查询不是空集时，`exists`返回true

![image-20220225005335119](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/2fa854b1d45a599728d2241217cb2efa-image-20220225005335119-6c0488.png)

#### 找出选了生物学院的所有课程的学生

```sql
select distinct S.ID, S.name
from student as S
where not exists((select distinct course_id
                 from course
                 where dept_name='Biology')
                except
                (select course_id
                from takes
                where S.ID=takes.ID));
```

### Comparison——unique

考察子查询结果中是否存在重复元组，是则返回false，否则返回true

#### 找出2009年最多开展一次的课程

```sql
select T.course_id
from course as T
where unique(select S.course_id
            from course as S
            where S.course_id=T.course_id
            	and S.year=2009);
```

## from子句中的子查询

![image-20220225010916308](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/4e4fd4a32437c5c521f4af93632ff349-image-20220225010916308-ba47e4.png)

### with语句

with子句提供了定义临时关系的方式，这个临时关系只能在当前语句中使用

**例子：找出预算最多的院**

```sql
with max_budget(value) as
	(select max(budget)
  from department)
 select department.name
 from deparment, max_budget
 where department.budget = max_budget.value
```

**例子：找出总收入大于所有院平均总收入的院**

```sql
with dept_total(dept_name, value) as
	(select dept_name, sum(salary)
  from instructor
  group by dept_name),
  dept_total_avg(value) as
  (select avg(salary)
  from instructor)
 select dept_name
 from dept_total, dept_total_avg
 where dept_total.value > dept_total_avg.value;
```

## select中的嵌套子查询

一个语句必须只得到一个值

**例子：列出所有department和院中的教师数**

```sql
select dept_name, (select count(*)
                  from instructor
                  where instructor.dept_name=department.dept_name)
                  as num
from department;
```

如果这个查询返回超过一个元组，则报错。

## 修改数据库

+ 删除
+ 插入
  + ![image-20220225013357220](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/03fc364cedf63935a899aa12f092afc7-image-20220225013357220-bff911.png)
+ 更新

![image-20220225013002974](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/c2b44fb2575ce03605da3fe3f1211892-image-20220225013002974-f75749.png)

![image-20220225013431589](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/6744dda78e85eeb0cdcfabb8328551bd-image-20220225013431589-18887e.png)

条件语句