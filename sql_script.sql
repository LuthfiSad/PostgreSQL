--cek apakah ada table di database
select *
from pg_tables
where schemaname = 'public';

--membuat table barang dengan kolom kode, name, harga, jumlah, waktu_dibuat
create table barang
(
    kode         int          not null,
    name         varchar(100) not null,
    harga        int          not null default 1000,
    jumlah       int          not null default 0,
    waktu_dibuat TIMESTAMP    not null default current_timestamp
);

--menambahkan table deskripsi dengan tipe data text
alter table barang
    add column deskripsi text;

--menghapus table deskripsi
alter table barang
    drop column deskripsi;

--mengubah kolom name menjadi nama di table barang
alter table barang
    rename column name to nama;

--mereset data yang ada di table barang / menghapus table lalu di buat ulang dengan sama seperti sebelumnya
truncate barang;

--menghapus table barang
drop table barang;

--membuat table produk dengan kolom id, name, description, price, quantity, created_at
create table products
(
    id          varchar(10)  not null,
    name        varchar(100) not null,
    description text,
    price       int          not null,
    quantity    int          not null default 0,
    created_at  timestamp    not null default current_timestamp
);

--menambah data ke table produk
insert into products(id, name, price, quantity)
values ('P0001', 'Mie Ayam Original', 15000, 100);

