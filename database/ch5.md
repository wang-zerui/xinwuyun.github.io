# 第五章 高级SQL

**有两个重点**

![image-20220225161620179](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/25/e1d5c0974001a60fdf0a84c41ee20cbf-image-20220225161620179-818bba.png)

## 使用程序设计语言访问数据库

+ 如何允许数据库与普通程序交互，C还是JAVA
+ 如何处理SQL和C、JAVA中数据类型的不同
+ 如何处理被很多短时进程共享的数据库连接

### 三种不同类型的可编程SQL

+ embedded sql
+ API
  + ODBC
  + JDBC
+ procedure SQL

## 函数和过程 Functions and Procedural Constructs

### 过程 Procedure

使用`create procedure`创建，使用`call`语句调用

procedure没有**返回值**但是可以通过修改参数供调用者稍后检查，它也可以生成结果集。

#### 参数

```sql
proc_parameter: [IN|OUT|INOUT] param_name type
```

+ 每个参数默认是IN参数，可以在参数名前面指定IN OUT
+ 这个关键字（IN|OUT|INOUT）只对PROCEDURE有效
+ 对于FUNCTION，参数都是IN，过程中有可能会改变这些值，但是修改不会对调用者产生影响
+ OUT参数会将值传送到调用者
+ INOUT参数由调用者进行初始化，传送一个值到procedure再返回给调用者，对参数的任何修改对调用者都会生效。
+ `delimiter`命令，设定分隔符。
  + `delimiter //`表示之后如果一行命令以`//`结束，则执行命令，否则不执行
  + ![image-20220226204748761](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/26/44bf32b877222d6e4f99ba500d165082-image-20220226204748761-a165e2.png)

### 函数 Function

使用`create function`使用起来类似内置函数。可以在表达式中调用，它会在表达式执行过程中返回一个值。

定义一个函数，返回一个院内教师人数

```sql
create function dept_count(dept_name varchar(20))
	returns integer
	begin
	declear d_count integer;
		select count(*) into d_count
		from instructor
		where instructor.dept_name=dept_name
	return d_count;
	end
```

### 内容组成

+ 复合语句：begin...end

  + 可能包含多个SQL语句

+ **returns**——指出返回值的类型

+ **return**——指出返回值，作为函数调用的结果

+ SOL 函数实际上是泛化的**参数化视图**

+ ```sql
  BEGIN
  	[statement_list]
  END
  ```

**dept_count**function也可以procudure代替。

### declare statement

+ local variables
+ conditions and handlers
+ cursors

```sql
declare var_name [, var_name] ... type[DEFAULT value]
set variable = expr [, variable=expr]...
```

```sql
create procedure sql (x varchar(5))
begin
	declear xname varchar(5) default 'bob';
	declear newname varchar(5);
	declear xid INT;
	select xname, id INTO newname, xid
	from table1 where xname = xname;
	select newname;
end;
```

### 流程控制语句

+ IF
+ CASE
+ LOOP
  + ITERATE
  + LEAVE LOOP
+ WHILE
+ REPEAT
+ RETURN

#### if

```sql
create funtion xxxx (n INT, m, INT)
	returns varchar(50)
	begin
		declare s varchar(50);
		if n=m then set s = 'equal';
		else
			if n>m then set s = 'greate';
			else set s='less';
			end if;
		end if;
		set s=concat(n, ' ', s, ' ', m, '.');
		return s;
	end//
delimiter ;
```

#### case语句

````sql
case case_value
	when when_value then statement_list
	[when when_value then statement_list]
	[else statement_list]
end case
````

或

```sql
case
	when search_condition then statement_list
	[when search_condition then statement_list]
	[else statement_list]
end case
```

```sql
delimiter |
create procedure p()
	begin
		declare v int default 1;
		case v
			when 2 then select v;
			when 3 then select 0;
			else
				begin
				end;
		end case;
|
delimiter ;
```

#### LOOP

```sql
LOOP
	statement_list
END LOOP
```

### ITERATE

只能在LOOP REPEAT和WHILE statements中使用，表示"Start the loop again"

### LEAVE

离开循环。

### 例子

