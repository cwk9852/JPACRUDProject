
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `inventorydb`;

CREATE SCHEMA IF NOT EXISTS `inventorydb` DEFAULT CHARACTER SET utf8 ;
USE `inventorydb` ;

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`description` varchar(450) DEFAULT NULL,
`price` decimal(6,2) NOT NULL,
`qty` int(11) NOT NULL,
`img` varchar(4500) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


SET SQL_MODE = '';
DROP USER IF EXISTS inventoryuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'inventoryuser'@'localhost' IDENTIFIED BY 'inventoryuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'inventoryuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (1,'Classic Chai','This warm, piquant, and delightful blend was formerly known as Oregon Chai. A great alternative for those who wish to avoid large amounts of caffeine, sugar, and dairy products, which are commonly found in commercial Chai products. A delicious beverage that is sure to tickle your taste buds! Contains Caffeine.\n\n',9.99,15,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_VCH_-00_loose-leaf-tea-vanilla-chai.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (2,'Firelight Chai','A warm, piquant, and delightful caffeine free herbal Chai. Great for Chai lovers who do not need the caffeine boost. A slightly smoother flavor than traditional black tea based Chai teas, this exotic beverage that is sure to tickle your taste buds while leaving a semi-sweet linger to the palate! \n',14.99,10,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/t/o/tolsll_othind_-indian-spiced-chai-tea-loose-leaf.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (3,'Guayusa Tea','Guayusa is the dried leaves and stems of a South American rainforest holly which is a close botanical relative to Yerba Mate. Traditionally, the indigenous cultures of Ecuador boiled guayusa leaves in water and drank the tea for its stimulating effects. This rich tea has a full bodied green taste that has a slight grassy character.\n\n',12.50,9,'https://www.englishteastore.com/media/catalog/product/cache/6/image/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_OTHANG_-Angels-Dream-loose-leaf.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (4,'Holy Basil Chai','Much of the diverse character of this unique chai is derived from generous amounts of holy basil, an important Ayurvedic herb that is responsible for the sweet floral flavor. In addition to the traditional warming chai herbs, long peppers and fennel seed combine to impart a distinctive flavor that you won’t soon forget.\n\n',12.50,7,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/t/o/tolsll_grnchi_chai-green-tea-loose-leaf-tea.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (5,'Mint Chocolate Mate','This refreshingly smooth blend has just the right amount of kick. Think peppermint patty in a cup! The initial bright minty flavor and aroma transforms into a delightful combination of mate and cacao. A rich cup of tea that could easily be considered a dessert.\n\n',12.99,11,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_CHO_-00_loose-leaf-tea-chocolate-orange.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (6,'Tropical Guayusa Tea','This incredibly smooth and festive brew will melt away your troubles, allowing you to experience a mellow mood. The organic Guayusa leaves give this brew a subtle kick, their flavor balanced perfectly with generous additions of organic Lemongrass. The organic Coconut flavor and Coconut flakes create a distinctively tropical feel, infusing a bit of Caribbean flair into your day.\n\n',10.99,5,'https://www.englishteastore.com/media/catalog/product/cache/6/image/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_HCR_-00_loose-leaf-tea-rooibos-hawaiian-colada.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (7,'Turmeric Chai','This is a spicy and warming caffeine free herbal chai. This is a perfect tea for Chai enthusiasts who wish to avoid the caffeine boost. The turmeric gives this brew an exotic, piquant flavor that lingers on the taste buds while also highlighting the other earthy spices in this blend. The added pinch of cayenne really gives this blend a spicy bite! It brews well in water, and is extra tasty with a bit of your favorite milk.\n\n',9.99,8,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_CHT_-00_Chocolate-Flavored-Black-Tea-Loose-Leaf.jpg');
INSERT INTO `product` (`id`,`name`,`description`,`price`,`qty`,`img`) VALUES (8,'Yerba Mate','Yerba Mate is a lightly stimulating beverage from South America that has a mild amount of caffeine with just the right kick. Our Yerba Mate is organically grown, fair trade certified by IMO, and produces a light green beverage, with a refreshingly bold flavor. This Yerba mate is untreated and contains no filler or flavoring agents, just pure organic Yerba Mate leaves. Contains caffeine.\n\n',13.99,10,'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_GYM_-00_green-yerba-mate-herbal-Tea-Loose-Leaf.jpg');
