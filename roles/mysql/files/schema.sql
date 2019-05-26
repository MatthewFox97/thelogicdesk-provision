SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  `description` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `contact_num` varchar(13) NOT NULL,
  PRIMARY KEY (`ticket_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO  `tickets` SET `ticket_no` = 1,`title` = 'test ticket',`status` = 'open',`description` = 'this is a test ticket ',`username` = 'mattfox',`contact_num` = '07768004485';
INSERT IGNORE INTO  `tickets` SET `ticket_no` = 2,`title` = 'test ticket',`status` = 'open',`description` = 'this is a test ticket rekgj;gsodfnosinonbdfnbonfdsinbsdfoin',`username` = 'mattfox',`contact_num` = '07768004485';
INSERT IGNORE INTO  `tickets` SET `ticket_no` = 3,`title` = 'ergtdfrfsa',`status` = 'complete',`description` = 'sdfg',`username` = 'ssgf',`contact_num` = 'sdfg';

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `tele` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `users` SET `id` = 23,`firstname` = '',`surname` = '',`tele` = '',`username` = 'mattfox',`email` = 'matthew.fox97@gmail.com',`password` = '098f6bcd4621d373cade4e832627b4f6',`user_type` = 'admin';
INSERT IGNORE INTO `users` SET `id` = 25,`firstname` = '',`surname` = '',`tele` = '',`username` = 'katrina',`email` = 'katrina@gmail.com',`password` = '098f6bcd4621d373cade4e832627b4f6',`user_type` = 'customer'; 
INSERT IGNORE INTO `users` SET `id` = 26,`firstname` = '',`surname` = '',`tele` = '',`username` = 'tony',`email` = 'tony@gmail.com',`password` = '098f6bcd4621d373cade4e832627b4f6',`user_type` = 'engineer';
INSERT IGNORE INTO `users` SET `id` = 27,`firstname` = '',`surname` = '',`tele` = '',`username` = 'gareth',`email` = 'gareth@gmail.com',`password` = '098f6bcd4621d373cade4e832627b4f6',`user_type` = 'engineer'; 