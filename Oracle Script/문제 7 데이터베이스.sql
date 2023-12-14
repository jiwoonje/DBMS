create table grade_pt_rate7 (
    mem_grade varchar2(20) not null constraint PK_grade_pt_rate7_mem_grade primary key,
    grade_pt_rate number(3,2)
);

insert into grade_pt_rate7 (mem_grade, grade_pt_rate)
    values(


create table today7 (
    today_code varchar2(6) not null constraint PK_today7_today_code primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
);

insert into today7 (today_code, today_sens_value, today_intell_value, today_phy_value)
    values (

create table nation7 (
    nation_code varchar2(26) not null constraint PK_nation7_nation_code primary key,
    nation_name varchar2(50) not null
);

insert into (nation_code, nation name)
    values 

create table theme7 (
    theme_code varchar2(6) not null constraint PK_theme7_theme_code primary key,
    theme_name varchar2(50) not null
);

insert into (theme_code, theme_name)
    values

create table wine_type7 (
    wine_type_code varchar2(6) not null constraint PK_wine_type7_wine_type_code primary key,
    wine_type_name varchar2(50)
);

insert into wine_type7 (wine_type_code, wine type_name)
    values

create table manager7 (
    manager_id varchar2(30) not null constraint PK_manager7_manager_id primary key,
    manager_pwd varchar2(30) not null,
    manager_tel varchar2(30)
);

insert into (manager_id, manager_pwd, manager_tel)
    values 

create table member7 (
    mem_id varchar2(6) constraint PK_member7_mem_id primary key,
    mem_grade varchar2(20) constraint FK_member7_mem_grade references grade_pt_rate7(mem_grade) not null,
    mem_pw varchar2(20) not null,
    mem_birth date default sysdate not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) default '0' not null
);

insert into member7 (mem_id, mem_gade, mem_pw, mem_birth, mem_tel, mem_pt)
    values

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





















