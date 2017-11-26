-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.2.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '0',
  `content` text NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT 0,
  `intro` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (10,6,'从 MySQL Workbench 的 ER 设计图导出 Laravel 迁移文件',' 要说数据库的设计工具，我用过最好用的就是 MySQL Workbench 了（ MySql 自己产品，免费使用 ），别的不多说，看下图我的项目的 ER 设计图就知道了（注意左上角小地图，能看到稍微上点规模的项目的数据库设计是非常方便的）：\r\n\r\n![图片](https://dn-phphub.qbox.me/uploads/images/201611/19/161/Qu4PtsMOyg.png)\r\n\r\n过去我是这样做：先设计好数据库，然后自己通过 sublime 的多光标编辑来快速编辑得到很多的数据库迁移命令，最后通过 Jeffrey 的迁移命令扩展包快速生成迁移文件。不然的话要类似，即便如此，也要花费我一天到两天时间来导出和核对。效果如下：\r\n#file\r\n\r\n现在可以这样批量导出：\r\n\r\n\r\n\r\nMySQL Workbench 的 Laravel 导出插件非常简单：\r\n\r\n    安装插件 https://github.com/beckenrode/mysql-workbench-export-laravel-5-migrations\r\n    新建或者打开已有的 Model\r\n    Tools -> Catalog -> Export Laravel 5 Migration\r\n\r\n设计数据库非 Mysql Workbench 不可。不过后续日常使用还是 Sequel Pro，因为快，方便，简洁。:swimmer: ',1508923091,'要说数据库的设计工具，我用过最好用的就是 MySQL Workbench 了（ MySql 自己产品，免费使用 ），别的不多说，看下图我的项目的 ER 设计图就知道了（注意左上角小地图，能看到稍微上点规模的项目的数据库设计是非常方便的）： 过去我是这样做：先设计好数据库，然后自己通过 sublime 的多光标编辑来快速编辑得到很多的数据库迁移命令，最后通过 Jeffrey 的迁移命令扩展包快速生成迁移文件。不然的话要类似，即便如此，也要花费我一天到两天时间来导出和核对。效果如下：»'),(11,7,'5分钟配置并使用 Elasticsearch','',1508923397,'简介 Elasticsearch是一个基于Apache Lucene(TM)的开源搜索引擎。无论在开源还是专有领域，Lucene可以被认为是迄今为止最先进、性能最好的、功能最全的搜索引擎库。 1.分布式的实时文件存储，每个字段都被索引并可被搜索 2.分布式的实时分析搜索引擎 3.可以扩展到上百台服务器，处理PB级结构化或非结构化数据 其实，最重要的是 2016/9/2 taylorotwell 合并了社区对 Elasticsearch 的拓展支持功能，让我们广大 laravelers 能更加方便的使用这么好的搜索引擎，这个 PR 我关注了快一个月，终于合并到新版本了，让我感受到了开源的无限魅力，还有什么比这更幸福的事情吗？ 废话不多说，开始配置环境，准备解放生产力！ 以下内容来自 Mac OS 系统，Homestead ubun......»'),(12,6,'选择合适的 MySQL 日期时间类型来存储你的时间','',1508923421,'构建数据库写程序避免不了使用日期和时间，对于数据库来说，有多种日期时间字段可供选择，如 timestamp 和 datetime 以及使用 int 来存储 unix timestamp。 不仅新手，包括一些有经验的程序员还是比较迷茫，究竟我该用哪种类型来存储日期时间呢？ 那我们就一步一步来分析他们的特点，这样我们根据自己的需求选择合适的字段类型来存储 (优点和缺点是比较出来的 :smile: , 跟父母从小喜欢拿邻居小孩子跟自己比一样的) datetime 和 timestamp datetime 更像日历上面的时间和你手表的时间的结合，就是指具体某个时间。 timestamp 更适合来记录时间，比如我在东八区时间现在是 2016-08-02 10:35:52， 你在日本（东九区此时时间为 2016-08-02 11:35:52），我和你在聊天，数据库记录了时间......»'),(13,8,'Fira Code 一个程序员专供的字体','',1508923464,'大家都有自己喜欢的主题，编辑器（对于IDE来说大家应该都是 PHPStorm 了）、字号、行间距等等个性化设置。今天给大家推荐一款程序员字体，叫做 Fira code。 在我们写程序的时候，经常会用到 -> => :: >= .= += 等超过一个字符的操作符，但是这个操作符其实只有一个含义，按照常理来说，既然表达一个含义那么占一个位置也是理所应当的。这就是 Fira code 的目的了。 Fira code 其实基于 Fira Mono 字体，然后对操作符做了特殊处理，这样更符合通常的阅读习惯（虽然早已习惯了两个字符表示一个含义）。 废话不多说，上图»'),(14,9,'用 Laravel 拥抱异常','',1508923516,'令人讨厌的异常 提起异常，大家都很反感，当信心满满的写完一段代码，刷新也没发现上面写着大大的 Exception 是最心烦的时候了。模块给领导演示的时候，如果报了异常，也是最让人崩溃的时候了。 既然这样，我为什么要说拥抱异常呢？ 其实异常并没有大家想象的那么可怕，异常其实非常简单，如果你的程序里面很少有抛出异常的代码，我相信你看了下面的分析，你会爱上异常的。 什么是异常 异常是运行中超出了你程序预期的一个东西。 异常就是一个意外，影响了你的程序正常运行。但是如果你用好异常，会让你的程序便于解耦，结构更加清晰明了。 如何使用异常 在 Laravel 中已经定义了很多异常，例如 ModelNotFoundException AuthorizationException MassAssignmentException HttpResponse......»'),(15,10,'获取银行卡信息','',1508923884,'Bank card info 根据银行卡号获取银行信息（银行名称, 信用卡/借记卡, 银行LOGO 等）, 供任何 PHP 框架或者原生代码使用. 做涉及到金融项目的时候，难免和银行卡打交道，还记得在支付宝上给同学同志同事女朋友打钱的时候，当你输入完银行卡号的时候自动帮你选择好银行卡的小细节吗？当你给信用卡还款的时候，能自动判断出是信用卡还是储蓄卡。如此贴心的功能，你值得拥有！ BankCard::info(\'6225700000000000\'); // 将得到 array (size=6) \'val......»');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('NCCgF4Duxs6CmJDyKkvmQSe8NzXnv8q4',1509025927,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"admin\":{\"id\":25,\"username\":\"xxxxxx\",\"password\":\"96e79218965eb72c92a549dd5a330112\",\"age\":23,\"sex\":1,\"phone\":\"13463832257\",\"addtime\":1508898783,\"photo\":\"0\"}}'),('TMzkLsEsozNkcvPvt9zHm3zhsZambP2x',1509085860,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"code\":8883}'),('UbClvptJnXmXMbeQxUA99cWsdYIeh4eH',1509007564,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"admin\":{\"id\":25,\"username\":\"xxxxxx\",\"password\":\"96e79218965eb72c92a549dd5a330112\",\"age\":23,\"sex\":1,\"phone\":\"13463832257\",\"addtime\":1508898783,\"photo\":\"0\"},\"flash\":{}}'),('xiZN9rQKge5nBnn9PLdO6NDC5XplEk11',1509005407,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"admin\":{\"id\":25,\"username\":\"xxxxxx\",\"password\":\"96e79218965eb72c92a549dd5a330112\",\"age\":23,\"sex\":1,\"phone\":\"13463832257\",\"addtime\":1508898783,\"photo\":\"0\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (2,'HTML5',1508900876),(3,'JavaScript',1508901199),(4,'Css3',1508901210),(5,'NodeJS',1508920413),(6,'数据库',1508922662),(7,'Elasticsearch',1508923380),(8,'font',1508923447),(9,'Laravel',1508923487),(10,'其它',1508923827);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '0',
  `password` char(32) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT 0,
  `sex` tinyint(1) NOT NULL DEFAULT 0,
  `phone` char(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'song','4a60188c269ff9e104dd3fff562f4795',34,0,'15645635265',1508424452,'b962a84943321aa3e41565d0135f2572.jpeg'),(11,'songsong','b53086d558f1127993271e8c504ded45',23,0,'13463832257',1508425143,'0'),(14,'xiaoxiao','123456',23,0,'15645635265',0,'0'),(18,'song','e10adc3949ba59abbe56e057f20f883e',36,0,'13463832257',1508466687,'0'),(19,'tian','e10adc3949ba59abbe56e057f20f883e',25,0,'15645635265',1508466791,'0'),(23,'xiaozhang','e10adc3949ba59abbe56e057f20f883e',23,1,'13463832257',1508897702,'24bb7d73f9cdea82bfc542d0c969332c.jpeg'),(24,'xixixi','6537e99af2c2223642df9f70a0b5afca',12,1,'13463832257',1508898229,'0'),(25,'xxxxxx','96e79218965eb72c92a549dd5a330112',23,1,'13463832257',1508898783,'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-26 14:35:10
