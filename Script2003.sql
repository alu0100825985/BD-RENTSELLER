/* SCRIPT SQL 2003 RENTSELLER */

/* ---------------- Tabla Cliente ---------------- */

CREATE TYPE Cliente AS (
	IdentificadorCliente	NUMBER,
	Email					VARCHAR(50),
	CodigoPostal			NUMBER,
	Direccion				VARCHAR(50),
	Telefono				NUMBER);

CREATE TABLE Tabla_Cliente OF Cliente
(IdentificadorCliente PRIMARY KEY);

/* ---------------- Tabla Particular ---------------- */

CREATE TYPE Particular AS (
	DNI 					VARCHAR(9),
	Nombre					VARCHAR(50),
	Apellidos				VARCHAR(50),
	IdentificadorCliente	REF Cliente,
	Email					REF Cliente,
	CodigoPostal			REF Cliente,
	Direccion				REF Cliente,
	Telefono				REF Cliente);

CREATE TABLE Tabla_Particular OF Particular
(DNI PRIMARY KEY,
IdentificadorCliente NOT NULL);

/* ---------------- Tabla Empresa ---------------- */

CREATE TYPE Empresa AS (
	CIF 					VARCHAR(9),
	Nombre					VARCHAR(50),
	IdentificadorCliente	REF Cliente,
	Email					REF Cliente,
	CodigoPostal			REF Cliente,
	Direccion				REF Cliente,
	Telefono				REF Cliente);

CREATE TABLE Tabla_Empresa OF Empresa
(CIF PRIMARY KEY,
IdentificadorCliente NOT NULL);

/* ---------------- Tabla Trabajador ---------------- */

CREATE TYPE Trabajador AS (
	CIF 					VARCHAR(9),
	CodigoSeguridadSocial   VARCHAR(20),
	Nombre					VARCHAR(50),
	Apellidos				VARCHAR(50),
	IdentificadorCliente	REF Cliente,
	Email					REF Cliente,
	CodigoPostal			REF Cliente,
	Direccion				REF Cliente,
	Telefono				REF Cliente);

CREATE TABLE Tabla_Trabajador OF Trabajador
(CIF PRIMARY KEY,
CodigoSeguridadSocial PRIMARY KEY);

/* ---------------- Tabla Alquilar ---------------- */

CREATE TYPE Alquilar AS (
	CodigoAlquiler		    VARCHAR(20),
	NombreConductor			VARCHAR(50),
	DNIConductor			VARCHAR(9),
	LugarRecepcion			VARCHAR(30),
	LugarDevolucion			VARCHAR(30),
	PrecioAlquiler			NUMBER,
	FechaFin				DATE,
	FechaInicio				DATE,
	Hora					TIME);

CREATE TABLE Tabla_Alquilar OF Alquilar
(CodigoAlquiler PRIMARY KEY);

/* ---------------- Tabla Comprar ---------------- */

CREATE TYPE Comprar AS (
	CodigoCompra		    VARCHAR(20),
	Fecha 					DATE,
	PrecioCompra			NUMBER);

CREATE TABLE Tabla_Comprar OF Comprar
(CodigoCompra PRIMARY KEY);

/* ---------------- Tabla Vehiculo ---------------- */

CREATE TYPE Vehiculo AS (
	CodigoChasis(VIN)		VARCHAR(20),
	Estado 					VARCHAR(10),
	Color					VARCHAR(15),
	Plazo					VARCHAR(15),
	NumeroUsos				NUMBER);

CREATE TABLE Tabla_Vehiculo OF Vehiculo
(CodigoChasis(VIN) PRIMARY KEY);

/* ---------------- Tabla Catalogo ---------------- */

CREATE TYPE Catalogo AS (
	Modelo					VARCHAR(30),
	Marca 					VARCHAR(30),
	NumeroPuertas			NUMBER,
	NumeroAsientos			NUMBER,
	CantidadTotal			NUMBER,
	CantidadDisponible		NUMBER,
	Fianza					REF Deportivo,
	Tipo					REF Caravana,
	PesoMaxCarga			REF Utilitario);

CREATE TYPE Deportivo AS (
	Fianza					NUMBER,
	Modelo					REF Catalogo,
	Marca 					REF Catalogo,
	NumeroPuertas			REF Catalogo,
	NumeroAsientos			REF Catalogo,
	CantidadTotal			REF Catalogo,
	CantidadDisponible		REF Catalogo);

CREATE TYPE Caravana AS (
	Tipo					VARCHAR(15),
	Modelo					REF Catalogo,
	Marca 					REF Catalogo,
	NumeroPuertas			REF Catalogo,
	NumeroAsientos			REF Catalogo,
	CantidadTotal			REF Catalogo,
	CantidadDisponible		REF Catalogo);

CREATE TYPE Utilitario AS (
	PesoMaxCarga			NUMBER,
	Modelo					REF Catalogo,
	Marca 					REF Catalogo,
	NumeroPuertas			REF Catalogo,
	NumeroAsientos			REF Catalogo,
	CantidadTotal			REF Catalogo,
	CantidadDisponible		REF Catalogo);

CREATE TABLE Tabla_Catalogo OF Catalogo
(Modelo PRIMARY KEY,
Fianza	NULL,
Tipo 	NULL,
PesoMaxCarga NULL);

