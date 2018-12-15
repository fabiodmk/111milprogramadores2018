/*
SCRIPT DE CREACION BASE DE DATOS AGRO
*/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE DATABASE agro;

CREATE SCHEMA IF NOT EXISTS `agro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `agro`;

-- -----------------------------------------------------
-- Table `agro`.`Empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Empresa` (
  `idEmpresa` INT NOT NULL ,
  `empresa` VARCHAR(50) NULL ,
  `descripcion` VARCHAR(250) NULL ,
  `fechaDesde` DATETIME NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NULL ,
  PRIMARY KEY (`idEmpresa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`Pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Pais` (
  `idPais` INT NOT NULL ,
  `pais` VARCHAR(45) NULL ,
  `anulado` INT NULL ,
  PRIMARY KEY (`idPais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`Provincia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Provincia` (
  `idProvincia` INT NOT NULL ,
  `provincia` VARCHAR(45) NULL ,
  `idPais` INT NULL ,
  `anulado` INT NULL ,
  PRIMARY KEY (`idProvincia`) ,
  INDEX `FK_Pais` (`idPais` ASC) ,
  CONSTRAINT `FK_Pais`
    FOREIGN KEY (`idPais` )
    REFERENCES `agro`.`Pais` (`idPais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`Ciudad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Ciudad` (
  `idCiudad` INT NOT NULL ,
  `ciudad` VARCHAR(45) NULL ,
  `idProvincia` INT NULL ,
  `anulado` INT NULL ,
  PRIMARY KEY (`idCiudad`) ,
  INDEX `FK_Provincia` (`idProvincia` ASC) ,
  CONSTRAINT `FK_Provincia`
    FOREIGN KEY (`idProvincia` )
    REFERENCES `agro`.`Provincia` (`idProvincia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`Campo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Campo` (
  `idCampo` INT NOT NULL ,
  `idCiudad` INT NULL ,
  `idEmpresa` INT NULL ,
  `campo` VARCHAR(50) NOT NULL ,
  `descripcion` VARCHAR(250) NULL ,
  `superficie` DECIMAL(3,2) NOT NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NULL DEFAULT 0 ,
  PRIMARY KEY (`idCampo`) ,
  INDEX `FK_Ciudad` (`idCiudad` ASC) ,
  INDEX `FK_Empresa` (`idEmpresa` ASC) ,
  CONSTRAINT `FK_Ciudad`
    FOREIGN KEY (`idCiudad` )
    REFERENCES `agro`.`Ciudad` (`idCiudad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Empresa`
    FOREIGN KEY (`idEmpresa` )
    REFERENCES `agro`.`Empresa` (`idEmpresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`TipoSuelo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`TipoSuelo` (
  `idTipoSuelo` INT NOT NULL ,
  `tipoSuelo` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idTipoSuelo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`Lote`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Lote` (
  `idLote` INT NOT NULL ,
  `idCampo` INT NOT NULL ,
  `idTipoSuelo` INT NOT NULL ,
  `idLotePadre` INT NULL ,
  `nroLote` INT NOT NULL ,
  `superficie` DECIMAL(3,2) NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idLote`) ,
  INDEX `FK_Campo` (`idCampo` ASC) ,
  INDEX `FK_Lote` (`idLotePadre` ASC) ,
  INDEX `FK_TipoSuelo` (`idTipoSuelo` ASC) ,
  CONSTRAINT `FK_Campo`
    FOREIGN KEY (`idCampo` )
    REFERENCES `agro`.`Campo` (`idCampo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Lote`
    FOREIGN KEY (`idLotePadre` )
    REFERENCES `agro`.`Lote` (`idLote` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TipoSuelo`
    FOREIGN KEY (`idTipoSuelo` )
    REFERENCES `agro`.`TipoSuelo` (`idTipoSuelo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`TipoCultivo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`TipoCultivo` (
  `idTipoCultivo` INT NOT NULL ,
  `tipoCultivo` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(250) NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idTipoCultivo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`TipoCultivoxTipoSuelo`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `agro`.`TipoCultivoxTipoSuelo` (
  `idTipoCultivoxTipoSuelo` INT NOT NULL ,
  `idTipoSuelo` INT NOT NULL ,
  `idTipoCultivo` INT NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idTipoCultivoxTipoSuelo`))
  
  ALTER TABLE agro.tipocultivoxtiposuelo ADD CONSTRAINT tipocultivoxtiposuelo_tiposuelo_fk FOREIGN KEY (idTipoSuelo) REFERENCES agro.tiposuelo(idTipoSuelo);
  ALTER TABLE agro.tipocultivoxtiposuelo ADD CONSTRAINT tipocultivoxtiposuelo_tipocultivo_fk FOREIGN KEY (idTipoCultivo) REFERENCES agro.tipocultivo(idTipoCultivo);


-- -----------------------------------------------------
-- Table `agro`.`Estado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Estado` (
  `idEstado` INT NOT NULL ,
  `tiEstado` VARCHAR(45) NOT NULL ,
  `estado` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idEstado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agro`.`CampoEstado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`CampoEstado` (
  `idCampoEstado` INT NOT NULL ,
  `idCampo` INT NOT NULL ,
  `idEstado` INT NOT NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idCampoEstado`) )
  
ALTER TABLE agro.campoestado ADD CONSTRAINT fk_campoestado_campo FOREIGN KEY (idCampo) REFERENCES agro.campo(idCampo);
ALTER TABLE agro.campoestado ADD CONSTRAINT fk_campoestado_estado FOREIGN KEY (idEstado) REFERENCES agro.estado(idEstado);

-- -----------------------------------------------------
-- Table `agro`.`Cultivo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Cultivo` (
  `idCultivo` INT NOT NULL ,
  `idTipoCultivo` INT NOT NULL ,
  `idCampo` INT NOT NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idCultivo`))
  
ALTER TABLE agro.cultivo ADD CONSTRAINT fk_cultivo_tc FOREIGN KEY (idTipoCultivo) REFERENCES agro.tipocultivo(idTipoCultivo);
ALTER TABLE agro.cultivo ADD CONSTRAINT fk_cultivo_campo FOREIGN KEY (idCampo) REFERENCES agro.campo(idCampo);

-- -----------------------------------------------------
-- Table `agro`.`CultivoEstado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`CultivoEstado` (
  `idCultivoEstado` INT NOT NULL ,
  `idCultivo` INT NOT NULL ,
  `idEstado` INT NOT NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idCultivoEstado`));

ALTER TABLE agro.cultivoestado ADD CONSTRAINT fk_cultivoestado_cultivo FOREIGN KEY (idCultivo) REFERENCES agro.cultivo(idCultivo);
ALTER TABLE agro.cultivoestado ADD CONSTRAINT fk_cultivoestado_estado FOREIGN KEY (idEstado) REFERENCES agro.estado(idEstado);

-- -----------------------------------------------------
-- Table `agro`.`TipoLaboreo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`TipoLaboreo` (
  `idTipoLaboreo` INT NOT NULL ,
  `idTipoCultivo` INT NOT NULL ,
  `tipoLaboreo` VARCHAR(45) NOT NULL ,
  `momento` VARCHAR(45) NOT NULL ,
  `orden` INT NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idTipoLaboreo`));

ALTER TABLE agro.tipolaboreo ADD CONSTRAINT fk_tipolaboreo_tc FOREIGN KEY (idTipoCultivo) REFERENCES agro.tipocultivo(idTipoCultivo);

-- -----------------------------------------------------
-- Table `agro`.`Laboreo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Laboreo` (
  `idLaboreo` INT NOT NULL ,
  `idTipoLaboreo` INT NOT NULL ,
  `idCultivo` INT NOT NULL ,
  `ordenLaboreo` INT NOT NULL ,
  `laboreo` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(250) NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `fechaDesde` DATETIME NOT NULL ,
  `fechaHasta` DATETIME NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idLaboreo`));

ALTER TABLE agro.laboreo ADD CONSTRAINT fk_laboreo_tl FOREIGN KEY (idTipoLaboreo) REFERENCES agro.tipolaboreo(idTipoLaboreo);
ALTER TABLE agro.laboreo ADD CONSTRAINT fk_laboreo_cultivo FOREIGN KEY (idCultivo) REFERENCES agro.cultivo(idCultivo);

-- -----------------------------------------------------
-- Table `agro`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `agro`.`Usuario` (
  `idUsuario` INT NOT NULL ,
  `usuario` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `registrationDate` DATETIME NOT NULL ,
  `anulado` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`idUsuario`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
