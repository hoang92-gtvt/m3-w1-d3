Create database QuanLyTour;
use QuanLyTour;

create table DiemDulich(
                           DiemDulichID int primary key auto_increment,
                           DiemDulichName varchar(30) not null,
                           Description varchar(100) not null,
                           Price int not null,
                           City int ,
                           foreign key(City) references ThanhPho(TP_id)

);

create table KhachHang(
                          KH_id int primary key auto_increment,
                          KH_name varchar(30) not null,
                          KH_cccd varchar(30) unique not null ,
                          KH_namsinh int,
                          KH_tp int,
                          foreign key (KH_tp) references ThanhPho(TP_id)

);

create table LoaiTour(
                         LT_id int primary key auto_increment,
                         LT_name varchar(30) not null
);

create table ThanhPho(
                         TP_id int primary key auto_increment,
                         TP_name varchar(30)
);

create table Tour(
                     Tour_id int primary key  auto_increment,
                     Tour_Diemdulich int,
                     Tour_LT int not null,
                     Tour_KH int not null,
                     Tourt_StartDate Date,
                     Tourt_EndDate Date,
                     Tour_soNguoi int not null ,
                     Tour_Price int not null,

                     foreign key(Tour_Diemdulich) references DiemDulich(DiemDulichID),
                     foreign key(Tour_LT) references LoaiTour(LT_id),
                     foreign key(Tour_KH) references KhachHang(KH_id)

);

create table HoaDon(
                       HD_id int primary key auto_increment,
                       HD_tour int not null,
                       HD_nvthu int ,
                       HD_status boolean,
                       foreign key (HD_tour)  references Tour(Tour_id),
                       foreign key (HD_nvthu)  references NhanVien(NV_ID)


);

create table NhanVien(
                         NV_ID int primary key auto_increment,
                         NV_name varchar(30) not null,
                         NV_chucvu varchar(30) not null
);




insert into ThanhPho(TP_name) value
    ('H?? N???i'),
('H???i Ph??ng'),
('Ninh B??nh'),
('Ph?? Qu???c, Ki??ng Giang'),
 ('???? N???ng') ;

insert into DiemDulich(DiemDulichName, Description, City) value
    ('Ba Na Hill', '??i???m du l???ch tr??n n??i cao', 5),
    ('Cat Ba Beach', '??i???m du l???ch bi???n', 2),
    ('Tr??ng An', '??i???m du l???ch qu???n th??? n??i, s??ng', 3),
    ('H??n Th??m', '??i???m du l???ch ngo??i ?????o ', 4),
    ('Ba Vi', 'V?????n qu???c gia qu???n th??? sinh v???t', 1),
    ('L??ng ch??? tich', 'Di t??ch l???ch s???', 1);

insert into LoaiTour(LT_name) value
    ('Tour full opTion'),
('Tour part option')   ;

insert into KhachHang(KH_name, KH_cccd, KH_namsinh, KH_tp) value
    ('Nguy???n V??n A', 12345678, 1990, 2),
('Nguy???n V??n B', 23456789, 1991, 1),
('Nguy???n V??n C', 34567890, 1992, 5),
('Nguy???n V??n D', 45678901, 1993, 1),
('Nguy???n V??n E', 56789012, 1994, 3),
    ('Nguy???n V??n F', 67890123, 1995, 5),
    ('Nguy???n V??n G', 78901234, 1996, 2),
    ('Nguy???n V??n H', 89012345, 1998, 4),
    ('Nguy???n V??n I', 90123456, 1997, 4),
    ('Nguy???n V??n K', 112345678, 1996, 3);

insert into NhanVien(NV_name, NV_chucvu) value
    ('Nhan vien 1', 'thanh vien'),
('Nhan vien 2', 'To truong');

insert into Tour(Tour_Diemdulich, Tour_LT, Tour_KH, Tourt_StartDate, Tourt_EndDate, Tour_soNguoi, Tour_Price) value
    (1,1,1,CAST('2021-01-01'as Date),CAST('2021-01-05'as Date),3,50),
    (1,1,2,CAST('2021-01-01'as Date),CAST('2021-01-05'as Date),2,50),
    (1,2,3,CAST('2021-01-01'as Date),CAST('2021-01-02'as Date),5,50),
    (1,1,4,CAST('2021-01-01'as Date),CAST('2021-01-08'as Date),7,50),
    (1,1,5,CAST('2021-01-01'as Date),CAST('2021-01-06'as Date),4,50),

    (2,1,1,CAST('2021-03-01'as Date),CAST('2021-03-06'as Date),2,100),
    (2,1,2,CAST('2021-03-02'as Date),CAST('2021-03-06'as Date),3,100),
    (2,2,3,CAST('2021-03-04'as Date),CAST('2021-03-06'as Date),4,100),
    (2,1,4,CAST('2021-03-05'as Date),CAST('2021-03-06'as Date),5,100),
    (2,1,5,CAST('2021-03-06'as Date),CAST('2021-03-10'as Date),2,100),

    (3,1,1,CAST('2021-06-01'as Date),CAST('2021-06-06'as Date),2,120),
    (3,1,2,CAST('2021-06-02'as Date),CAST('2021-06-06'as Date),2,120),
    (4,1,3,CAST('2021-06-04'as Date),CAST('2021-06-05'as Date),2,200),
    (4,1,4,CAST('2021-06-03'as Date),CAST('2021-06-04'as Date),2,200),
    (5,1,5,CAST('2021-06-08'as Date),CAST('2021-06-09'as Date),2,10);

insert into HoaDon(HD_tour, HD_nvthu, HD_status) VALUE
    (1, 1,true),
    (2, 1,true),
    (3, 2,true),
    (4, 1,true),
    (5, 1,true),
    (6, 1,true),
    (7, 1,true),
    (8, 1,true),
    (9, 1,false),
    (10, 1,false);


# //group theo t??n ??i???m du l???ch 6 ??i???m
select Tour_Diemdulich,DiemDulichName ,TP.TP_name, count(TP.TP_name) as soluong
from Tour
         Join DiemDulich DD on Tour.Tour_Diemdulich = DD.DiemDulichID
         join ThanhPho TP on DD.City = TP.TP_id
group by Tour_Diemdulich;


insert into Tour(Tour_Diemdulich, Tour_LT, Tour_KH, Tourt_StartDate, Tourt_EndDate, Tour_soNguoi, Tour_Price) value
    (6,1,1,CAST('2021-01-01'as Date),CAST('2021-01-05'as Date),3,50);


# //group theo ten th??nh ph??? trong ??i???m du lich( 5 th??nh ph???)
select Tour_Diemdulich,DiemDulichName ,TP.TP_name, count(TP.TP_name) as soluong
from Tour
         Join DiemDulich DD on Tour.Tour_Diemdulich = DD.DiemDulichID
         join ThanhPho TP on DD.City = TP.TP_id
group by DD.city;



select Tourt_StartDate as thang, count(*)as Soluong
from Tour
         # where Month(Tourt_StartDate) = 3
group by Month(Tourt_StartDate)
having month(thang)=3;

select Tourt_EndDate as thang, count(*)as Soluong
from Tour
group by Month(Tourt_EndDate)
having month(thang)=6;