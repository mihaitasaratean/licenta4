CREATE TABLE `fish` (
	`idFish` INT NOT NULL AUTO_INCREMENT,
	`fishName` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`fkBaitType` INT NOT NULL,
	PRIMARY KEY (`idFish`)
);

CREATE TABLE `lake` (
	`idLake` INT NOT NULL AUTO_INCREMENT,
	`lakeName` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`fkFish` INT NOT NULL,
	PRIMARY KEY (`idLake`)
);

CREATE TABLE `fishingType` (
	`idType` INT NOT NULL AUTO_INCREMENT,
	`fishingName` VARCHAR(255) NOT NULL,
	`fkBait` INT NOT NULL,
	PRIMARY KEY (`idType`)
);

CREATE TABLE `bait` (
	`idBait` INT NOT NULL AUTO_INCREMENT,
	`baitName` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`idBait`)
);

CREATE TABLE `fishSize` (
	`idFish` INT NOT NULL,
	`minWeight` DECIMAL NOT NULL,
	`maxWeight` DECIMAL NOT NULL,
	`fkLake` INT NOT NULL,
	`uom` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`idFish`)
);

ALTER TABLE `fish` ADD CONSTRAINT `fish_fk0` FOREIGN KEY (`fkBaitType`) REFERENCES `fishingType`(`idType`);

ALTER TABLE `lake` ADD CONSTRAINT `lake_fk0` FOREIGN KEY (`fkFish`) REFERENCES `fish`(`idFish`);

ALTER TABLE `fishingType` ADD CONSTRAINT `fishingType_fk0` FOREIGN KEY (`fkBait`) REFERENCES `bait`(`idBait`);

ALTER TABLE `fishSize` ADD CONSTRAINT `fishSize_fk0` FOREIGN KEY (`fkLake`) REFERENCES `lake`(`idLake`);
