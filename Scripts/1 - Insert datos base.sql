/*
 * Script para poblar las tablas principales de la base de datos (tablas base)
 * */

use agro;

INSERT INTO agro.empresa (idEmpresa,empresa,descripcion,fechaDesde,fechaHasta,anulado) VALUES 
(1,'Agro SRL','Consignataria de campos de la provincia de Cordoba','2018-12-01 00:00:00.000','2099-12-31 00:00:00.000',0);

INSERT INTO agro.pais (idPais,pais,anulado) VALUES 
(1,'Argentina',0);

INSERT INTO agro.provincia (idProvincia,provincia,idPais,anulado) VALUES 
(1,'Cordoba',1,0);

INSERT INTO agro.ciudad (idCiudad,ciudad,idProvincia,anulado) VALUES 
(1,'Cordoba',1,0);

INSERT INTO agro.usuario (idUsuario,usuario,password,registrationDate,anulado) VALUES 
(1,'fabio','fabio','2018-10-12 00:00:00.000',0);

INSERT INTO agro.estado (idEstado,tiEstado,estado,descripcion,anulado) VALUES 
(1,'1','Creado','Campo: estado inicial',0)
,(2,'1','Parcialmente trabajado','Campo: al menos 1 lote con cultivo',0)
,(3,'1','Completamente trabajado','Campo: todos sus lotes con cultivo',0)
,(4,'1','Desuso','Campo: ningun lote tiene proyectos de cultivo',0)
,(5,'2','Preparacion','Cultivo: 1° estado',0)
,(6,'2','Siembra','Cultivo: 2° estado',0)
,(7,'2','Abandonado','Cultivo: estado de cancelacion',0)
,(8,'2','Post Siembra','Cultivo: 3° estado',0)
,(9,'2','Cosecha','Cultivo: estado final',0);

INSERT INTO agro.tipocultivo (idTipoCultivo,tipoCultivo,descripcion,fechaDesde,fechaHasta,anulado) VALUES 
(1,'Soja','Soja','2018-01-01 00:00:00.000',NULL,0)
,(2,'Mani','Mani','2018-01-01 00:00:00.000',NULL,0)
,(3,'Girasol','Girasol','2018-01-01 00:00:00.000',NULL,0);

INSERT INTO agro.tiposuelo (idTipoSuelo,tipoSuelo,descripcion,fechaDesde,fechaHasta,anulado) VALUES 
(1,'Tipo 1','Tipo 1','2018-01-01 00:00:00.000',NULL,0)
,(2,'Tipo 2','Tipo 2','2018-01-01 00:00:00.000',NULL,0)
,(3,'Tipo 3','Tipo 3','2018-01-01 00:00:00.000',NULL,0)
,(4,'Tipo 4','Tipo 4','2018-01-01 00:00:00.000',NULL,0)
,(5,'Tipo 5','Tipo 5','2018-01-01 00:00:00.000',NULL,0);

INSERT INTO agro.tipolaboreo (idTipoLaboreo,idTipoCultivo,tipoLaboreo,momento,orden,fechaDesde,fechaHasta,anulado) VALUES 
(1,1,'Arar','Antes',1,'2018-01-01 00:00:00.000',NULL,0)
,(2,1,'Rastrillar','Antes',2,'2018-01-01 00:00:00.000',NULL,0)
,(3,1,'Sembrar','Antes',3,'2018-01-01 00:00:00.000',NULL,0)
,(4,1,'Escandillar','Antes',4,'2018-01-01 00:00:00.000',NULL,0)
,(5,1,'Cosechar','Antes',5,'2018-01-01 00:00:00.000',NULL,0);






