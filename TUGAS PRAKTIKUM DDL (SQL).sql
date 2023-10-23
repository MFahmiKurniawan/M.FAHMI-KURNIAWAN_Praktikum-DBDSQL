create database PENJUALAN_DVD;

use PENJUALAN_DVD;

create table GENRE(
	ID_GENRE smallint not null,
	GENRE VARCHAR(45) not null, 
	primary key(ID_GENRE) 
);

create table MOVIE(
	KODE_DVD VARCHAR(10) not null,
	JUDUL VARCHAR(60) not null,
	HARGA_SEWA DOUBLE not null,
	DENDA DOUBLE,
	TAHUN_RILIS smallint,
	primary key(KODE_DVD)
);

create table GENRE_MOVIE(
	ID_GENRE smallint not null,
	KODE_DVD VARCHAR(10) not null,
	foreign KEY(ID_GENRE) references GENRE(ID_GENRE),
	foreign KEY(KODE_DVD) references MOVIE(KODE_DVD),
	primary key (ID_GENRE, KODE_DVD)
);

create table KECAMATAN(
	ID_KECAMATAN smallint not null,
	KECAMATAN VARCHAR(45) not null,
	primary key (ID_KECAMATAN)
);

create table KELURAHAN(
	ID_KELURAHAN smallint not null,
	ID_KECEMATAN smallint not null,
	KELURAHAN VARCHAR(45),
	primary key (ID_KELURAHAN),
	foreign key (ID_KECEMATAN) references KECAMATAN(ID_KECAMATAN)
);

create table PELANGGAN(
	KODE_PELANGGAN VARCHAR(10) not null,
	ID_KELURAHAN smallint not null,
	NAMA VARCHAR(45) not null,
	ALAMAT VARCHAR(60) not null,
	JENIS_KELAMIN CHAR(1) not null,
	constraint chk_JENIS_KELAMIN check (JENIS_KELAMIN in ('P','L')),
	primary key(KODE_PELANGGAN),
	foreign key (ID_KELURAHAN) references KELURAHAN(ID_KELURAHAN)
);

create table KONTAK_PELANGGAN(
	NO_HP VARCHAR(25) not null,
	KODE_PELANGGAN VARCHAR(10) not null,
	unique key(NO_HP),
	foreign key (KODE_PELANGGAN) references PELANGGAN(KODE_PELANGGAN)
);

create table TRANSAKSI(
	KODE_DVD VARCHAR(10) not null,
	KODE_PELANGGAN VARCHAR(10) not null,
	TANGGAL_SEWA DATE not null,
	TANGGAL_WAJIB_KEMBALI DATE not null,
	TANGGAL_REALISASI_KEMBALI DATE not null,
	primary key(TANGGAL_SEWA),
	foreign key(KODE_DVD) references MOVIE(KODE_DVD),
	foreign key(KODE_PELANGGAN) references PELANGGAN(KODE_PELANGGAN)
);

alter table MOVIE modify TAHUN_RILIS YEAR(4);

show databases;
