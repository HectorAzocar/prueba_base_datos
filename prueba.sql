CREATE DATABASE prueba;

\c prueba;

CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20),
    rut VARCHAR(20),
    direcion VARCHAR(50)
);

CREATE TABLE facturas(
    id INT PRIMARY KEY,
    fecha_factura DATE,
    id_clientes INT UNIQUE REFERENCES clientes(id)
);

CREATE TABLE categorias(
    id SERIAL PRIMARY KEY,
    nombre_categorias VARCHAR(20),
    descripcion VARCHAR(30)
);

CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20),
    descripcion VARCHAR(30),
    valor_unitario INT,
    id_categorias INT UNIQUE REFERENCES categorias(id)
);

CREATE TABLE detalle_facturas(
    id_factura INT REFERENCES facturas(id),
    id_listado_productos INT REFERENCES productos(id),
    cantidad INT,
    subtotal INT,
    iva INT,
    total INT
);

INSERT INTO clientes(nombre, rut, direcion) VALUES('hector', '200001237', 'santiago');
INSERT INTO clientes(nombre, rut, direcion) VALUES('maria', '200601236', 'las condes');
INSERT INTO clientes(nombre, rut, direcion) VALUES('claudio', '200000000', 'ñuñoa');
INSERT INTO clientes(nombre, rut, direcion) VALUES('diego', '255285327', 'san miguel');
INSERT INTO clientes(nombre, rut, direcion) VALUES('daniela', '2000014567', 'vitacura');

INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('camisa', 'algodon', '20000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('pantalon', 'algodon', '25000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('sandalias', 'cuero', '30000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('zapatos', 'cuero', '40000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('reloj', 'oro', '50000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('pulsera', 'oro', '30000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('chaqueta', 'algodon', '35000');
INSERT INTO productos(nombre, descripcion, valor_unitario) VALUES('cartera', 'cuero', 'cartera');

INSERT INTO categorias(nombre_categorias, descripcion) VALUES('ropa', 'deportiva y casual');
INSERT INTO categorias(nombre_categorias, descripcion) VALUES('calsado', 'deportivos y casual');
INSERT INTO categorias(nombre_categorias, descripcion) VALUES('accesorios', 'artesanales');

INSERT INTO facturas(id, fecha_factura) VALUES('1001','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1002','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1003','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1004','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1005','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1006','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1007','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1008','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1009','2021-01-25');
INSERT INTO facturas(id, fecha_factura) VALUES('1010','2021-01-25');

INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('2','40000','7600','46000');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('3','75000','14250','89250');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('3','90000','17100','107100');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('2','30000','5700','35700');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('3','90000','17100','107100');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('1','50000','9500','59500');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('2','80000','15200','95200');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('3','105000','19500','124950');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('4','80000','15200','95200');
INSERT INTO detalle_facturas(cantidad, subtotal, iva, total) VALUES('1','50000','9500','59500');

-- ¿que clientes realizo la compra mas cara?
SELECT detalle_facturas.total, clientes.nombre FROM detalle_facturas INNER JOIN clientes ON detalle_facturas.total = clientes.rut ORDER BY id_listado_productos.total DESC LIMIT 1;
