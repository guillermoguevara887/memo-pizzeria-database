-- =========================================================
-- MemoDev Studio Database
-- Date 2025-04-28
-- By: Guillermo Guevara


-- DataBase
USE PizzeriaDB;


-- Table Custumers

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100),
    puntos INT DEFAULT 0,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table Products

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN DEFAULT 1
);

-- VENTAS TABLE

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_venta DECIMAL(10,2) NOT NULL,
    puntos_ganados INT DEFAULT 0,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- DETALLES VENTA TABLE

CREATE TABLE DetallesVentas (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL (20,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas (id_venta),
    FOREIGN KEY(id_producto) REFERENCES Productos(id_producto)
);

-- end
