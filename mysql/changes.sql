CREATE TABLE `Alm_Almacenes` (
	`almacen_id` bigint NOT NULL AUTO_INCREMENT,
	`almacen_nombre` char(50) NOT NULL,
	`almacen_descripcion` char(200) NOT NULL,
	`almacen_nivel` int NOT NULL,
	`almacen_id_padre` bigint(200) NOT NULL,
	`almacen_permiso_cargo` BOOLEAN NOT NULL,
	`almacen_permiso_descargo` BOOLEAN NOT NULL,
	`almacen_es_logico` BOOLEAN NOT NULL,
	`almacen_acepta_puesto` BOOLEAN NOT NULL,
	PRIMARY KEY (`almacen_id`)
);

CREATE TABLE `Alm_mov_inventario` (
	`alma_mov_inv_id` bigint NOT NULL AUTO_INCREMENT,
	`alma_mov_inv_tipo` smallint NOT NULL,
	`alma_mov_inv_id_producto` bigint NOT NULL,
	`alma_mov_inv_id_cantidad` FLOAT NOT NULL,
	`alma_mov_inv_entrada` FLOAT NOT NULL,
	`alma_mov_inv_salida` FLOAT NOT NULL,
	`alma_mov_inv_id_almacen_origen` bigint,
	`alma_mov_inv_id_almacen_destino` bigint,
	`alma_mov_inv_id_usuario_proceso` bigint NOT NULL,
	`alma_mov_inv_id_usuario_aprobo` bigint NOT NULL,
	`alma_mov_inv_fecha_solicitud` DATETIME NOT NULL,
	`alma_mov_inv_fecha_aprobacion` DATETIME NOT NULL,
	`alma_mov_inv_aprobado` BOOLEAN NOT NULL,
	`alma_mov_inv_id_activo` bigint NOT NULL,
	`alma_mov_inv_es_logico` BOOLEAN NOT NULL,
	`alma_mov_inv_costo` FLOAT NOT NULL,
	`alma_mov_inv_costo_Dollar` FLOAT NOT NULL,
	`alma_mov_inv_id_puesto` bigint NOT NULL,
	`alma_mov_inv_id_oc` bigint NOT NULL,
	`alma_mov_inv_lote` char(50) NOT NULL,
	`alma_mov_inv_justificacion` char(200) NOT NULL,
	`alma_mov_inv_rif_empresa` char(20) NOT NULL,
	`alma_mov_inv_fecha_caducidad` DATE NOT NULL,
	PRIMARY KEY (`alma_mov_inv_id`)
);

CREATE TABLE `tmp_usuarios` (
	`usuario_id` bigint NOT NULL AUTO_INCREMENT,
	`usuario_cedula` char(9) NOT NULL UNIQUE,
	`usuario_Nombre` char(20) NOT NULL,
	`usuario_Apellido` char(20) NOT NULL,
	`usuario_correo` char(50) NOT NULL UNIQUE,
	`usuario_login` char(50) NOT NULL UNIQUE,
	`usuario_clave` char(50) NOT NULL,
	PRIMARY KEY (`usuario_id`)
);

CREATE TABLE `tmp_productos` (
	`producto_id` bigint NOT NULL AUTO_INCREMENT,
	`prod_tiempo_caduca` char NOT NULL,
	PRIMARY KEY (`producto_id`)
);

CREATE TABLE `Alm_Ubicacion_almacen` (
	`ubic_id` bigint NOT NULL AUTO_INCREMENT,
	`ubic_nombre` char(50) NOT NULL,
	`ubic_descripcion` char(200) NOT NULL,
	`ubic_id_almacen` bigint NOT NULL,
	PRIMARY KEY (`ubic_id`)
);

CREATE TABLE `Alm_Ubicacion_productos` (
	`ubi_pro_ubic_id` bigint NOT NULL,
	`ubi_prod_prod_id` bigint NOT NULL,
	`ubi_prod_notas` char(200) NOT NULL
);

CREATE TABLE `tmp_compras_OC` (
	`oc_id` bigint NOT NULL AUTO_INCREMENT,
	`oc_numero` char(20) NOT NULL UNIQUE,
	`oc_rif_empresa` char(20) NOT NULL,
	`oc_id_gerencia` bigint NOT NULL,
	`oc_id_solped` bigint NOT NULL,
	`oc_id_ticket` bigint NOT NULL,
	`oc_id_producto` bigint NOT NULL,
	`oc_cantidad_solicitada` FLOAT NOT NULL,
	`oc_cantidad_encontrada` FLOAT NOT NULL,
	`oc_Rif_proveedor` char(20) NOT NULL,
	`oc_precio_unitario` FLOAT NOT NULL,
	`oc_notas` char(200) NOT NULL,
	`oc_aprobado` BOOLEAN NOT NULL,
	`oc_validado` BOOLEAN NOT NULL,
	`oc_id_activo` bigint NOT NULL,
	PRIMARY KEY (`oc_id`)
);

CREATE TABLE `Alm_tipo_movimiento` (
	`alm_tipo_mov_id` bigint NOT NULL UNIQUE,
	`alm_tipo_mov_nombre` char(50) NOT NULL
);

ALTER TABLE `Alm_Almacenes` ADD CONSTRAINT `Alm_Almacenes_fk0` FOREIGN KEY (`almacen_id_padre`) REFERENCES `Alm_Almacenes`(`almacen_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk0` FOREIGN KEY (`alma_mov_inv_tipo`) REFERENCES `Alm_tipo_movimiento`(`alm_tipo_mov_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk1` FOREIGN KEY (`alma_mov_inv_id_producto`) REFERENCES `tmp_productos`(`producto_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk2` FOREIGN KEY (`alma_mov_inv_id_almacen_origen`) REFERENCES `Alm_Almacenes`(`almacen_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk3` FOREIGN KEY (`alma_mov_inv_id_almacen_destino`) REFERENCES `Alm_Almacenes`(`almacen_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk4` FOREIGN KEY (`alma_mov_inv_id_usuario_proceso`) REFERENCES `tmp_usuarios`(`usuario_id`);

ALTER TABLE `Alm_mov_inventario` ADD CONSTRAINT `Alm_mov_inventario_fk5` FOREIGN KEY (`alma_mov_inv_id_usuario_aprobo`) REFERENCES `tmp_usuarios`(`usuario_id`);

ALTER TABLE `Alm_Ubicacion_almacen` ADD CONSTRAINT `Alm_Ubicacion_almacen_fk0` FOREIGN KEY (`ubic_id_almacen`) REFERENCES `Alm_Almacenes`(`almacen_id`);

ALTER TABLE `Alm_Ubicacion_productos` ADD CONSTRAINT `Alm_Ubicacion_productos_fk0` FOREIGN KEY (`ubi_pro_ubic_id`) REFERENCES `Alm_Ubicacion_almacen`(`ubic_id`);

ALTER TABLE `Alm_Ubicacion_productos` ADD CONSTRAINT `Alm_Ubicacion_productos_fk1` FOREIGN KEY (`ubi_prod_prod_id`) REFERENCES `tmp_productos`(`producto_id`);

ALTER TABLE `tmp_compras_OC` ADD CONSTRAINT `tmp_compras_OC_fk0` FOREIGN KEY (`oc_id_producto`) REFERENCES `tmp_productos`(`producto_id`);

