create table grade_pt_rate7 (
    mem_grade varchar2(20) not null constraint PK_grade_pt_rate7_mem_grade primary key,
    grade_pt_rate number(3,2)
);

insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values('VIP', 5.00);
insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values('VVIP', 7.00);
insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values('V3IP', 9.00);
insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values('V4IP', 9.50);
insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values('V5IP', 9.70);

select * from grade_pt_rate7;

create table today7 (
    today_code varchar2(6) not null constraint PK_today7_today_code primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
);

insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values ('aaa', 100, 100, 100);
insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values ('aab', 99, 99, 99);
insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values ('aac', 98, 98, 98);
insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values ('aad', 97, 97, 97);
insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values ('aae', 96, 96, 96);

select * from today7;
commit;

create table nation7 (
    nation_code varchar2(26) not null constraint PK_nation7_nation_code primary key,
    nation_name varchar2(50) not null
);

insert into nation7 (nation_code, nation_name)
    values ('aaaaa', 'italy');
insert into nation7 (nation_code, nation_name)
    values ('bbbbb', 'greece');
insert into nation7 (nation_code, nation_name)
    values ('ccccc', 'france');
insert into nation7 (nation_code, nation_name)
    values ('ddddd', 'swiss');
insert into nation7 (nation_code, nation_name)
    values ('eeeee', 'germany');

select * from nation7;
commit;

create table theme7 (
    theme_code varchar2(6) not null constraint PK_theme7_theme_code primary key,
    theme_name varchar2(50) not null
);

insert into theme7 (theme_code, theme_name)
    values ('chill', '여유');
insert into theme7 (theme_code, theme_name)
    values ('clean', '깨끗한');
insert into theme7 (theme_code, theme_name)
    values ('hot', '강렬한');
insert into theme7 (theme_code, theme_name)
    values ('dry', '드라이한');
insert into theme7 (theme_code, theme_name)
    values ('pure', '순수한');
    
select * from theme7;
commit;

create table wine_type7 (
    wine_type_code varchar2(6) not null constraint PK_wine_type7_wine_type_code primary key,
    wine_type_name varchar2(50)
);

insert into wine_type7 (wine_type_code, wine_type_name)
    values ('적', '적포도주');
insert into wine_type7 (wine_type_code, wine_type_name)
    values ('백', '백포도주');
insert into wine_type7 (wine_type_code, wine_type_name)
    values ('적탄', '스파클링 적포도주');
insert into wine_type7 (wine_type_code, wine_type_name)
    values ('백탄', '스파클링 백포도주');
insert into wine_type7 (wine_type_code, wine_type_name)
    values ('적당', '달달한 적포도주');

select * from wine_type7;
commit;

create table manager7 (
    manager_id varchar2(30) not null constraint PK_manager7_manager_id primary key,
    manager_pwd varchar2(30) not null,
    manager_tel varchar2(30)
);

insert into manager7 (manager_id, manager_pwd, manager_tel)
    values ('aaaaa', '11111', '010-1111-1111');
insert into manager7 (manager_id, manager_pwd, manager_tel)
    values ('bbbbb', '11112', '010-1111-1112');
insert into manager7 (manager_id, manager_pwd, manager_tel)
    values ('ccccc', '11113', '010-1111-1113');
insert into manager7 (manager_id, manager_pwd, manager_tel)
    values ('ddddd', '11114', '010-1111-1114');
insert into manager7 (manager_id, manager_pwd, manager_tel)
    values ('eeeee', '11115', '010-1111-1115');
    
select * from manager7;
commit;

create table member7 (
    mem_id varchar2(6) constraint PK_member7_mem_id primary key,
    mem_grade varchar2(20) constraint FK_member7_mem_grade references grade_pt_rate7(mem_grade) not null,
    mem_pw varchar2(20) not null,
    mem_birth date default sysdate not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) default '0' not null
);

insert into member7 (mem_id, mem_gade, mem_pw, mem_birth, mem_tel, mem_pt)
    values ('iiii', 'VIP', '1111', '90/01/01', '010-1111-1111', '

create table wine7 (
    wine_code varchar2(26) not null constraint PK_wine7_wine_code primary key,
    wine_name varchar2(100) not null,
    wine_url blob,
    nation_code varchar2(26) constraint FK_wine7_nation_code references nation7(nation_code),
    wine_type_code varchar2(6) constraint FK_wine7_wine_type_code references wine_type7(wine_type_code),
    wine_sugar_code number(2),
    wine_price number(15) default 0 not null ,
    wine_vintage date,
    theme_code varchar2(6) constraint FK_wine7_theme_code references theme7(theme_code),
    today_code varchar2(6) constraint FK_wine7_today_code references today7(today_code)
);

insert into wine7 (wine_code, wine_name, wine_url, nation_code, wine_type_code, wine_sugar_code, wine_price, wine_vintage, theme_code, today_code)
    values

create table sale7 (
    sale_date date default sysdate not null constraint PK_sale7_sale primary key,
    wine_code varchar2(6) constraint FK_sale7_wine_code references wine7(wine_code) not null,
    mem_id varchar2(30) constraint FK_sale7_men_id references member7(mem_id) not null,
    sale_amount varchar2(5) default '0' not null,
    sale_price varchar2(6) default '0' not null,
    sale_tot_price varchar2(15) default 0 not null
);

insert into sale7 (sale_date, wine_code, mem_id, sale_amount, sale_price, sale_tot_price)
    values

create table stock_management7 (
    stock_code varchar2(6) not null constraint PK_stock_management7_stock_code primary key,
    wine_code varchar2(26) constraint FK_stock_management7_wine_code references wine7(wine_code),
    manager_id varchar2(30) constraint FK_stock_management7_manager_id references manager7(manager_id),
    ware_date date default sysdate not null,
    stock_amount number(5) default 0 not null
);

insert into stock_management7 (stock_code, wine_code, manager_id, ware_date, stock_amount)
    values 





















