# CH4

![image-20220225013618406](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/69dac1c8c89a1ccf80c86f1bf2352efd-image-20220225013618406-08e890.png)

##  views

+ 某些情况下，不是所有用户都想看到整个逻辑模型。

### 创建方法

```sql
create view v as <query expression>
```

"query expression"是一个合法的SQL表达式，视图名是v

+ Once a veiw is defined, the view name can be used to refer to the virtual relation that the view generates.

+ A view defination causes the saving of an expression; the expression is substituted into queries using the view.

  使用了视图的queris中，view会替换为expression

```sql
create view faculty as
select ID, name, dept_name
from insturctor
```

```sql
create view departments_total_salary(dept_name, total_salary) as
 select dept_name, sum(salary)
 from instructor
 group by dept_name;
```

### 使用view定义其他view

```sql
create view physics_fall_2009 as
	select course.course_id, sec_id, building, room_number
	from course, section
	where course.course_id = section.course_id
	and course.dept_name='Physics'
	and section.semester='Fall'
	and section.year='2009'
```

使用上面的view创建其他view

```sql
create view physics_fall_2009_watson as
	select course_id, room_number
	from physics_fall_2009
	where building='Watson';
```

view展开为如下：

```sql
create view physics_fall_2009_watson as
(select course_id, room_number
from (select course.course_id, building, room_number
     from course, section
     where course.course_id=section.section_id
     and section.semester='Fall'
     and section.year='2009')
where building='watson');
```

### view更新

#### 向faculty视图中添加值

```sql
insert into faculty values('30765', 'Green', 'Music')
```

#### 某些更新无法uniquely翻译

```sql
create view instructor_info as
	select ID, name, building
	from instructor, department
	where instructor.dept_name=department.dept_name
```

插入一行

```sql
insert into instructor_info values('1000', 'wzr', 'watson');
```

如果一个建筑中有多个department，就无法确定这个老师是哪个院的，并且如果该建筑中没有department。

满足如下条件view可以

+ From语句中只涉及一个关系
+ select语句只包含属性名，不包含任何表达式、聚合函数和distinct
+ 任何没有在select中列出的属性都可以设为null
+ 没有group by和having

### 物化视图

Materialized Views

+ 允许存储视图关系（物理上）
+ 如果视图中使用的**关系更新**了，**物化视图的结果就会过时**
  + 需要通过更新视图来维护视图

```sql
alter table table-name add constraint 
```



## Integrity Constraints完整性约束

+ not null
+ primary key
+ unique
+ check(P)，P是个谓语

### not null

```sql
name varchar(20) not null,
budget numberic(12, 2) not null
```

### unique($A_1, A_2, ..., A_m$)

+ 表示属性集$$A_1, A_2, ..., A_m$$构成候选码
+ 与主键不同，候选码可以使null（控制不等于其他任何值）

### check子句

check(P)，关系中每个元组都必须满足谓词P

```sql
check ( semester in ('Fall', 'Winter', 'Spring', 'Summer'))
```

### 参照完整性 referential integrity

保证一个关系中给定**属性集**上的取值也在另一个关系的**特定属性集**的取值中出现称为 referential integrity

令关系$r_1$和$r_2$的属性集分别为$R_1$和$R_2$，主码分别为$K_1$和$K_2$。如果$r_2$任意元组$t_2$，均存在$r_1$中元组$t_1$使得$t_1.K_1=t_2.\alpha$，我们称**$R_2$的子集$\alpha$为参照关系$r_1$中$K_1$的外码（foreign key）**

这种关系称为**参照完整性约束（referential-integrity constraint）**或**子集依赖（subset dependency）**。

> $r_2$中$\alpha$上的取值集合必须是$r_1$中$K_1$上的取值集合的子集
>
> $\alpha$和$K_1$必须是相容的属性集
>
> + $\alpha$ 等于$K_1$
> + 二者属性数相同，且对应属性的类型必须相容

```sql
create table course(
	course_id char(5) primary key,
  title varchar(20),
  dept_name varchar(20) references department
)

create table course (
	...
  dept_name varchar(20),
  foreign key(dept_name) references department
  	on delete cascade
  	on update cascade,
  ...
)
```

+ 级联删除`on delete cascade`：如果删除department中的元组导致参照完整性被违反，则删除不被系统拒绝，course中参照了被删除元组的元组被删除

![image-20220225160728298](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/2bfeb8e0bdef176ed4e2a2c8c3e18378-image-20220225160728298-7b3091.png)

+ 在插入一个人之前先插入爸爸和妈妈
+ 先把爸爸和妈妈设为null，插入所有人之后在设置爸爸和妈妈
+ 延迟约束检查