```sql
create procedure doiterate(p1 INT)
BEGIN
	l1: loop
		set p1 = p1 + 1;
		if p1 < 10 then
			iterate l1;
		end if;
		leave l1;
	end loop l1;
	set @x = p1;
END;
```

### while

```sql
[begin_label]while search_condition do
	statement_list
end while end_label
```

```sql
create procedure dowhile()
begin
	declare v1 int default 5;
	l1: while v1 > 0 do
		...
		set v1 = v1 - 1;
	end while l1; 
end
```

### repeat

```sql
create procedure dorepeat(p1 INT)
begin
	set @x = 0;
	l1: repeat
		set @x = @x + 1;
	until @x > p1 end repeat l1;
end;
```

### cursor游标

mysql支持在存储程序中使用游标，只能单向遍历

```sql
create procedure curdemo()
begin
	declare done int default false;
	declare a char(6);
	declare b, c int;
	declare cur1 cursor for select id, data from test.t1;
	declare cur2 cursor for select i from test.t2;
	declare continue handler for NOT FOUND SET done = truel
	
	open cur1;
	open cur2;
	
	read_loop: LOOP
		fetch cur1 into a, b;
		fetch cur2 into c;
		if done then
			leave read_loop;
		end if;
		if b < c then
			insert into test.t3 values(a,b);
		else
			insert into test.t3 values(a,c);
		end if;
		
	end loop;
	close cur1;
	close cur2;
end;
```

```sql
create procedure curdemo()
begin
	declare dont int default false;
	declare a char(16);							-- 事先声明
	declare b, c int;
	declare cur1 cursor for select id, data from test.t1;
	declare cur2 cursor for select i from test.t2;
	declare continue handler for not found set done = true;
	
	open cur1;
	open cur2;
	
	read_loop: loop
		fetch cur1 into a, b;
		fetch cur2 into c;
		if done then
			leave read_loop;
		end if;
		if b < c then
			insert into test.t3 values(a,b);
		else
			insert into test.t3 values(a, c);
		end if;
	end loop read_loop;
end
```

## Condition handling

+ 可以定义handlers，来应对诸如warning、exceptions或者特殊的条件，比如特定错误码
+ 可以给特定条件设定名字并在handlers中引用

```sql
declare .. condition statement
declare .. handler statement
```

```sql
declare condition_name condition for condition_value
```

```sql
declare continue handler for 1051
begin
	-- body of handler
end;
```

通过声明条件的名字，handler的目的是更容易看到

### declare condition

```sql
declare no_such_table condition for 1051;
declare continue handler for no_such_table;
begin
-- body of handler
end;
```

### declare handler

```sql
DECLARE handler_action HANDLER
    FOR condition_value [, condition_value] ...
    statement

handler_action: {
    CONTINUE
  | EXIT
  | UNDO
}

condition_value: {
    mysql_error_code
  | SQLSTATE [VALUE] sqlstate_value
  | condition_name
  | SQLWARNING
  | NOT FOUND
  | SQLEXCEPTION
}
```

```sql
create procedure handlerdemo()
begin
	declare continue handler for sqlstate '23000' set @x2 = 1;
	set @x = 1;
	insert into test.t values(1);
	set @x = 2;
	insert into test.t values(1);
	set @x = 3;
end
```

## triggers

### event

+ insert
+ delete
+ update

```sql
create trigger trigger-name
	trigger-time trigger-event
	on table-name
	for each row
		trigger-action
```

+ trigger-time$\in${`BEFORE, AFTER`}
+ trigger-event$\in${`INSERT, DELETE, UPDATE`}
+ 两个值
  + old row：for deletes and updates
  + new row：for inserts and updates

### 创建一个触发器，当雇佣新的雇员时更新deparment的总收入

```sql
delimiter |
create trigger udpate_salary
after insert on employee
for each row
begin
	if new.dno is not null then
		update deptsal
		set totalsalary = totalsalary + new.salary
		where dnumber = new.dno;
end
|
delimiter ;
```

![image-20220227235749602](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/27/10314565859062b3ffb831ce6ac3f9e1-image-20220227235749602-1dff31.png)

![image-20220228000146444](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/48c9167f216a706c34e1160fe1c7ba6e-image-20220228000146444-317e28.png)











