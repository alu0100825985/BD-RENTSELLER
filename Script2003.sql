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
