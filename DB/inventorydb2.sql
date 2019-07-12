-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inventorydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `inventorydb` ;

-- -----------------------------------------------------
-- Schema inventorydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventorydb` DEFAULT CHARACTER SET utf8 ;
USE `inventorydb` ;

-- -----------------------------------------------------
-- Table `inventorydb`.`tea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`tea` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`tea` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `description` TEXT NULL,
  `price` DECIMAL(5,2) NULL,
  `kg_on_hand` DECIMAL NULL,
  `img_url` VARCHAR(4500) NULL,
  `update_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventorydb`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`category` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventorydb`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`supplier` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`supplier` (
  `id` INT NOT NULL,
  `company_name` VARCHAR(250) NOT NULL,
  `create_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventorydb`.`tea_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`tea_has_category` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`tea_has_category` (
  `category_id` INT NOT NULL,
  `tea_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `tea_id`),
  CONSTRAINT `fk_category_has_tea_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `inventorydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_tea_tea1`
    FOREIGN KEY (`tea_id`)
    REFERENCES `inventorydb`.`tea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_category_has_tea_tea1_idx` ON `inventorydb`.`tea_has_category` (`tea_id` ASC);

CREATE INDEX `fk_category_has_tea_category1_idx` ON `inventorydb`.`tea_has_category` (`category_id` ASC);


-- -----------------------------------------------------
-- Table `inventorydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`user` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `create_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventorydb`.`user_tea_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`user_tea_review` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`user_tea_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tea_id` INT NOT NULL,
  `title` VARCHAR(250) NULL,
  `review` TEXT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_has_tea_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `inventorydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_tea_tea1`
    FOREIGN KEY (`tea_id`)
    REFERENCES `inventorydb`.`tea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_has_tea_tea1_idx` ON `inventorydb`.`user_tea_review` (`tea_id` ASC);

CREATE INDEX `fk_user_has_tea_user1_idx` ON `inventorydb`.`user_tea_review` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `inventorydb`.`tea_supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorydb`.`tea_supplier` ;

CREATE TABLE IF NOT EXISTS `inventorydb`.`tea_supplier` (
  `tea_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`tea_id`, `supplier_id`),
  CONSTRAINT `fk_tea_has_supplier_tea1`
    FOREIGN KEY (`tea_id`)
    REFERENCES `inventorydb`.`tea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tea_has_supplier_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `inventorydb`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_tea_has_supplier_supplier1_idx` ON `inventorydb`.`tea_supplier` (`supplier_id` ASC);

CREATE INDEX `fk_tea_has_supplier_tea1_idx` ON `inventorydb`.`tea_supplier` (`tea_id` ASC);

SET SQL_MODE = '';
DROP USER IF EXISTS inventoryuser;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'inventoryuser' IDENTIFIED BY 'inventory';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `inventorydb`.* TO 'inventoryuser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `inventorydb`.`tea`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (1, 'Classic Chai', 'This warm, piquant, and delightful blend was formerly known as Oregon Chai. A great alternative for those who wish to avoid large amounts of caffeine, sugar, and dairy products, which are commonly found in commercial Chai products. A delicious beverage that is sure to tickle your taste buds! Contains Caffeine.', 1.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_VCH_-00_loose-leaf-tea-vanilla-chai.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (2, 'Firelight Chai', 'A warm, piquant, and delightful caffeine free herbal Chai. Great for Chai lovers who do not need the caffeine boost. A slightly smoother flavor than traditional black tea based Chai teas, this exotic beverage that is sure to tickle your taste buds while leaving a semi-sweet linger to the palate!', 2.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/t/o/tolsll_othind_-indian-spiced-chai-tea-loose-leaf.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (3, 'Guayusa Tea', 'Guayusa is the dried leaves and stems of a South American rainforest holly which is a close botanical relative to Yerba Mate. Traditionally, the indigenous cultures of Ecuador boiled guayusa leaves in water and drank the tea for its stimulating effects. This rich tea has a full bodied green taste that has a slight grassy character.', 3.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/image/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_OTHANG_-Angels-Dream-loose-leaf.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (4, 'Holy Basil Chai', 'Much of the diverse character of this unique chai is derived from generous amounts of holy basil, an important Ayurvedic herb that is responsible for the sweet floral flavor. In addition to the traditional warming chai herbs, long peppers and fennel seed combine to impart a distinctive flavor that you won’t soon forget.', 4.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/t/o/tolsll_grnchi_chai-green-tea-loose-leaf-tea.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (5, 'Mint Chocolate Mate', 'This refreshingly smooth blend has just the right amount of kick. Think peppermint patty in a cup! The initial bright minty flavor and aroma transforms into a delightful combination of mate and cacao. A rich cup of tea that could easily be considered a dessert.', 5.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_CHO_-00_loose-leaf-tea-chocolate-orange.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (6, 'Tropical Guayusa Tea', 'Tropical Guayusa Tea\',\'This incredibly smooth and festive brew will melt away your troubles, allowing you to experience a mellow mood. The organic Guayusa leaves give this brew a subtle kick, their flavor balanced perfectly with generous additions of organic Lemongrass. The organic Coconut flavor and Coconut flakes create a distinctively tropical feel, infusing a bit of Caribbean flair into your day.', 6.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/image/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_HCR_-00_loose-leaf-tea-rooibos-hawaiian-colada.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (7, 'Turmeric Chai', 'This is a spicy and warming caffeine free herbal chai. This is a perfect tea for Chai enthusiasts who wish to avoid the caffeine boost. The turmeric gives this brew an exotic, piquant flavor that lingers on the taste buds while also highlighting the other earthy spices in this blend. The added pinch of cayenne really gives this blend a spicy bite! It brews well in water, and is extra tasty with a bit of your favorite milk.', 7.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_CHT_-00_Chocolate-Flavored-Black-Tea-Loose-Leaf.jpg', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`tea` (`id`, `name`, `description`, `price`, `kg_on_hand`, `img_url`, `update_time`) VALUES (8, 'Yerba Mate', 'Yerba Mate is a lightly stimulating beverage from South America that has a mild amount of caffeine with just the right kick. Our Yerba Mate is organically grown, fair trade certified by IMO, and produces a light green beverage, with a refreshingly bold flavor. This Yerba mate is untreated and contains no filler or flavoring agents, just pure organic Yerba Mate leaves. Contains caffeine.', 8.99, 14, 'https://www.englishteastore.com/media/catalog/product/cache/6/small_image/374x/9df78eab33525d08d6e5fb8d27136e95/T/O/TOLSLL_GYM_-00_green-yerba-mate-herbal-Tea-Loose-Leaf.jpg', '2019-07-11 11:11:11');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (1, 'Green', 'Rapidly becoming a popular class of teas throughout the world, green teas are noted for their fresh flavor and green character, along with their scientifically proven health benefits. Green teas are predominantly produced throughout China, Japan, Korea and Southeast Asia during a spring growing season that runs from March through May.  Tea artisans use various methods of firing the freshly harvested tea leaves to prevent the natural oxidation process and preserve the fresh green aspect of the leaf. Green teas are the least oxidized of all the types of tea, and are categorized by the firing method and craftsmanship style as: steamed, pan-fired, oven-baked, half-roasted half-baked, new technology hot-air roasting, and sun-drying. When tasting the various types of green teas, nuances of the region, the season of harvest, the leaf style and the plucking standard become apparent. ');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (2, 'Botanical', 'Our expert tea makers hand-blend our Botanical Teas with premium organic herbs and spices\nthat we import directly from growers all over the world.\n\nWe source our herbal ingredients through critical and extensive evaluation–just as we do with our single-origin teas–by constantly cupping their seasonal character and selecting the best lots for our blends. The herbal blends in our menu contain a range of premium quality roots, fruits, flowers, seeds, barks, stems, leaves and other rare botanicals and spices that are often combined with natural plant essential oils and fruit extracts. Our herbal teas exhibit flavors and traditions from around the world and are always hand blended in micro-batches, cured for harmony and cupped before release to ensure the batch is at its prime character. ');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (3, 'Matcha', 'Matcha is a traditional Japanese green tea powder produced by stone-milling a shade-grown green tea called tencha into a fine powder. The quality of matcha greatly depends on the tea bush cultivar, shading technique and picking standard used to produce tencha. Matcha has a rich cultural tradition as the tea prepared and revered during chanoyu–the mindful, artistic, Zen-inspired Japanese Tea Ceremony. Matcha is unique among teas in that when we drink matcha, we consume the fresh green tea leaf itself, ground and whisked up into an energizing, refreshing bowl.  ');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (4, 'White', 'Rishi White tea is semi-oxidized and carefully made with a gentle process of withering, curing, and drying. Of all the types of tea, white teas are the least processed. They are characterized by delicate flavors, a smooth mouthfeel, and a subtly fruity, sweet finish.\nWhite teas tend to have less bitterness than other teas, and can be more forgiving of water temperature and infusion times than green teas. Rishi Tea offers several pure white teas as well as signature white teas blended with fragrant herbs and botanicals.\n\nMost white teas are made from medium-leaf tea bush varieties that yield silvery-white sprouts and leaves. They are delicately hand-harvested only once a year, for a few weeks in early spring when the weather is consistently cool and dry. The withering process of white tea raises an abundance of silvery-white hairs on the dried tealeaves and buds. Authentic white teas such as White Peony are multi-colored like autumn leaves, and are covered with a silver-white \"down\" that resembles the skin of a ripened peach. Silver Needle, the premier style of white tea, consists of only silvery-white sprouts shaped like needles without attached leaves. White teas take their name both from their appearance and from the original Fujian tea bush varieties selected for the production of white tea. These medium-leaf tea bushes include \"Fuding Da Hao\" (Fuding County\'s Big Silvery-Hair) and \"Fuding Da Bai\" (Fuding County\'s Big White).\n\nGeographically, white tea originated north of the Min River in China\'s Fujian Province in the town of Zhenghe. While many white teas are still produced in Zhenghe today, others are produced in nearby Fuding. In fact, over the last decade, new types of white tea have emerged in many areas outside of Fujian. One of our favorite new origins for white tea is Yunnan Province, where leaves destined to be made into white tea are harvested from ancient heirloom assamica variety trees. Depending on prevailing weather and seasonal character, Rishi Tea produces white teas in Zhenghe, Fuding, and Yunnan. We offer single farm micro-lots as well as exclusive varietal and multiple-farm blends of organic white teas.');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (5, 'Oolong', 'Oolong refers to a category of semi-oxidized teas that can only be made from certain types of tea bush varietals growing in specific geographical regions. The production methods of oolong tea are known only to a few of the tea cultivation regions in the world. \nThe oolong tea process was developed in the Fujian Province of southeastern China, within the Wuyi Mountains. It was originally called Qing Cha (bluegreen tea) and later was dubbed Oolong Cha (\"black dragon tea,\" also spelled Wulong Cha) by the 18th Century Qing Dynasty Emperor, Qianlong. Since then the world of oolong tea has expanded but the main production zones of oolong today consist of Fujian, Guangdong, and Taiwan. \n\nThe intention of the oolong maker is to partially oxidize the leaf, utilizing special withering, bruising, rolling, oxidation and repeated roasting techniques to fix the aroma and color of oolong. \n\nThe result is a tea that on the scale of leaf oxidation and infusion color is somewhere between green and black tea. Depending on the duration of oxidation, season, regional style, tea bush varietal and roast degree, the resulting infusion colors of oolong teas range from lightly oxidized bright green or golden, to more heavily oxidized hues of amber-orange, to reddish and heavily roasted dark coffee-brown. \n\nOolong tea production is the most skilled labor intensive, artisanal and sophisticated manner of tea making. Oolong tea artisans are much like boutique wine makers. Most oolong teas are sold under simple trade names (e.g., Tie Guanyin, Shui Xian, Dong Ding, Dancong) but experts categorize and understand oolong by its region, vintage, bush varietal and season of harvest, just like wine. Taking all of these factors into consideration, we can say there are hundreds of types of oolong. \n');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (6, 'Black', 'Black tea originated in China hundreds of years ago, and has since spread throughout the world\'s major tea-growing regions including India, Sri Lanka, Africa, Latin America, and elsewhere. It is the most commonly consumed category of tea in the world. \n\"Black Tea,\" as it\'s called in the West, is known as \"Hong Cha\" or \"Red Tea\" in Asia, due to its dark reddish infusion color and dark colored dried tea leaves covered with reddish-orange pekoe. Unlike green tea processing, which attempts to preserve the green color of fresh tea leaves, black tea processing encourages fresh tea leaves to oxidize and change color from green to coppery red. This change in leaf color during processing is referred to as oxidation.\n\nThe basic steps of black tea processing are picking, withering, tumbling, rolling, oxidation and drying. Based on the region, style and level of oxidation, black teas can be of a light yellow, orange, red or dark infusion color. ');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (7, 'Chai', 'Rishi travels the world following the harvests, tasting and sourcing the finest teas, herbs and spices side by side with the farmers who cultivate them. Individual herbs are chopped, crushed, ground or pounded by Rishi artisans to release their essential characters, combined in micro-batch blends, cured and harmonized according to our original masala chai tea recipes. We offer traditional, original chai tea as well as other inspired gourmet masala tea blends, including a caffeine-free chai tea. \n');
INSERT INTO `inventorydb`.`category` (`id`, `name`, `description`) VALUES (8, 'Pu\'er', 'Pu\'er tea has an ancient history of more than 2,000 years, originating in Yunnan Province of southwestern China. There are two distinct types of pu\'er: sheng pu-er (the raw or green type) and shu pu\'er (the ripened or black type). \nPu\'er is a specially fermented form of tea, and both shu and sheng pu\'er types are made from a sun-dried green tea called shaiqing mao cha. Like Champagne or other regionally specific foods and beverages, pu\'er is a geographically indicated (GI) product, and it can only be produced and fermented in Southern Yunnan with sun-dried green tea from certain tea varietals found in Yunnan, Laos, Burma and some parts of Thailand and Vietnam. Pu\'er tea, with its unique bold and earthy character, is becoming very popular all over the world as a health and wellness tea. It is regarded as a slimming and naturally safe dieter\'s tea throughout Southeast Asia, where it is an integral part of the food culture.\n\nWe offer various grades of both sheng and shu pu-erh types, all of which are tailor-made for us through our partnership project with the Organic, Fair Trade Certified™ Mannong Manmai Ancient Tea Co-op located in a 1,500 year-old tea garden in Yunnan. The sun-dried green tea produced by the Mannong Manmai Ancient Tea Co-Op for Rishi\'s organic pu-erh is fermented and produced in a USDA-NOP / EU organic certified facility in Pu-erh City, Yunnan. ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`supplier` (`id`, `company_name`, `create_date`) VALUES (1, 'Cruddy Tea Supplier', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`supplier` (`id`, `company_name`, `create_date`) VALUES (2, 'Another Tea Supplier', '2019-07-11 11:11:11');
INSERT INTO `inventorydb`.`supplier` (`id`, `company_name`, `create_date`) VALUES (3, 'Another Cruddy Supplier', '2019-07-11 11:11:11');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`tea_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (1, 1);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (1, 2);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (1, 3);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (4, 4);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (5, 6);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (7, 7);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (8, 8);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (2, 1);
INSERT INTO `inventorydb`.`tea_has_category` (`category_id`, `tea_id`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`user` (`id`, `username`, `password`, `create_date`) VALUES (1, 'webuser', 'webuser', '2019-07-11 11:11:11');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`user_tea_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`user_tea_review` (`id`, `user_id`, `tea_id`, `title`, `review`, `rating`) VALUES (1, 1, 1, 'A Review', 'This was cruddy tea', 1);
INSERT INTO `inventorydb`.`user_tea_review` (`id`, `user_id`, `tea_id`, `title`, `review`, `rating`) VALUES (2, 1, 1, 'Another Review', 'It was sooo cruddy', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorydb`.`tea_supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorydb`;
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (1, 1);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (1, 2);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (3, 1);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (4, 2);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (5, 2);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (6, 2);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (7, 3);
INSERT INTO `inventorydb`.`tea_supplier` (`tea_id`, `supplier_id`) VALUES (8, 3);

COMMIT;