--menambah data ke table produk dengan description
insert into products(id, name, description, price, quantity)
values ('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 100);

--menambah multiple data data ke table produk
insert into products(id, name, price, quantity)
values ('P0003', 'Mie Ayam Ceker', 20000, 100),
       ('P0004', 'Mie Ayam Spesial', 25000, 100),
       ('P0005', 'Mie Ayam Yamin', 15000, 100);

--menampilkan semua data di table produk
select *
from products;

--menampilkan data id, name, price, quantity di table produk
select id, name, price, quantity
from products;

--menambahkan primary key pada id di table produk
alter table products
    add primary key (id);

--mencari data sesuai id, name, price, quantity dengan quantiy=0 di table produk
select id, name, price, quantity
from products
where quantity = 0;

--mencari data sesuai id, name, price, quantity dengan price=20000 di table produk
select id, name, price, quantity
from products
where price = 20000;

--mencari data sesuai id, name, price, quantity dengan id=P0004 di table produk
select id, name, price, quantity
from products
where id = 'P0004';

--menampilkan semua data di table produk
select *
from products;

--membuat type PRODUCT_CATEGORY tipe datanya enum dengan valuenya
create type PRODUCT_CATEGORY as enum ('Makanan', 'Minuman', 'Lain-Lain');

--menambahkan kolom category dengan type yang di buat yaitu PRODUCT_CATEGORY(enum)
alter table products
    add column category PRODUCT_CATEGORY;

--menampilkan semua data di table produk
select *
from products;

-- update / mengubah value category menjadi makanan di id=P0001 pada table produk
update products
set category = 'Makanan'
where id = 'P0001';

--mengubah value category menjadi makanan di id=P0002 pada table produk
update products
set category = 'Makanan'
where id = 'P0002';

--mengubah value category menjadi makanan di id=P0003 pada table produk
update products
set category = 'Makanan'
where id = 'P0003';

--mengubah value category menjadi makanan di id=P0004 pada table produk
update products
set category = 'Makanan'
where id = 'P0004';

--mengubah value category menjadi makanan di id=P0005 pada table produk
update products
set category = 'Makanan'
where id = 'P0005';

--mengubah value category menjadi makanan dan description menjadi Mie Ayam ... di id=P0003 pada table produk
update products
set category    = 'Makanan',
    description = 'Mie Ayam + Ceker'
where id = 'P0003';

--menampilkan semua data di table produk
SELECT *
from products;

--mengubah value price menjadi value lamanya + 5000 di id=P0004 pada table produk
update products
set price = price + 5000
where id = 'P0004';

--menambah data ke table produk
insert into products(id, name, price, quantity, category)
values ('P0009', 'Contoh', 10000, 100, 'Minuman');

--menghapus data di table produk dengan id=P0009
delete
from products
where id = 'P0009';

--menambahkan alias / nama yang tampil / nama sementara pada id yang menjadi Kode Barang, price, dan description pada table produk
select id as "Kode Barang", price as "Harga Barang", description as "Deskripsi Barang"
from products;

--alias pada table dari products ke p dan alias juga untuk kolo id, price, description
select p.id          as "Kode Barang",
       p.price       as "Harga Barang",
       p.description as "Deskripsi Barang"
from products as p;

--mencari semua data yang value price nya di atas 15000 pada table produk
select *
from products
where price > 15000;

--mencari semua data yang value price nya lebih kecil atau sama dengan 15000 pada table produk
select *
from products
where price <= 15000;

--mencari semua data yang value category nya bukan sama dengan Minuman pada table produk
select *
from products
where category != 'Minuman';

--mencari semua data yang value price nya diatas 15000, dan category nya = Makanan pada table produk
select *
from products
where price > 15000
  and category = 'Makanan';

 --menampilkan semua data di table produk
SELECT *
FROM products;

--menambah multiple data data ke table produk
insert into products(id, name, price, quantity, category)
values ('P0006', 'Es teh tawar', 10000, 100, 'Minuman'),
       ('P0007', 'Es Campur', 20000, 100, 'Minuman'),
       ('P0008', 'Just Jeruk', 15000, 100, 'Minuman');

--mencari semua data yang value price nya diatas 15000, atau category nya = Makanan pada table produk
select *
from products
where price > 15000
   or category = 'Makanan';

--mencari semua data yang value qty nya diatas 100, atau category nya = Makanan dan price nya atas 15000 pada table produk
select *
from products
where quantity > 100
   OR category = 'Makanan' and price > 15000;

--mencari semua data yang value category = Makanan, atau (qty nya diatas 100 dan price nya diatas 15000) pada table produk
select *
from products
where category = 'Makanan'
   or (quantity > 100 and price > 15000);

--mencari semua data yang value name nya memiliki huruf es dan tidak case sensitive pada table produk
select *
from products
where name ilike '%es%';

--mencari semua data yang value description nya itu null 
select *
from products
where description is null;

--mencari semua data yang value description nya itu tidak null 
select *
from products
where description is not null;

--mencari semua data yang value price nya antara 10000 - 20000
select *
from products
where price between 10000 and 20000;

--mencari semua data yang value price nya tidak antara 10000 - 20000
select *
from products
where price not between 10000 and 20000;

--mencari semua data yang value category nya yaitu makanan atau minuman
select *
from products
where category in ('Makanan', 'Minuman');

--mengurutkan price dari yang kecil ke terbesar, dan id dari yang besar ke kecil
select *
from products
order by price asc, id desc;

--cari semua data yang value price nya lebih dari 0, urutkan price dari yang kecil ke terbesar, dan id dari yang besar ke kecil
select *
from products
where price > 0
order by price asc, id desc;

--cari semua data yang value price nya lebih dari 0, urutkan price dari yang kecil ke terbesar, dan id dari yang besar ke kecil
--limit kan hasil hanya 2 yang tampil dari atas
select *
from products
where price > 0
order by price asc, id desc
limit 2;

-- 1 limit 2 offset 0, 2 limit 2 offset 2, 3 limit 2 offset 4
--cari semua data yang value price nya lebih dari 0, urutkan price dari yang kecil ke terbesar, dan id dari yang besar ke kecil
--limit kan hasil hanya 2 yang tampil dari atas, dan hilangkan 2 data di atasnya, maka limit mengambil data 4-5
select *
from products
where price > 0
order by price asc, id desc
limit 2 offset 2;

--menampilkan value dan kolomnya di kolom category pada table produk
select category
from products;

--menampilakan value dan kolomnya di kolom category tanpa duplikat pada table produk
select distinct category
from products;

--penggunaan aritkatika pada postgresql
select 10 + 10 as hasil;

--ambil data id, name dan price(alias price_in_k) dengan di bagi 1000 dan dari table produk
select id, name, price / 1000 as price_in_k
from products;

--matematika function 1
select pi();

--matematika function 2
select power(10, 2);

--matematika function 3
select cos(10), sin(10), tan(10);

--ambil id, name, dan qty yang di pangkatkan 2, lalu qty nya berikan alias pada table produk
select id, name, power(quantity, 2) as quantity_power_2
from products;

--membuat table admin dengan primary key untuk kolom id agar berurut
create table admin
(
    id         serial       not null,
    first_name varchar(100) not null,
    last_name  varchar(100),
    primary key (id)
);

--menambahkan data untuk test primary key 
insert into admin(first_name, last_name)
values ('Eko', 'Khannedy'),
       ('Budi', 'Nugraha'),
       ('Joko', 'Morro');

--menampilkan semua data pada table admin
select *
from admin;

--menampilkan data sekarang pada kolom yang memiliki nextval = admin_id_seq
select currval('admin_id_seq');

--membuat sequence baru yang bisa auto incremen
create sequence contoh_sequence;

--mengambil nilai selanjutnya pada sequence yang di buat
select nextval('contoh_sequence');

--mengambil nilai sekarang pada sequence yang di buat
select currval('contoh_sequence');

--mengambil data id, name, description dari table produk
select id, name, description
from products;

--mengambil data id, name yang di ubah ke lowercase, panjang huruf name, dan description yang di ubah ke lowercase dari table produk
select id, lower(name), length(name), lower(description)
from products;

--menampilkan semua data pada table produk
select *
from products;

--mengambil data id, dan crate_at di ubah menjadi tahunnya saja, dan created_at di ubah jaiki bulannya dari table produk
select id, extract(year from created_at), extract(month from created_at)
from products;

--mengambil data id, category dari table produk
select id, category
from products;

--mengambil data id, category, dan case category yang Makanan menjadi Enak, Minuman menjadi Seger
--jika tidak keduanya menjadi Apa itu?, lalu aliaskan datanya menjadi category_case dari table produk
select id,
       category,
       case category
           when 'Makanan' then 'Enak'
           when 'Minuman' then 'Seger'
           else 'Apa itu?'
           end as category_case
from products;

--mengambil data id, price, dan case price dibawah 15000 menjadi Murah, dibawah 20000 = Mahal
--dan selain itu akan Mahal Banget, lalu aliaskan menjadi "apakah murah?" pada table produk
select id,
       price,
       case
           when price <= 15000 then 'Murah'
           when price <= 20000 then 'Mahal'
           else 'Mahal Banget'
           end as "apakah murah?"
from products;

--mengambil data id, name, dan case description jika description itu null maka jadi "kosong"
--jika tidak null maka tampilkan deskripsinya, lalu aliaskan data tersebut menjadi description dari table produk
select id,
       name,
       case
           when description is null then 'kosong'
           else description
           end as description
from products;

--mengambil banyaknya data id dari table produk
select count(id)
from products;

--mengambil rata-rata data price dari table produk
select avg(price)
from products;

--mengambil data price terbesar dari table produk
select max(price)
from products;

--mengambil data price terkecil dari table produk
select min(price)
from products;

--mengambil category, dan banyaknya data id lalu aliaskan dari table produk, lalu group sesuai category nya 
--contoh seperti category makanan ada berapa datanya...
select category, count(id) as "Total Product"
from products
group by category;

--mengambil data category dan rata ratanya, harga termurahnya, dan harga mahalnya dari table produk, lalu group sesuai nilai categorynya
select category,
       avg(price) as "Rata Rata Harga",
       min(price) as "Harga termurah",
       max(price) as "Harga termahal"
from products
group by category;

--untuk filter ketike grouping tidak bisa menggunakan where harus menggunakan HAVING clause
--mengambil category, dan banyaknya data id lalu aliaskan dari table produk, lalu group sesuai category nya
--tetapi category yang sama nya memiliki lebih dari 3 data
select category, count(id) as "Total Product"
from products
group by category
having count(id) > 3;

--mengambil data category dan rata ratanya, harga termurahnya, dan harga mahalnya dari table produk, lalu group sesuai nilai categorynya
--tetapi category yang sama nya rata ratanya diatas 20000
select category,
       avg(price) as "Rata Rata Harga",
       min(price) as "Harga termurah",
       max(price) as "Harga termahal"
from products
group by category
having avg(price) >= 20000;

--membuat table customer dengan constraint unique pada kolom email dengan nama unique_email
--constraint adalah data yang tidak boleh duplikat
create table customer
(
    id         serial       not null,
    email      varchar(100) not null,
    first_name varchar(100) not null,
    last_name  varchar(100),
    primary key (id),
    constraint unique_email unique (email)
);

--menampilkan semua data pada table customer
select *
from customer;

--menambah data pada table customer
insert into customer(email, first_name, last_name)
values ('eko@pzn.com', 'Eko', 'Khannedy');

--menambah data multiple pada table customer
insert into customer(email, first_name, last_name)
values ('budi@pzn.com', 'Budi', 'Nugraha'),
       ('joko@pzn.com', 'Joko', 'Morro'),
       ('rully@pzn.com', 'Rully', 'Irwansyah');

--menghapus constraint unique_email pada table customer
alter table customer
    drop constraint unique_email;

--menambah constraint unique_email pada table customer di kolom email
alter table customer
    add constraint unique_email unique (email);

--menambahkan constraint price_check untuk ketika price diatas 1000 pada table produk
alter table products
    add constraint price_check check ( price > 1000 );

--menambahkan constraint quantity_check untuk ketika quantity diatas = 0 pada table produk
alter table products
    add constraint quantity_check check ( quantity >= 0 );

--constoh menambah data gagal saat pengecekan constraint untuk price diatas 1000 pada table produk
insert into products(id, name, price, quantity, category)
values ('XXX1', 'Contoh Gagal', 10, 0, 'Minuman');

--constoh menambah data gagal saat pengecekan constraint untuk qty diatas = 0 pada table produk
insert into products(id, name, price, quantity, category)
values ('XXX1', 'Contoh Gagal', 10000, -10, 'Minuman');

--menampilkan semua data pada table customer
select *
from products;

--membuat table sellers
create table sellers
(
    id    serial       not null,
    name  varchar(100) not null,
    email varchar(100) not null,
    primary key (id),
    constraint email_unique unique (email)
);

--menambah data pada table sellers
insert into sellers(name, email)
values ('Galeri Olahraga', 'galeri@pzn.com'),
       ('Toko Tono', 'tono@pzn.com'),
       ('Toko Budi', 'budi@pzn.com'),
       ('Toko Rully', 'rully@pzn.com');

--menampilkan semua data pada table seller
SELECT *
From sellers;

--index di gunakan untuk mempercepat proses pencarian tapi memperlambat dalam query nya seperti insert, update, delete
--membuat index pada table seller untuk kolom id dan name
create index sellers_id_and_name_index ON sellers (id, name);
--membuat index pada table seller untuk kolom email dan name
create index sellers_email_and_name_index ON sellers (email, name);
--membuat index pada table seller untuk kolom name
create index sellers_name_index ON sellers (name);

--menampilkan semua data pada table seller dengan id = 1
select *
from sellers
where id = 1;

--menampilkan semua data pada table seller dengan id = 1 atau name = 'Toko Tono'
select *
from sellers
where id = 1
   or name = 'Toko Tono';

--menampilkan semua data pada table seller dengan email = 'rully@pzn.com' atau name = 'Toko Tono'
select *
from sellers
where email = 'rully@pzn.com'
   or name = 'Toko Tono';

--menampilkan semua data pada table seller dengan name = 'Toko Tono'
select *
from sellers
where name = 'Toko Tono';

--ini adalah proses lambat dalam mencari data karena menggunakan like tidak terpengaruh pada index
--menampilkan semua data pada table seller dengan name memiliki huruf mie, tanpa berpengaruh pada style hurufnya
select *
from products
where name ilike '%mie%';

--ini sama seperti ilike dan sama lambatnya, tetapi ini juga mencari kata mie pada kolom name
select *
from products
where to_tsvector(name) @@ to_tsquery('mie');

--cara penggunaan full text search agar mencari kata mie pada kolom name menjadi lebih cepat
--mencari bahasa yang di miliki device yang bisa di gunakan untuk full text search
select cfgname
from pg_ts_config;

--membuat full text search di table products untuk kolom name dengan nama products_name_search
create index products_name_search on products using gin (to_tsvector('indonesian', name));
--membuat full text search di table products untuk kolom description dengan nama products_description_search
create index products_description_search on products using gin (to_tsvector('indonesian', description));
--full text search selesai di buat

--full text search di cari perkata bukan per huruf
--mencari kata ayam dan tahu dalam kolom name menggunakan full text search di kolom name yang dibuat
select *
from products
where name @@ to_tsquery('ayam & tahu');
--mencari kata mie dalam kolom description menggunakan full text search di kolom description yang dibuat
select *
from products
where description @@ to_tsquery('mie');


--membuat table wishlist
--cara menambahkan foreign key untuk kolom id_product yang nyambung dengan table products pada kolom id
--nama foreign key = fk_wishlist_product
create table wishlist
(
    id          serial      not null,
    id_product  varchar(10) not null,
    description text,
    primary key (id),
    constraint fk_wishlist_product foreign key (id_product) references products (id)
);

--menambahkan multiple data pada table wishlist
insert into wishlist(id_product, description)
values ('P0001', 'Mie ayam kesukaan'),
       ('P0002', 'Mie ayam kesukaan'),
       ('P0005', 'Mie ayam kesukaan');

--menampilkan semua data pada table wishlist
SELECT *
FROM wishlist;

--menghapus data pada table wishlist dengan id = 'P0005'
--ini test di hapus dan ternyata tidak bisa karena restrict dengan table wishlist yang nyambung dan berelasi dengan id_product nya
delete
from products
where id = 'P0005';

--menghapus foreign key dari table wishlist dengan nama fk_wishlist_product
alter table wishlist
    drop constraint fk_wishlist_product;

--membuat foreign key dari table wishlist dengan nama fk_wishlist_product yang nyambung dengan table products pada kolom id
--maksud on delete cascade dan on update cascade adalah jika data di table products dihapus dan diubah, data di table wishlist dihapus dan diubah juga
alter table wishlist
    add constraint fk_wishlist_product foreign key (id_product) references products (id)
        on delete cascade on update cascade;

--menambahkan data ke table wishlist
insert into products(id, name, price, quantity, category)
values ('XXX', 'Xxx', 10000, 100, 'Minuman');

--menampilkan semua data pada table products
SELECT *
FROM products;

--menambahkan data ke table wishlist dengan id_product = 'XXX' yang baru dibuat dan berelasi dengan table products
insert into wishlist(id_product, description)
values ('XXX', 'Contoh');

--menampilkan semua data pada table wishlist
select *
from wishlist;

--menghapus data pada table products dengan id = 'XXX'
--lalu di table wishlist menghapus data pada table wishlist dengan id_product = 'XXX'
delete
from products
where id = 'XXX';

-- mengambil semua data pada table wishlist dan gabungkan dengan data pada table products
--caranya dengan menyesuaikan kolom id dari table products dan id_product dari table wishlist
select *
from wishlist
         join products on wishlist.id_product = products.id;

--mengambil semua data pada table wishlist dan gabungkan dengan data pada table products
--caranya dengan menyesuaikan kolom id dari table products dan id_product dari table wishlist
--dan tapi table wishlist nya di aliaskan jadi w, dan table products di aliaskan jadi p
select p.id, p.name, w.description
from wishlist as w
         join products as p on w.id_product = p.id;

--menambahkan column id_customer pada table wishlist
alter table wishlist
    add column id_customer int;

--menambahkan foreign key dari table wishlist dengan kolom id_customer, ke table customer dengan kolom id
alter table wishlist
    add constraint fk_wishlist_customer foreign key (id_customer) references customer (id);

--mengubah data pada table wishlist dengan id_customer = 1, untuk yang memiliki id = 2 dan id = 3
update wishlist
set id_customer = 1
where id in (2, 3);

--mengubah data pada table wishlist dengan id_customer = 4, untuk yang memiliki id = 4
update wishlist
set id_customer = 4
where id = 4;

--menampilkan semua data pada table customer
select *
From customer;

--menampilkan semua data pada table wishlist
select *
from wishlist;

--menampilkan semua data pada table wishlist dan gabungkan dengan data pada table products dan table customer
--untuk table products caranya dengan menyesuaikan kolom id dari table products dan id_product dari table wishlist
--untuk table customer caranya dengan menyesuaikan kolom id dari table customer dan id_customer dari table wishlist
--dan tapi table wishlist nya di aliaskan jadi w, dan table products di aliaskan jadi p, dan table customer di aliaskan jadi c
select c.email, p.id, p.name, w.description
from wishlist as w
         join products as p on w.id_product = p.id
         join customer as c on c.id = w.id_customer;

--contoh relationship 1 to 1
--membuat table wallet id_customer menjadi unik dan foreign key
create table wallet
(
    id          serial not null,
    id_customer int    not null,
    balance     int    not null default 0,
    primary key (id),
    constraint wallet_customer_unique unique (id_customer),
    constraint fk_wallet_customer foreign key (id_customer) references customer (id)
);

--menampilkan semua data pada table customer
select *
from customer;

--menambahkan multiple data pada table wallet
insert into wallet(id_customer, balance)
values (1, 1000000),
       (4, 2000000),
       (5, 3000000),
       (6, 4000000);

--menampilkan semua data pada table wallet
select *
from wallet;

--menampilkan semua data pada table customer dan gabungkan dengan data pada table wallet 
--dengan id_customer dari table wallet = id di table customer
select *
from customer
         join wallet on wallet.id_customer = customer.id;

--contoh relationship 1 to many
--membuat table categoryss
create table categories
(
    id   varchar(10)  not null,
    name varchar(100) not null,
    primary key (id)
);

--menambahkan multiple data pada table categories
insert into categories(id, name)
values ('C0001', 'Makanan'),
       ('C0002', 'Minuman');

--menampilkan semua data pada table categories
select *
from categories;

--menambahkan column id_category pada table products
alter table products
    add column id_category varchar(10);

--menambahkan foreign key dari table products ke table categories
--dari kolom id_category pada table products, ke kolom id pada table categories
alter table products
    add constraint fk_product_category foreign key (id_category) references categories (id);

--menampilkan semua data pada table products
select *
from products;

--mengubah value id_category pada table products jika category = 'Makanan', id_category = 'C0001'
update products
set id_category = 'C0001'
where category = 'Makanan';

--mengubah value id_category pada table products jika category = 'Minuman', id_category = 'C0002'
update products
set id_category = 'C0002'
where category = 'Minuman';

--menghapus kolom category dari table products karena sudah ada di table categories, dan sudah berelasi
alter table products
    drop column category;

--menampilkan semua data pada table products, dan gabungkan dengan data pada table categories, dengan id_category dari table products = id di table categories
select *
from products
         join categories on products.id_category = categories.id;

--contoh relationship many to many
--membuat table orders
create table orders
(
    id         serial    not null,
    total      int       not null,
    order_date timestamp not null default current_timestamp,
    primary key (id)
);

--membuat table orders_detail
create table orders_detail
(
    id_product varchar(10) not null,
    id_order   int         not null,
    price      int         not null,
    quantity   int         not null,
    primary key (id_product, id_order)
);

--menambahkan foreign key pada table orders_detail, dari id_product table orders_detail, ke id di table products
alter table orders_detail
    add constraint fk_orders_detail_product foreign key (id_product) references products (id);

--menambahkan foreign key pada table orders_detail, dari id_order table orders_detail, ke id di table orders
alter table orders_detail
    add constraint fk_orders_detail_order foreign key (id_order) references orders (id);

--menambahkan multiple data pada table orders
insert into orders(total)
values (1),
       (1),
       (1);

--menampilkan semua data pada table orders
select *
from orders;

--menampilkan semua data pada table products di urutkan memalui id nya
select *
from products
order by id;

--menambahkan multiple data pada table orders_detail, dengain id_order = 1
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0001', 1, 1000, 2),
       ('P0002', 1, 1000, 2),
       ('P0003', 1, 1000, 2);

--menambahkan multiple data pada table orders_detail, dengan id_order = 2
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0004', 2, 1000, 2),
       ('P0006', 2, 1000, 2),
       ('P0007', 2, 1000, 2);

--menambahkan multiple data pada table orders_detail, dengan id_order = 3
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0001', 3, 1000, 2),
       ('P0004', 3, 1000, 2),
       ('P0005', 3, 1000, 2);

--menampilkan semua data pada table orders_detail
select *
from orders_detail;

--menampilkan semua data pada table orders, dan gabungkan dengan data pada table products dan table orders_detail
--pada table products melalui id di table produk dan id_produk pada table orders_detail
--pada table orders_detail melalui id di table orders dan id_order pada table orders_detail
select *
from orders
         join orders_detail on orders_detail.id_order = orders.id
         join products on orders_detail.id_product = products.id;

--menampilkan semua data pada table orders, di gabung table products dan table orders_detail, tapi id_order table orders = 3
select *
from orders
         join orders_detail on orders_detail.id_order = orders.id
         join products on orders_detail.id_product = products.id
where orders.id = 3;

--menambahkan data pada table categories
insert into categories (id, name)
VALUES ('C0003', 'Gadget'),
       ('C0004', 'Laptop'),
       ('C0005', 'Pulsa');

--menampilkan semua data pada table categories
select *
from categories;

--menampilkan semua data pada table products
select *
from products;

--menambahkan multiple data pada table products
insert into products(id, name, price, quantity)
values ('X0001', 'Contoh 1', 10000, 100),
       ('X0002', 'Contoh 2', 10000, 100);

--inner join adalah akan menampikan data yang memiliki relasi, jika tidak maka tidak di tampilkan
--menampilkan semua data di category dan di inner joinkan dengan table products
--melalui id_category pada table products dan id pada table categories
select *
from categories
         inner join products on products.id_category = categories.id;

--left join adalah akan menampikan semua data di categories, dan jika tidak ada data di products maka data di categoriesnya di tampilkan null
--menampilkan semua data di category dan di left joinkan dengan table products
--melalui id_category pada table products dan id pada table categories
select *
from categories
         left join products on products.id_category = categories.id;

--right join adalah akan menampikan semua data di products, dan jika tidak ada data di categories maka data di productsnya di tampilkan null
--menampilkan semua data di category dan di right joinkan dengan table products
--melalui id_category pada table products dan id pada table categories
select *
from categories
         right join products on products.id_category = categories.id;

--full join adalah akan menampikan semua data di categories dan products, jika tidak ada data di categories dan products maka data di categoriesnya dan productsnya di tampilkan null
--menampilkan semua data di category dan di full joinkan dengan table products
--melalui id_category pada table products dan id pada table categories
select *
from categories
         full join products on products.id_category = categories.id;

--menampilan rata rata data price dari table products
select avg(price)
from products;

--menampilan data price yang lebih dari rata rata price dari table products
select *
from products
where price > (select avg(price) from products);

--menampilkan semua data pada table products
select *
from products;

--menampilkan data price terbesar pada kolom price di table kolom, melalui table categories yang di joinkan ke table products
--melalui id_category pada table products ke id pada table categories
select max(price)
from (select products.price as price
      from categories
               join products on products.id_category = categories.id) as contoh;

--membuat table guestbooks
create table guestbooks
(
    id      serial       not null,
    email   varchar(100) not null,
    title   varchar(100) not null,
    content text,
    primary key (id)
);

--menampilkan semua data pada table costomer
select *
from customer;

--menambahkan multiple data pada table guestbooks
insert into guestbooks(email, title, content)
values ('eko@pzn.com', 'feedback eko', 'ini feedback eko'),
       ('eko@pzn.com', 'feedback eko', 'ini feedback eko'),
       ('budi@pzn.com', 'feedback budi', 'ini feedback budi'),
       ('rully@pzn.com', 'feedback rully', 'ini feedback rully'),
       ('tono@pzn.com', 'feedback tono', 'ini feedback tono'),
       ('tono@pzn.com', 'feedback tono', 'ini feedback tono');

--menampilkan semua data pada table guestbooks
select *
from guestbooks;

--distinct itu menampilkan data yang tidak sama di 1 table
--menggunakan union untuk mengambil data email pada table customer dan guestbooks jika email pada table customer dan guestbooks sama maka akan di gabung menjadi satu
select distinct email
from customer
union
select distinct email
from guestbooks;

--menggunakan union all untuk mengambil data email pada table customer dan guestbooks tanpa mengaruhi data yang sama
select email
from customer
union all
select email
from guestbooks;

--menampilkan email, dan menghitung jumlahnya, dari table customer dan guestbooks yang di union all dan di aliaskan jadi contoh
--lalu groupkan agar tergabung semua emailnya
select email, count(email)
from (select email
      from customer
      union all
      select email
      from guestbooks) as contoh
group by email;

--menggunakan intersect untuk mengambil data yang sama nya saja dari kedua table, jika tidak sama tidak tampil, dan yang tampil hanya 1 data saja, tidak duplikat
select email
from customer
intersect
select email
from guestbooks;

--menggunakan except untuk mengambil data yang tidak sama dari kedua table, jika sama tidak tampil
select email
from customer
except
select email
from guestbooks;

--untuk menumpukan query menggunakan start transaction
--query tidak akan bertambah sementara sebelum di commit
--dan akan tidak bertambah dan gagal semua query ketika di rollback
start transaction;

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 2');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 3');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 4');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 5');

