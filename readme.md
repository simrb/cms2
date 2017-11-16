About
============

Just a CMS by php programming language, we dedicate to make it to simplicity and rudeness.

The base feature as following,

	add the menu on front page,
	allow upload picture in adding post,
	allow the guest to register be user.



Setup
============

initialing the project environment and database by default database, username, userpawd

	# su
	# sh .setup -ed

or, set your custom by options `-h, -n, -u, -p`

	# sh .setup -ed -n db_name -u username -p password

if you have an existed database, just configure the file `cfg.php` for connecting.



Migrating
============

1 backup your db, such as

	# mysqldump --database cms_db > archive/mydb_bak_201708.sql

2 backup the dir, such as

	# tar -cvf mydoc.tar mydoc/

untar

	# tar -xvf mydoc.tar



History
============

Ver.r2, by linyu deng, at 10/24,2017

base on the last version, we add new feature that facing to web2.0, it let the user register.

Ver.r1, by linyu deng, at 11/11,2016

initialing the project, the first version is built.



License
============

[MIT](https://opensource.org/licenses/MIT)




