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

create table radninalog_djelatnik(
    sifra int not null primary key auto_increment,
    radninalog int not null,
    djelatnik int not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(255),
    povrsinaum2 int(5),
    aktivan boolean
);

create table trgovina(
    sifra   int not null primary key auto_increment,
    naziv varchar(255) not null,
    werbstranica varchar(255),
    telefonskibroj varchar(10),
    email varchar(50),
    oib     char(11)
);

create table ugovor(
    sifra int not null primary key auto_increment,
    trgovina int not null,
    prostor int not null,
    sadrzaj text,
    iznosnajma decimal(18,2),
    pocetaknajma datetime not null,
    krajnajma datetime
);

alter table djelatnik add foreign key (uloga) references uloga(sifra);
alter table radninalog add foreign key (prostor) references prostor(sifra);
alter table radninalog_djelatnik add foreign key (radninalog) references radninalog(sifra);
alter table radninalog_djelatnik add foreign key (djelatnik) references djelatnik(sifra);
alter table ugovor add foreign key (trgovina) references trgovina(sifra);
alter table ugovor add foreign key (prostor) references prostor(sifra);