--akan menampilkan data sementara yang sudah di tambah tapi tidak permanent
select *
from guestbooks;

--akan mengsukseskan semua query yang di jalankan
commit;

--mulai lagi dari awal
start transaction;

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'rollback');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'rollback 2');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'rollback 3');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'rollback 4');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'rollback 5');

select *
from guestbooks;

--akan menggagalkan semua query yang di jalankan
rollback;

--menampilkan semua data pada table products
select *
from products;

--menggunakan start transaction
start transaction;

--mengubah value description pada id P0001 di table products
update products
set description = 'Mie ayam original enak'
where id = 'P0001';

--menampilkan semua data pada table products, yang memiliki id P0001
select *
from products
where id = 'P0001';

--mengsukseskan query query yang di jalankan
commit;

--menggunakan start transaction
start transaction;

--locking / menggunakan for update agar memberitahu kalo kita mau update
--jadi orang lain yang menggunakan db kita tidak bisa di update terlebih dahulu sebelum di rollback dan di commit
select *
from products
where id = 'P0001' for update;

--menggagalkan semua query yang di jalankan
rollback;

--menampilkan semua data pada table products, yang memiliki id P0001
select *
from products
where id = 'P0001';

--menggunakan start transaction
start transaction;

--contoh deadlock
--menggunakan for update di terminal ini, tapi orang lain juga menggunakan db ini dan locking juga
--maka akan terjadi saling menunggu, lalu ketika saling menunggu keduanya maka akan terjadi deadlock
--maka salah satunya akan di gagalkan

