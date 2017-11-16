-- 
-- change the cms_db, cms_user, cms_pawd, as you want
--

CREATE database IF NOT EXISTS cms_db Character SET UTF8;
CREATE user 'cms_user'@'localhost' identified by 'cms_pawd';
grant all privileges on cms_db.* to cms_user@localhost identified by 'cms_pawd';
flush privileges;

use cms_db;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


--
-- `category`
--
CREATE TABLE `category` (
  `cid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `follow` int(11) NOT NULL default '0',
  `number` tinyint(5) NOT NULL default '0',
  `name` varchar(20) NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `category` (`cid`, `uid`, `follow`, `number`, `name`) VALUES
(1, 1, 0, 0, 'home'),
(2, 1, 0, 0, 'news'),
(3, 1, 0, 0, 'show');


--
-- `file`
--
CREATE TABLE `file` (
  `fid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `name` varchar(50) NOT NULL,
  `path` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- `record`
--
CREATE TABLE `record` (
  `rid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `follow` int(11) NOT NULL default '0',
  `useful` int(5) NOT NULL default '0',
  `content` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`rid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;


INSERT INTO `record` (`rid`, `uid`, `cid`, `follow`, `useful`, `content`, `created`) VALUES
(1, 1, 1, 0, 0, 'About the cms.\r\r\nThis is a cms created by php, we devote to simplicity, rudeness.', '2017-05-25 16:26:45'),
(2, 1, 1, 0, 0, 'About the user.', '2017-05-25 16:28:14'),
(3, 1, 1, 2, 0, 'About the post.\r\n\r\nAllow post 50 records for user everyday.', '2017-05-27 11:24:53'),
(4, 1, 1, 2, 0, 'About the comment.\r\nAllow post 50 comments for guest everyday.', '2017-05-27 11:24:53');


--
-- `record_log`
--
CREATE TABLE `record_log` (
  `rlid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `rid` int(11) NOT NULL,
  `ukey` varchar(50) NOT NULL,
  `uval` varchar(100) NOT NULL,
  PRIMARY KEY  (`rlid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


--
-- `user`
--
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


INSERT INTO `user` (`uid`, `username`, `password`, `level`) VALUES
(1, 'zcadmin', '8888', 9),
(2, 'zcedit', '8888', 6),
(3, 'test', '8888', 3),
(4, 'viewer', '8888', 1);


--
-- `user_log`
--
CREATE TABLE `user_log` (
  `ulid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `ukey` varchar(50) NOT NULL,
  `uval` varchar(100) NOT NULL,
  PRIMARY KEY  (`ulid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


INSERT INTO `user_log` (`ulid`, `uid`, `ukey`, `uval`) VALUES
(1, 1, 'open_comment', 'on'),
(2, 1, 'open_register', 'on'),
(3, 1, 'last_post_ip', '127.0.0.1'),
(4, 1, 'last_post_time', '1'),
(5, 1, 'web_logo', '12345.jpg'),
(6, 1, 'web_des', 'It is a cms, we devote to simplicity, rudeness.'),
(7, 1, 'web_header', 'New site'),
(8, 1, 'web_title', 'New site'),
(9, 1, 'allow_post_by_guest', '50'),
(10, 1, 'allow_post_by_user', '50'),
(11, 1, 'allow_register_number', '50');


--
-- `user_status`
--
CREATE TABLE `user_status` (
  `usid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `exptime` varchar(20) NOT NULL,
  `token` varchar(50) NOT NULL,
  PRIMARY KEY  (`usid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


