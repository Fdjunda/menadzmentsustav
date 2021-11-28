drop database if exists trgovackicentar;
create database trgovackicentar character set utf8;
use trgovackicentar;

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    uloga int,
    telefon varchar(10),
    email varchar(50),
    oib char(11),
    iban varchar(50),
    pocetakzaposlenja datetime not null,
    krajzaposlenja datetime
);

create table uloga(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis text
);

create table radninalog(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    prostor int not null,
    opis text,
    pocetak datetime not null,
    kraj datetime
);