--locking agar tidak bisa di ubah terlebih dahulu pada id P0001
select *
from products
where id = 'P0001' for update;

--locking agar tidak bisa di ubah terlebih dahulu pada id P0002
select *
from products
where id = 'P0002' for update;

--menggagalkan semua query yang di jalankan
rollback;

--schema kalo di postgresql, schema ini di luar dari table, schema yang di gunakan adalah public

--mengetahui schema yang di gunakan
select current_schema();

--membuat schema baru dengan nama contoh
create schema contoh;

--menghapus schema contoh, jika di hapus maka isinya juga terhapus
drop schema contoh;

--cara pindah schema dari public ke contoh
SET search_path TO contoh;

--mengetahui schema yang di gunakan
select current_schema();

--mengetahui semua data pada table products di schema public
select *
from public.products;

--membuat table products di schema contoh
create table contoh.products
(
    id   serial       not null,
    name varchar(100) not null,
    primary key (id)
);

--menampilkan semua data pada table products di schema contoh
select * from contoh.products;

--menggunakan schema public
SET search_path TO public;

--menambahkan data pada table products di schema contoh
insert into contoh.products(name)
values ('iphone'),
       ('Play Station');

--menampilkan semua data pada table products di schema contoh
select * from contoh.products;

-- membuat role / user dengan nama eko
create role eko;

-- membuat role / user dengan nama budi
create role budi;

--menghapus role / user dengan nama eko
drop role eko;

--menghapus role / user dengan nama budi
drop role budi;

--role / user eko bisa login dan memiliki password yaitu rahasia
alter role eko login password 'rahasia';

--role / user budi bisa login dan memiliki password yaitu rahasia
alter role budi login password 'rahasia';

-- memberi akses oleh role / user eko pada semua table di schema public untuk insert, update, dan select
grant insert, update, select on all tables in schema public to eko;

-- memberi akses oleh role / user eko untuk usage, select, dan update di guestbooks_id_seq / id primary key pada table guestbooks
grant usage, select, update ON guestbooks_id_seq TO eko;

-- memberi akses oleh role / user budi pada table customer untuk insert, update, dan select
grant insert, update, select on customer to budi;

-- cara backup database
-- pg_dump --host=localhost --port=5432 --username=postgres --dbname=belajar --format=plain --file=Users/luthf/Documents/postgres.sql

-- membuat database baru dengan nama belajar_restore, untuk merosorce database yang di backup
create database belajar_restore;

-- cara restore database
-- pg_restore --host=localhost --port=5432 --username=postgres --dbname=belajar_restore --format=plain --file=Users/luthf/Documents/postgres.sql
